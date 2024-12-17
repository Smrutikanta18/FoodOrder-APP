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

@WebServlet("/updateExperienceData")
@MultipartConfig
public class updateExperienceDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR="/images";
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String id=request.getParameter("id");
        String experience=request.getParameter("experience");
        String customers=request.getParameter("customers");
        String menus=request.getParameter("menus");
        String staffs=request.getParameter("staffs");
        Part imagePart=request.getPart("image");

        String image=null;
        try (Connection con = Database.getCon()) {
            String selectSQL = "SELECT image FROM data_number WHERE id = ?";
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


            String sql = "UPDATE data_number SET experience = ?, customers = ?, menus = ?, staffs = ?, image = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(experience));
                ps.setInt(2, Integer.parseInt(customers));
                ps.setInt(3, Integer.parseInt(menus));
                ps.setInt(4, Integer.parseInt(staffs));
                ps.setString(5, image);
                ps.setInt(6, Integer.parseInt(id));

                int result = ps.executeUpdate();
                if (result > 0) {
                    request.getSession().setAttribute("successMessage", " updated successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to update !");
                }
            }


            response.sendRedirect("editExperience.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
