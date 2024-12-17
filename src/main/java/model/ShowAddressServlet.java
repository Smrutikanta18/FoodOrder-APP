package model;

import com.google.gson.Gson;
import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/showAddress")
public class ShowAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Address address = null;

        try {
            Connection conn = Database.getCon();
            String sql = "SELECT * FROM address WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                address = new Address();
                address.setId(rs.getInt("id"));
                address.setUserId(rs.getInt("u_id"));
                address.setFirstName(rs.getString("firstname"));
                address.setLastName(rs.getString("lastname"));
                address.setStreet(rs.getString("street"));
                address.setArea(rs.getString("area"));
                address.setCity(rs.getString("city"));
                address.setState(rs.getString("state"));
                address.setCountry(rs.getString("country"));
                address.setPinNo(rs.getString("pinno"));
                address.setPlotNo(rs.getString("plot_no"));
                address.setEmail(rs.getString("email"));
                address.setPhone(rs.getString("phone"));
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            out.print(gson.toJson(address));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving address");

        }
    }
}
