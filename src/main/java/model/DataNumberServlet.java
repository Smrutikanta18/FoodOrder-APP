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

@WebServlet("/dataNumber")
public class DataNumberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try{
            Connection con= Database.getCon();
            String sql="select * from data_number";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("id",rs.getInt("id"));
                request.setAttribute("experience",rs.getInt("experience"));
                request.setAttribute("customers",rs.getInt("customers"));
                request.setAttribute("menus",rs.getInt("menus"));
                request.setAttribute("staffs",rs.getInt("staffs"));
                request.setAttribute("image",rs.getString("image"));
            }

            request.getRequestDispatcher("dataNumber.jsp").forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
