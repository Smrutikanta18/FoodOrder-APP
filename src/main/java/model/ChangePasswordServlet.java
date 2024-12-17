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

@WebServlet("/changePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, currentPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String updatePasswordQuery = "UPDATE admin SET password = ? WHERE email = ?";
                ps = con.prepareStatement(updatePasswordQuery);
                ps.setString(1, newPassword);
                ps.setString(2, email);
                int rowUpdated = ps.executeUpdate();

                if (rowUpdated > 0) {
                    request.setAttribute("successMessage", "Password changed successfully.");
                } else {
                    request.setAttribute("errorMessage", "Error updating password. Please try again.");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid email or current password.");
            }

            request.getRequestDispatcher("icon-menu.jsp").forward(request, response);

        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
