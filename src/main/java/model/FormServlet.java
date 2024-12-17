package model;

import db.Database;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.*;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Properties;
import java.util.UUID;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/Form")
public class FormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Timer timer;

    @Override
    public void init() throws ServletException {
        timer = new Timer(true);
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                deleteExpiredUsers();
            }
        }, 0, 10000);
    }

    @Override
    public void destroy() {
        super.destroy();
        if (timer != null) {
            timer.cancel();
        }
    }
    private void deleteExpiredUsers() {
        Connection con = null;
        try {
            con = Database.getCon();
            String sql = "DELETE FROM temp_users WHERE TIMESTAMPDIFF(SECOND, created_at, NOW()) > 60";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String firstname = req.getParameter("first");
        String lastname = req.getParameter("last");
        String phone = req.getParameter("mobile");
        String gender = req.getParameter("gender");

        String verificationCode = UUID.randomUUID().toString();
        String userId = UUID.randomUUID().toString();
        Connection con = null;
        try {
            con = Database.getCon();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            String query="select email from users where email = ?";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,email);
            ResultSet rss = ps.executeQuery();
            if(rss.next()){
                req.setAttribute("error_message", "This email address is already registered.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
                return;
            }

            String sql = "INSERT INTO temp_users (id, firstname, lastname, email, password, number, gender, verification_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement p = con.prepareStatement(sql);
            p.setString(1, userId);
            p.setString(2, firstname);
            p.setString(3, lastname);
            p.setString(4, email);
            p.setString(5, password);
            p.setString(6, phone);
            p.setString(7, gender);
            p.setString(8, verificationCode);
            p.executeUpdate();

            String encodedVerificationCode = URLEncoder.encode(verificationCode, "UTF-8");
            String confirmationLink = "http://localhost:8080/untitled/verify?id=" + userId + "&code=" + encodedVerificationCode;
            sendVerificationEmail(email, confirmationLink, verificationCode);

            req.setAttribute("name", firstname);
            req.getRequestDispatcher("verify.jsp").forward(req, res);
        } catch (SQLIntegrityConstraintViolationException e) {
            req.setAttribute("error_message", "Try after sometime");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        } catch (SQLException e) {
            req.setAttribute("error_message", "This email address is already registered.");
            e.printStackTrace();
            throw new ServletException("Database error occurred", e);
        } catch (Exception e) {
            String query="truncate table temp_users";
            try {
                PreparedStatement sp = con.prepareStatement(query);
                sp.executeUpdate();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            req.setAttribute("error_message", "Sorry try again");
            throw new RuntimeException(e);
        }
    }

    private void sendVerificationEmail(String email, String link, String code) {

        String subject = "Email Verification";
        String body = "Thanks for registering! Please click the link to complete registration: " + link;

        try {
            Message message = new MimeMessage(getSession());
            message.setFrom(new InternetAddress("paridasonu2001@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        return Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                return new jakarta.mail.PasswordAuthentication("paridasonu2001@gmail.com", "vdos qprs tjjs cxpn");
            }
        });
    }
}
