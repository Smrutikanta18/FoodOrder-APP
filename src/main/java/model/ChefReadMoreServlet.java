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

@WebServlet("/chefReadMore")
public class ChefReadMoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String id=request.getParameter("id");
        try{
            String sql="select * from chef where id=?";
            Connection con= Database.getCon();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs=ps.executeQuery();

            while (rs.next()){
                request.setAttribute("name",rs.getString("name"));
                request.setAttribute("image",rs.getString("image"));
                request.setAttribute("profile",rs.getString("profile"));
                request.setAttribute("desc",rs.getString("desc"));
            }

            String adminsql="select * from admin";
            PreparedStatement ps1=con.prepareStatement(adminsql);
            ResultSet rs5=ps1.executeQuery();

            if(rs5.next()){
                request.setAttribute("phone",rs5.getString("phone"));
                request.setAttribute("email",rs5.getString("email"));
            }

            request.getRequestDispatcher("chefReadMore.jsp").forward(request,response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
