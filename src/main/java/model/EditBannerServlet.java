package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/editbannerimage")
@MultipartConfig()
public class EditBannerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("imageId"));
        String desc = request.getParameter("desc");
        Part imagePart = request.getPart("image");
        String image = null;

        try (Connection con = Database.getCon()) {
            String selectSQL = "SELECT image FROM banner_img WHERE id = ?";
            try (PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {
                selectStmt.setInt(1, id);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        String currentImage = rs.getString("image");

                        if (imagePart == null || imagePart.getSize() == 0) {
                            image = currentImage;
                        } else {
                            String currentImagePath = getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR + File.separator + currentImage;
                            File oldImageFile = new File(currentImagePath);
                            if (oldImageFile.exists()) {
                                oldImageFile.delete();
                            }

                            String fileName = imagePart.getSubmittedFileName();
                            String uploadPath = getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR;

                            File uploadDir = new File(uploadPath);
                            if (!uploadDir.exists()) {
                                uploadDir.mkdir();
                            }

                            String filePath = uploadPath + File.separator + fileName;
                            imagePart.write(filePath);

                            image = fileName;
                        }
                    }
                }
            }


            String sql = "UPDATE banner_img SET image = ?, `desc` = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, image);
                ps.setString(2, desc);
                ps.setInt(3, id);

                int result = ps.executeUpdate();
                if (result > 0) {
                    request.getSession().setAttribute("successMessage", "Banner image updated successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to update banner image!");
                }
            }


            response.sendRedirect("editbanner?id="+id);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
