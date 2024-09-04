package model;

import db.Database;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Form")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            String sql = "INSERT INTO users (email, password) VALUES (?, ?)";
            Connection con = Database.getCon();
            PreparedStatement p = con.prepareStatement(sql);
            p.setString(1, email);
            p.setString(2, password);
            p.executeUpdate();

            req.setAttribute("email", email);
            req.setAttribute("password", password);


            req.getRequestDispatcher("display.jsp").forward(req, res);

        } catch (SQLException e) {
            if (e.getSQLState().equals("23000")) {
                req.setAttribute("errorMessage", "This email address is already registered.");
                req.getRequestDispatcher("index.jsp").forward(req, res);
            } else {
                throw new ServletException("Database error occurred", e);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
