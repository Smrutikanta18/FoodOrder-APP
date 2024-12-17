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

@WebServlet("/editInsta")
public class EditInstaservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
        String id=request.getParameter("id");
        System.out.println(id);

        try{
            Connection con= Database.getCon();
            String sql="select * from img where id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,id);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("Id",rs.getInt("id"));
                request.setAttribute("img",rs.getString("img"));
            }

            request.getRequestDispatcher("editInstaImage.jsp").forward(request,res);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
