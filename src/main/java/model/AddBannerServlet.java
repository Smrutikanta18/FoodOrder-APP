package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/addbanner")
@MultipartConfig()
public class AddBannerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR = "/images";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String desc= request.getParameter("desc");
        Part imagePart = request.getPart("image");
        String image = null;

        try (Connection con = Database.getCon()) {
            if (imagePart != null && imagePart.getSize() > 0) {
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

            String sql = "INSERT INTO banner_img (image, `desc`) VALUES (?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, image);
                ps.setString(2, desc);

                int result = ps.executeUpdate();
                if (result > 0) {
                    request.getSession().setAttribute("successMessage", "Image added successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to add image!");
                }
            }

            response.sendRedirect("NewBanner.jsp");

        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
