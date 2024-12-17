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

@WebServlet("/userChangePassword")
public class UserChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String email=request.getParameter("userEmail");
        String password=request.getParameter("currentPassword");
        String newPass=request.getParameter("newPassword");

        try {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String updatePasswordQuery = "UPDATE users SET password = ? WHERE email = ?";
                ps = con.prepareStatement(updatePasswordQuery);
                ps.setString(1, newPass);
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

            request.getRequestDispatcher("changePass.jsp?id="+id).forward(request, response);

        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
