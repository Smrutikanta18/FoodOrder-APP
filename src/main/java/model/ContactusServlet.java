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

@WebServlet("/contactus")
public class ContactusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        // Set response content type to JSON
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        try {
            String sql = "INSERT INTO contactus (username, useremail, subject, message) VALUES (?, ?, ?, ?)";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);

            int result = ps.executeUpdate();
            if (result > 0) {
                // Success: return JSON response with success status and message
                res.getWriter().write("{\"success\": true, \"message\": \"Contact request submitted successfully.\"}");
            } else {
                // Failure: return JSON response with failure status and message
                res.getWriter().write("{\"success\": false, \"message\": \"Error submitting contact request.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // In case of an exception, return a failure JSON response
            res.getWriter().write("{\"success\": false, \"message\": \"Error processing the request.\"}");
        }
    }
}
