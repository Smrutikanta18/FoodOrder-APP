package model;

import db.Database;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String userId = req.getParameter("id");
        String userCode = URLDecoder.decode(req.getParameter("code"), "UTF-8");

        try {
            Connection con = Database.getCon();
            String query = "SELECT * FROM temp_users WHERE id = ? AND verification_code = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, userId);
            stmt.setString(2, userCode);
            ResultSet rs = stmt.executeQuery();

            System.out.println("userId: " + userId);
            System.out.println("userCode: " + userCode);



            if (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("firstname");
                PreparedStatement ps = con.prepareStatement("INSERT INTO users (firstname, lastname, email, password, number, gender) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, rs.getString("lastname"));
                ps.setString(3, email);
                ps.setString(4, rs.getString("password"));
                ps.setString(5, rs.getString("number"));
                ps.setString(6, rs.getString("gender"));
                ps.executeUpdate();

                PreparedStatement delStmt = con.prepareStatement("DELETE FROM temp_users WHERE id = ?");
                delStmt.setString(1, userId);
                delStmt.executeUpdate();

                req.setAttribute("name", name);
                req.getRequestDispatcher("display.jsp").forward(req,res);
            } else {
                res.sendRedirect("verification-failed.jsp");
            }


        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error occurred", e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

