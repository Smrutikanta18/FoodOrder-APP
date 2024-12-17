package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/subscribe")
public class SubscribeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        // Set the response content type to JSON
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();

        String email = req.getParameter("email");

        try {
            String sql = "INSERT INTO subscriptions (email) VALUES (?)";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.write("{\"status\": \"success\"}");
            } else {
                out.write("{\"status\": \"error\", \"message\": \"There was an error processing your request.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\": \"error\", \"message\": \"Email already exist\"}");
        } finally {
            out.close();
        }
    }
}
