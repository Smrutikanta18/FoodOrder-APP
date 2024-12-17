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

@WebServlet("/readMore")
public class ReadMoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<image> images = new ArrayList<>();
        String id=request.getParameter("id");

        try{
            Connection con= Database.getCon();

            String sqll="select * from menu_items where id = ? ";
            PreparedStatement pss=con.prepareStatement(sqll);
            pss.setInt(1, Integer.parseInt(id));
            ResultSet rss=pss.executeQuery();

            if(rss.next()){
                request.setAttribute("id",rss.getInt("id"));
                request.setAttribute("name", rss.getString("name"));
                request.setAttribute("price", rss.getDouble("price"));
                request.setAttribute("image", rss.getString("image_url"));
                request.setAttribute("descr",rss.getString("ingredients"));
                request.setAttribute("category",rss.getString("category"));
                request.setAttribute("offer", rss.getInt("Offer"));
                request.setAttribute("abovePrice",rss.getInt("AbovePrice"));
            }

            String adminsql="select * from admin";
            PreparedStatement ps=con.prepareStatement(adminsql);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("phone",rs.getString("phone"));
                request.setAttribute("email",rs.getString("email"));
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


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("images", images);
        request.getRequestDispatcher("readMore.jsp").forward(request, response);
    }
}
