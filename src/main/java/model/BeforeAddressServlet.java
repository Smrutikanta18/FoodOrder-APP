package model;

import com.google.gson.Gson;
import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;

@WebServlet("/addBeforeLogin")
public class BeforeAddressServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");

        String location = request.getParameter("location1");
        String area = request.getParameter("area1");
        String pinNo = request.getParameter("pinno1");
        String plotNo = request.getParameter("plotNo1");
        String firstname = request.getParameter("firstName1");
        String lastname = request.getParameter("lastName1");
        String email = request.getParameter("email1");
        String state = request.getParameter("state1");
        String city = request.getParameter("city1");
        String country = request.getParameter("country1");
        String street = request.getParameter("street1");
        String phone = request.getParameter("phone1");

        HashMap<String, String> addressDetails = new HashMap<>();

        try {
            if (user != null) {
                int userId = user.getId();
                Connection con = Database.getCon();
                String sql = "INSERT INTO address (u_id, pinno, location, area, plot_no, firstname, lastname, state, country, city, street, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setString(2, pinNo);
                ps.setString(3, location);
                ps.setString(4, area);
                ps.setString(5, plotNo);
                ps.setString(6, firstname);
                ps.setString(7, lastname);
                ps.setString(8, state);
                ps.setString(9, country);
                ps.setString(10, city);
                ps.setString(11, street);
                ps.setString(12, phone);
                ps.setString(13, email);

                int result = ps.executeUpdate();

                if (result > 0) {
                    System.out.println("Address added successfully to the database.");
                }

                addressDetails.put("pinNo", pinNo);
                addressDetails.put("location", location);
                addressDetails.put("area", area);
                addressDetails.put("plotNo", plotNo);
                addressDetails.put("firstname", firstname);
                addressDetails.put("lastname", lastname);
                addressDetails.put("state", state);
                addressDetails.put("country", country);
                addressDetails.put("city", city);
                addressDetails.put("street", street);
                addressDetails.put("phone", phone);
                addressDetails.put("email", email);

            } else {
                addressDetails.put("pinNo", pinNo);
                addressDetails.put("location", location);
                addressDetails.put("area", area);
                addressDetails.put("plotNo", plotNo);
                addressDetails.put("firstname", firstname);
                addressDetails.put("lastname", lastname);
                addressDetails.put("state", state);
                addressDetails.put("country", country);
                addressDetails.put("city", city);
                addressDetails.put("street", street);
                addressDetails.put("phone", phone);
                addressDetails.put("email", email);

                session.setAttribute("addressDetails", addressDetails);
                System.out.println("Address details stored in session.");
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            out.print(new Gson().toJson(addressDetails));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error adding address", e);
        }
    }
}
