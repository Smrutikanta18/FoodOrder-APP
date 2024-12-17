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


@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
           String email= req.getParameter("email");
           String password= req.getParameter("password");


            try{
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                Connection con = Database.getCon();
                PreparedStatement p = con.prepareStatement(sql);
                p.setString(1, email);
                p.setString(2, password);

                ResultSet rs = p.executeQuery();

                if (rs.next()) {
                    HttpSession session = req.getSession();
                    session.setAttribute("firstname", rs.getString("firstname"));
                    session.setAttribute("lastname", rs.getString("lastname"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("phone", rs.getString("number"));
                    session.setAttribute("gender", rs.getString("gender"));
                    req.getRequestDispatcher("contact.jsp").forward(req, res);
                } else {
                    req.setAttribute("errorMessage", "Invalid email or password.");
                    req.getRequestDispatcher("login.jsp").forward(req, res);
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
            }

    }
}
