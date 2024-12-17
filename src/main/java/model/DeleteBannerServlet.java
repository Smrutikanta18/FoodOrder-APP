package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deleteBanner")
public class DeleteBannerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String image = request.getParameter("image");

        if (idStr != null && image != null) {
            int id = Integer.parseInt(idStr);

            try (Connection con = Database.getCon()) {
                String sql = "DELETE FROM banner_img WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    int result = ps.executeUpdate();

                    if (result > 0) {
                        String imagePath = getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR + File.separator + image;
                        File imageFile = new File(imagePath);
                        if (imageFile.exists()) {
                            imageFile.delete();
                        }
                        request.getSession().setAttribute("successMessage", "Banner deleted successfully!");
                    } else {
                        request.getSession().setAttribute("errorMessage", "Failed to delete banner!");
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            request.getSession().setAttribute("errorMessage", "Invalid request parameters!");
        }

        response.sendRedirect("bannerImages");
    }
}

