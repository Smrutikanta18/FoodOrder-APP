package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");

        // Check if user is logged in
        if (user != null) {
            // User is logged in, remove from the database
            String userEmail = user.getEmail();
            int itemId = Integer.parseInt(request.getParameter("id"));

            // Remove from the cart table in the database
            try (Connection conn = Database.getCon()) {
                String query = "DELETE FROM cart WHERE uid = ? AND id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, user.getId()); // Assuming 'user' has an 'id' field that maps to uid in the cart table
                    stmt.setInt(2, itemId);
                    stmt.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while removing item.");
                return;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            // User is not logged in, remove from the session cart
            HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
            if (sessionCart != null) {
                int itemId = Integer.parseInt(request.getParameter("id"));
                sessionCart.remove(itemId);
                session.setAttribute("sessionCart", sessionCart);
            }
        }

        // Redirect back to the cart page
        response.sendRedirect("cart");
    }
}
