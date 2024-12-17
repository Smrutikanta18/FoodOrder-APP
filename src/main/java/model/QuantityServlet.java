package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/quantity-inc-dec")
public class QuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");

        // Check if user is logged in
        UsersData user = (UsersData) session.getAttribute("users");
        if (user != null) {
            // User is logged in, update the quantity in the database
            updateQuantityInDatabase(action, id, user.getId());
        } else {
            // User is not logged in, update the session cart
            if (sessionCart == null) {
                sessionCart = new HashMap<>();
                session.setAttribute("sessionCart", sessionCart);
            }

            updateQuantityInSessionCart(sessionCart, action, id);
        }

        // Return the updated quantity as JSON response
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write("{\"newQuantity\":" + (user != null ? getQuantityFromDatabase(id, user.getId()) : sessionCart.getOrDefault(id, 0)) + "}");
        out.flush();
    }

    private void updateQuantityInSessionCart(HashMap<Integer, Integer> sessionCart, String action, int id) {
        int currentQuantity = sessionCart.getOrDefault(id, 0);
        if ("inc".equals(action)) {
            sessionCart.put(id, currentQuantity + 1);
        } else if ("dec".equals(action) && currentQuantity > 1) {
            sessionCart.put(id, currentQuantity - 1);
        }
    }

    private void updateQuantityInDatabase(String action, int id, int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get a connection to the database
            conn = Database.getCon(); // Assume Database is your utility class for DB connection

            // Prepare SQL to get current quantity
            String getCurrentQtySql = "SELECT quantity FROM cart WHERE uid = ? AND id = ?";
            pstmt = conn.prepareStatement(getCurrentQtySql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, id);
            ResultSet rs = pstmt.executeQuery();

            int currentQuantity = 0;
            if (rs.next()) {
                currentQuantity = rs.getInt("quantity");
            }

            // Update quantity based on the action
            if ("inc".equals(action)) {
                currentQuantity++;
            } else if ("dec".equals(action) && currentQuantity > 1) {
                currentQuantity--;
            }

            // Now update the quantity in the database
            String updateSql = "UPDATE cart SET quantity = ? WHERE uid = ? AND id = ?";
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setInt(1, currentQuantity);
            pstmt.setInt(2, userId);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            // Clean up resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private int getQuantityFromDatabase(int id, int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int quantity = 0;

        try {
            conn = Database.getCon();
            String sql = "SELECT quantity FROM cart WHERE uid = ? AND id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return quantity;
    }
}
