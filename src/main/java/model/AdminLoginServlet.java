package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/admin_index")
public class AdminLoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        List<UsersData> users = new ArrayList<>();

        try {
            Connection con = Database.getCon();

            String adminSql = "SELECT * FROM admin\n" +
                    "WHERE email = ? AND password = ?;\n";
            PreparedStatement adminStmt = con.prepareStatement(adminSql);
            adminStmt.setString(1,email);
            adminStmt.setString(2,password);
            ResultSet adminRs = adminStmt.executeQuery();

            if (adminRs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("id",adminRs.getInt("admin_id"));
                session.setAttribute("firstname", adminRs.getString("firstname"));
                session.setAttribute("lastname", adminRs.getString("lastname"));
                session.setAttribute("email", adminRs.getString("email"));
                session.setAttribute("phone", adminRs.getString("phone"));
                String imageFileName = adminRs.getString("image");
                String imagePath = "images/" + imageFileName;
                session.setAttribute("image", imagePath);
                session.setAttribute("path",imageFileName);
            }else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            }
            String usersSql = "SELECT * FROM users ORDER BY created_at DESC limit 7";
            PreparedStatement usersStmt = con.prepareStatement(usersSql);
            ResultSet usersRs = usersStmt.executeQuery();
            while (usersRs.next()) {
                UsersData user = new UsersData();
                user.setFirstName(usersRs.getString("firstname"));
                user.setLastName(usersRs.getString("lastname"));
                user.setEmail(usersRs.getString("email"));
                user.setNumber(usersRs.getString("number"));
                user.setGender(usersRs.getString("gender"));

                users.add(user);
            }

            String subscriberSql = "SELECT COUNT(*) AS total_subscribers, GROUP_CONCAT(email) AS subscriber_emails FROM subscriptions";
            PreparedStatement subscriberStmt = con.prepareStatement(subscriberSql);
            ResultSet subscriberRs = subscriberStmt.executeQuery();

            if (subscriberRs.next()) {
                int totalSubscribers = subscriberRs.getInt("total_subscribers");
                String subscriberEmails = subscriberRs.getString("subscriber_emails");

                request.setAttribute("totalSubscribers", totalSubscribers);
                request.setAttribute("subscriberEmails", subscriberEmails);
            }

            String saleSql="select * from sales";
            PreparedStatement pstmt= con.prepareStatement(saleSql);
            ResultSet saleRs=pstmt.executeQuery();

            if(saleRs.next()){
                request.setAttribute("amount",saleRs.getInt("amount"));
            }

            String userSql = "SELECT COUNT(*) AS total_users FROM users";
            PreparedStatement userStmt = con.prepareStatement(userSql);
            ResultSet userRs = userStmt.executeQuery();

            if (userRs.next()) {
                int totalUsers = userRs.getInt("total_users");
                request.setAttribute("totalUsers", totalUsers);
            }

            String reservationSql = "SELECT COUNT(*) AS total_reservations FROM reservation";
            PreparedStatement reservationStmt = con.prepareStatement(reservationSql);
            ResultSet reservationRs = reservationStmt.executeQuery();

            if (reservationRs.next()) {
                int totalReservations = reservationRs.getInt("total_reservations");
                request.setAttribute("totalReservations", totalReservations);
            }
            request.setAttribute("users", users);


            request.getRequestDispatcher("index1.jsp").forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
