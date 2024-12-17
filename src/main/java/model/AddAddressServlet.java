package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addAddress")
public class AddAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String location = request.getParameter("location");
        String area = request.getParameter("area");
        String pinNo= request.getParameter("pinno");
        String plotNo= request.getParameter("plotNo");
        String firstname=request.getParameter("firstName");
        String lastname=request.getParameter("lastName");
        String email=request.getParameter("email");
        String state =request.getParameter("state");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String street=request.getParameter("street");
        String phone=request.getParameter("phone");
        UsersData user = (UsersData) request.getSession().getAttribute("users");


        try{
            Connection con = Database.getCon();
            String sql = " INSERT INTO address (`u_id`, `pinno`, `location`, `area` ,`plot_no`,`firstname`,`lastname`,`state`,`country`,`city`,`street`,`phone` ,`email`) VALUES (?, ?, ?, ?, ?,?,?,?,?,?,?,?,?) ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,userId);
            ps.setString(2,pinNo);
            ps.setString(3,location);
            ps.setString(4,area);
            ps.setString(5,plotNo);
            ps.setString(6,firstname);
            ps.setString(7,lastname);
            ps.setString(8,state);
            ps.setString(9,country);
            ps.setString(10,city);
            ps.setString(11,street);
            ps.setString(12,phone);
            ps.setString(13,email);

            int result = ps.executeUpdate();

            if(result > 0){

            }

            response.sendRedirect("address");


        } catch (Exception e) {
            try {
                Connection con=Database.getCon();
                String sql1="delete from temp_order where uemail=?";
                PreparedStatement ps1= con.prepareStatement(sql1);
                ps1.setString(1, user.getEmail());
                ps1.executeUpdate();
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);

        }


    }
}
