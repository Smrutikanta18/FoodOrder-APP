package model;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import db.Database;

@WebServlet("/profileUpdated")
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Part imagePart = request.getPart("image");

        String image = null;

        try (Connection conn = Database.getCon()) {
            String selectSQL = "SELECT image FROM admin WHERE admin_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSQL)) {
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

            String updateSQL = "UPDATE admin SET firstname = ?, lastname = ?, email = ?, phone = ?, image = ? WHERE admin_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateSQL)) {
                stmt.setString(1, firstname);
                stmt.setString(2, lastname);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setString(5, image);
                stmt.setInt(6, id);

                stmt.executeUpdate();

                request.getSession().setAttribute("firstname", firstname);
                request.getSession().setAttribute("lastname", lastname);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("phone", phone);
                String imagePath = "images/" + image;
                request.getSession().setAttribute("image", imagePath);

                response.sendRedirect("profile?id="+id);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
