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

@WebServlet("/about")
public class AboutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    List<image> images = new ArrayList<>();
    List<Chef> chefs=new ArrayList<>();

    try{
        Connection con= Database.getCon();

        String adminsql="select * from admin";
        PreparedStatement ps=con.prepareStatement(adminsql);
        ResultSet rs=ps.executeQuery();

        if(rs.next()){
            request.setAttribute("phone",rs.getString("phone"));
            request.setAttribute("email",rs.getString("email"));
        }

        String chefQuery="select * from chef";
        PreparedStatement psChef=con.prepareStatement(chefQuery);
        ResultSet rsChef= psChef.executeQuery();

        while(rsChef.next()){
            Chef chef=new Chef();
            chef.setId(rsChef.getInt("id"));
            chef.setName(rsChef.getString("name"));
            chef.setProfile(rsChef.getString("profile"));
            chef.setImage(rsChef.getString("image"));
            chef.setDesc(rsChef.getString("desc"));

            chefs.add(chef);
        }



        String query = "SELECT id, img FROM img WHERE id BETWEEN 2 AND 7";
        PreparedStatement ps1 = con.prepareStatement(query);
        ResultSet rs2 = ps1.executeQuery();

        while (rs2.next()) {
            image img = new image();
            img.setId(rs2.getInt("id"));
            img.setImage(rs2.getString("img"));
            images.add(img);
        }

        String sql="SELECT id, img FROM img WHERE id = 1";
        PreparedStatement ps2 = con.prepareStatement(sql);
        ResultSet rs3 = ps2.executeQuery();
        if(rs3.next()){
            request.setAttribute("image1",rs3.getString("img"));
        }

        String datasql="select * from data_number";
        PreparedStatement psData=con.prepareStatement(datasql);
        ResultSet rsData=psData.executeQuery();

        while (rsData.next()){
            request.setAttribute("experience",rsData.getInt("experience"));
            request.setAttribute("customers",rsData.getInt("customers"));
            request.setAttribute("menus",rsData.getInt("menus"));
            request.setAttribute("staffs",rsData.getInt("staffs"));
            request.setAttribute("dataImage",rsData.getString("image"));
        }


    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    request.setAttribute("images", images);
    request.setAttribute("chefs",chefs);
    request.getRequestDispatcher("about.jsp").forward(request, response);
}
}
