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

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int userid= Integer.parseInt(request.getParameter("id"));
        System.out.println(userid);
        UsersData user=new UsersData();

        try{
            Connection con = Database.getCon();
            String sql="select * from users where id = ?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,userid);
            ResultSet rs= ps.executeQuery();

            if(rs.next()){
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setNumber(rs.getString("number"));
                user.setGender(rs.getString("gender"));
            }

            request.getSession().setAttribute("users",user);
            response.sendRedirect("userProfile.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
