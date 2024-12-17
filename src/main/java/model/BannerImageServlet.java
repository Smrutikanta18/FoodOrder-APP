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

@WebServlet("/bannerImages")
public class BannerImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BannerImage> bannerImages = new ArrayList<>();

        try {
            Connection con = Database.getCon();
            String query = "SELECT * FROM banner_img";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BannerImage bannerImage = new BannerImage();
                bannerImage.setId(rs.getInt("id"));
                bannerImage.setImage(rs.getString("image"));
                bannerImage.setDesc(rs.getString("desc"));
                bannerImages.add(bannerImage);
            }

            request.setAttribute("bannerImages", bannerImages);

            request.getRequestDispatcher("banner_image.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Cannot retrieve banner images", e);
        }
    }
}
