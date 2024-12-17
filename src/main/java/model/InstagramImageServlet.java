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

@WebServlet("/instagram")
public class InstagramImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<image> instImages = new ArrayList<>();

        try {
            Connection con = Database.getCon();
            String query = "SELECT * FROM img";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                image instaImage = new image();
                instaImage.setId(rs.getInt("id"));
                instaImage.setImage(rs.getString("img"));
                instImages.add(instaImage);
            }

            request.setAttribute("instagramImage", instImages);

            request.getRequestDispatcher("project_image.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Cannot retrieve banner images", e);
        }
    }
}

