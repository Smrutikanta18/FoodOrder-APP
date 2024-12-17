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

@WebServlet("/editProfile")
public class ProfileDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            String sql="select * from admin";
            Connection con = Database.getCon();
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("firstname",rs.getString("firstname"));
                request.setAttribute("lastname",rs.getString("lastname"));
                request.setAttribute("email",rs.getString("email"));
                request.setAttribute("phone",rs.getString("phone"));
                request.setAttribute("id",rs.getInt("admin_id"));
                request.setAttribute("image",rs.getString("image"));
            }

            request.getRequestDispatcher("editProfile.jsp").forward(request,response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
