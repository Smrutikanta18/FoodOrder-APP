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
import java.util.HashMap;

@WebServlet("/add-to-cart")
public class BeforeCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users"); // Check if user is logged in
        int id = Integer.parseInt(request.getParameter("id"));

        if (user != null) {
            System.out.println("User logged in: " + user.getId());
            // User is logged in, store item in the database
            addToCartInDatabase(user.getId(), id);
        } else {
            // User is not logged in, store item in session cart
            HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
            if (sessionCart == null) {
                sessionCart = new HashMap<>();
            }
            sessionCart.put(id, sessionCart.getOrDefault(id, 0) + 1);
            session.setAttribute("sessionCart", sessionCart);
        }

        response.setContentType("text/plain");
        response.getWriter().write("Item " + id + " added to cart");
    }

    private void addToCartInDatabase(int userId, int itemId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get a connection to the database
            conn = Database.getCon(); // Assume Database is your utility class for DB connection

            // Check if the item already exists in the user's cart
            String checkCartSql = "SELECT quantity FROM cart WHERE uid = ? AND id = ?";
            pstmt = conn.prepareStatement(checkCartSql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, itemId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Item exists, update quantity
                int currentQuantity = rs.getInt("quantity");
                String updateSql = "UPDATE cart SET quantity = ? WHERE uid = ? AND id = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setInt(1, currentQuantity + 1); // Increment quantity
                pstmt.setInt(2, userId);
                pstmt.setInt(3, itemId);
                pstmt.executeUpdate();
            } else {
                // Item does not exist, insert new record
                String insertSql = "INSERT INTO cart (uid, id, quantity) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setInt(1, userId);
                pstmt.setInt(2, itemId);
                pstmt.setInt(3, 1); // Starting quantity
                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
