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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/cart-count")
public class CartCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users"); // Check if user is logged in
        int itemCount = 0; // Default item count

        if (user != null) {
            // User is logged in, fetch item count from the database
            itemCount = getCartItemCountFromDatabase(user.getId());
        } else {
            // User is not logged in, fetch item count from session
            HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
            if (sessionCart != null) {
                // Sum all item quantities in session cart
                itemCount = sessionCart.values().stream().mapToInt(Integer::intValue).sum();
            }
        }

        // Return item count as JSON
        response.setContentType("application/json");
        response.getWriter().write("{\"itemCount\": " + itemCount + "}");
    }

    // Method to get the cart item count from the database for logged-in users
    private int getCartItemCountFromDatabase(int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int itemCount = 0;

        try {
            conn = Database.getCon();
            String sql = "SELECT SUM(quantity) AS totalQuantity FROM cart WHERE uid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                itemCount = rs.getInt("totalQuantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return itemCount;
    }
}
