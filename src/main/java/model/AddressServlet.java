package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");
        List<Address> addresses = new ArrayList<>();

        try {
            String sql = "select * from address where u_id=? order by id DESC";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Address address = new Address();
                address.setId(rs.getInt("id"));
                address.setUserId(rs.getInt("u_id"));
                address.setArea(rs.getString("area"));
                address.setLocation(rs.getString("location"));
                address.setPinNo(rs.getString("pinno"));
                address.setPlotNo(rs.getString("plot_no"));
                address.setCity(rs.getString("city"));
                address.setCountry(rs.getString("country"));
                address.setEmail(rs.getString("email"));
                address.setPhone(rs.getString("phone"));
                address.setState(rs.getString("state"));
                address.setFirstName(rs.getString("firstname"));
                address.setLastName(rs.getString("lastname"));
                address.setStreet(rs.getString("street"));
                addresses.add(address);
            }

            session.setAttribute("userAddresses", addresses);
            response.sendRedirect("address.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
