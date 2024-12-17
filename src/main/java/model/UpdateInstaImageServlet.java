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

@WebServlet("/editInstaImage")
@MultipartConfig
public class UpdateInstaImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("instaId"));

        Part imagePart = request.getPart("image");
        String image = null;

        try (Connection con = Database.getCon()) {
            String selectSQL = "SELECT img FROM img WHERE id = ?";
            try (PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {
                selectStmt.setInt(1, id);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        String currentImage = rs.getString("img");

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


            String sql = "UPDATE img SET img = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, image);
                ps.setInt(2, id);

                int result = ps.executeUpdate();
                if (result > 0) {
                    request.getSession().setAttribute("successMessage", "Image updated successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to update image!");
                }
            }


            response.sendRedirect("editInsta?id="+id);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
