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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/chefData")
public class ChefDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Chef> chefs=new ArrayList<>();
        try{
            String sql="select * from chef order by id desc";
            Connection con= Database.getCon();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Chef chef = new Chef();
                chef.setId(rs.getInt("id"));
                chef.setName(rs.getString("name"));
                chef.setProfile(rs.getString("profile"));
                chef.setImage(rs.getString("image"));
                chef.setDesc(rs.getString("desc"));
                chefs.add(chef);
            }

            request.setAttribute("chefs", chefs);

            request.getRequestDispatcher("chefData.jsp").forward(request, response);



        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
