package model;

import db.Database;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/book")
public class ReservationServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");  // Make sure the response is set to JSON
        PrintWriter out = response.getWriter();

        // Check if user is logged in
        UsersData user = (UsersData) request.getSession().getAttribute("users");
        if (user == null) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("status", "error");
            errorResponse.addProperty("message", "User not logged in.");
            out.write(errorResponse.toString());  // Send error response as JSON
            return;
        }

        // Get reservation details from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String bookDate = request.getParameter("date");
        String bookTime = request.getParameter("time");
        String uemail = user.getEmail();
        int personsStr = Integer.parseInt(request.getParameter("persons"));

        // Prepare the response JSON object
        JsonObject responseJson = new JsonObject();

        try {
            Connection con = Database.getCon();
            String sql = "INSERT INTO reservation (name, email, phone, book_date, book_time, persons, uemail) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement p = con.prepareStatement(sql);
            p.setString(1, name);
            p.setString(2, email);
            p.setString(3, phone);
            p.setString(4, bookDate);
            p.setString(5, bookTime);
            p.setInt(6, personsStr);
            p.setString(7, uemail);

            int result = p.executeUpdate();
            if (result > 0) {
                responseJson.addProperty("status", "success");
                responseJson.addProperty("message", "Your Reservation is Done.");
            } else {
                responseJson.addProperty("status", "error");
                responseJson.addProperty("message", "Sorry, Please try again.");
            }

            // Fetch admin info
            String adminsql = "select * from admin";
            PreparedStatement ps = con.prepareStatement(adminsql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("email", rs.getString("email"));
            }

            // Fetch images (for the image section of the reservation page)
            List<image> images = new ArrayList<>();
            String query = "SELECT id, img FROM img WHERE id BETWEEN 2 AND 7";
            PreparedStatement ps1 = con.prepareStatement(query);
            ResultSet rs2 = ps1.executeQuery();
            while (rs2.next()) {
                image img = new image();
                img.setId(rs2.getInt("id"));
                img.setImage(rs2.getString("img"));
                images.add(img);
            }

            String sql1 = "SELECT id, img FROM img WHERE id = 1";
            PreparedStatement ps2 = con.prepareStatement(sql1);
            ResultSet rs3 = ps2.executeQuery();
            if (rs3.next()) {
                request.setAttribute("image1", rs3.getString("img"));
            }

            request.setAttribute("images", images);
            request.getRequestDispatcher("reservation.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            responseJson.addProperty("status", "error");
            responseJson.addProperty("message", "An error occurred. Please try again.");
        }

        // Send the JSON response
        out.write(responseJson.toString());
    }
}
