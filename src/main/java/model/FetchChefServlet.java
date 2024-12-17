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

@WebServlet("/editChef")
public class FetchChefServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String id = request.getParameter("id");
        try {

                Connection con = Database.getCon();

                String sql = "SELECT * FROM chef where id = ? ";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id));
                ResultSet rs = ps.executeQuery();


                while (rs.next()) {
                    request.setAttribute("id", rs.getInt("id"));
                    request.setAttribute("name", rs.getString("name"));
                    request.setAttribute("profile", rs.getString("profile"));
                    request.setAttribute("images", rs.getString("image"));
                    request.setAttribute("desc", rs.getString("desc"));
                }
                request.getRequestDispatcher("editChef.jsp").forward(request,response);
        } catch (Exception e) {
                throw new RuntimeException(e);
        }
    }
}
