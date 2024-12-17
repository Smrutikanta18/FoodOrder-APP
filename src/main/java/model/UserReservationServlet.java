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
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/userReservation")
public class UserReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        UsersData user = (UsersData) request.getSession().getAttribute("users");
        List<Reservation> reservations=new ArrayList<>();

        try{
            String sql="select * from reservation where uemail = ?";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                Reservation reservation = new Reservation();
                reservation.setPersons(rs.getInt("persons"));
                reservation.setCreated_at(rs.getTimestamp("created_at"));
                reservation.setBook_time(rs.getString("book_time"));
                reservation.setPhone(rs.getString("phone"));
                reservation.setId(rs.getInt("id"));
                reservation.setName(rs.getString("name"));
                reservation.setEmail(rs.getString("email"));
                reservation.setBook_date(rs.getString("book_date"));
                reservation.setUemail(rs.getString("uemail"));
                reservation.setStatus(rs.getString("status"));
                reservations.add(reservation);
            }
            request.setAttribute("reservation",reservations);
            request.getRequestDispatcher("userReservation.jsp").forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
