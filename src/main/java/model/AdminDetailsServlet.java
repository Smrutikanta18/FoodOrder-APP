package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/tables/tables")
public class AdminDetailsServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<UsersData> users = new ArrayList<>();
        List<Subscriber> subscribers=new ArrayList<>();
        List<Contact> contacts=new ArrayList<>();

        try {
            Connection con = Database.getCon();

            String userSql = "SELECT * FROM users ORDER BY created_at DESC";
            PreparedStatement userStmt = con.prepareStatement(userSql);
            ResultSet userRs = userStmt.executeQuery();
            while (userRs.next()) {
                UsersData user = new UsersData();
                user.setFirstName(userRs.getString("firstname"));
                user.setLastName(userRs.getString("lastname"));
                user.setEmail(userRs.getString("email"));
                user.setNumber(userRs.getString("number"));
                user.setGender(userRs.getString("gender"));

                users.add(user);
            }
            String subscriberSql = "SELECT * \n" +
                    "FROM subscriptions\n" +
                    "ORDER BY created_at DESC;\n";
            PreparedStatement subscriberStmt = con.prepareStatement(subscriberSql);
            ResultSet subscriberRs = subscriberStmt.executeQuery();
            while (subscriberRs.next()) {
                Subscriber subscriber = new Subscriber();
                subscriber.setEmail(subscriberRs.getString("email"));
                subscribers.add(subscriber);
            }

            String contactSql = "SELECT * FROM contactus ORDER BY created_at DESC";
            PreparedStatement contactStmt = con.prepareStatement(contactSql);
            ResultSet contactRs = contactStmt.executeQuery();
            while (contactRs.next()) {
                Contact contact = new Contact();
                contact.setUsername(contactRs.getString("username"));
                contact.setUseremail(contactRs.getString("useremail"));
                contact.setSubject(contactRs.getString("subject"));
                contact.setMessage(contactRs.getString("message"));
                contacts.add(contact);
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("users", users);
        request.setAttribute("subscribers", subscribers);
        request.setAttribute("contacts",contacts);

        request.getRequestDispatcher("tables.jsp").forward(request, response);
    }

}

