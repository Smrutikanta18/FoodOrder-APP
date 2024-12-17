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

@WebServlet("/updateChef")
@MultipartConfig
public class EditChefServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Part imagePart = request.getPart("image");
        String profile = request.getParameter("profile");
        String desc = request.getParameter("desc");

        String image = null;

        try (Connection con = Database.getCon()) {
            String selectSQL = "SELECT image FROM chef WHERE id = ?";
            try (PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {
                selectStmt.setInt(1, Integer.parseInt(id));
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

            String sql = "UPDATE chef SET name=?, image = ?, `desc`= ?, profile=? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, image);
                ps.setString(3, desc);
                ps.setString(4, profile);
                ps.setInt(5, Integer.parseInt(id));

                int result = ps.executeUpdate();
                if (result > 0) {
                    request.getSession().setAttribute("successMessage", "Chef updated successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to update the chef!");
                }
            }

            response.sendRedirect("editChef?id=" + id);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
