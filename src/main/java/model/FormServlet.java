package model;

import db.Database;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/Form")
public class FormServlet extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException {
String email=req.getParameter("email");
String password=req.getParameter("password");

try{
    String sql = "INSERT INTO users (email, password) VALUES (?, ?)";
    Connection con= Database.getCon();
    PreparedStatement p=con.prepareStatement(sql);
    p.setString(1,email);
    p.setString(2,password);
    p.executeUpdate();

    PrintWriter pr=res.getWriter();
    pr.println("Submitted");
} catch (Exception e) {
    throw new RuntimeException(e);
}
}
}
