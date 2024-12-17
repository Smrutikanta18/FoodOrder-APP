package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/addAmount")
public class AddAmountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amountToAddStr = request.getParameter("amount");

        if (amountToAddStr != null && !amountToAddStr.isEmpty()) {
            try {
                int amountToAdd = Integer.parseInt(amountToAddStr);

                try (Connection con = Database.getCon()) {
                    String selectSQL = "SELECT amount FROM sales WHERE id = 1";
                    try (PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {
                        try (ResultSet rs = selectStmt.executeQuery()) {
                            if (rs.next()) {
                                int currentAmount = rs.getInt("amount");

                                int newAmount = currentAmount + amountToAdd;

                                String updateSQL = "UPDATE sales SET amount = ? WHERE id = 1";
                                try (PreparedStatement updateStmt = con.prepareStatement(updateSQL)) {
                                    updateStmt.setInt(1, newAmount);
                                    updateStmt.executeUpdate();
                                }

                                request.getSession().setAttribute("successMessage", "Amount updated successfully!");
                            }
                        }
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            } catch (Exception e) {
                request.getSession().setAttribute("errorMessage", "Invalid amount input.");
            }
        }

        response.sendRedirect("sales.jsp");
    }
}

