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

@WebServlet("/tables/datatables")
public class ShowReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String fetchQuery = "SELECT * FROM reservation ORDER BY created_at DESC";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(fetchQuery);
            ResultSet rs = ps.executeQuery();

            List<Reservation> reservations = new ArrayList<>();
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id"));
                reservation.setName(rs.getString("name"));
                reservation.setEmail(rs.getString("email"));
                reservation.setPhone(rs.getString("phone"));
                reservation.setBook_date(rs.getString("book_date"));
                reservation.setBook_time(rs.getString("book_time"));
                reservation.setPersons(rs.getInt("persons"));
                reservation.setCreated_at(rs.getTimestamp("created_at"));
                reservation.setStatus(rs.getString("status"));
                reservations.add(reservation);
            }

            request.setAttribute("reservations", reservations);

            request.getRequestDispatcher("datatables.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
