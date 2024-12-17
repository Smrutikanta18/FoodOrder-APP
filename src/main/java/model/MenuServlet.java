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

@WebServlet("/forms/addMenu")
public class MenuServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
@Override
public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

    String name=req.getParameter("menuName");
    double price= Double.parseDouble(req.getParameter("menuPrice"));
    String ingredients=req.getParameter("menuIngredients");
    String imageUrl=req.getParameter("menuImageUrl");
    String category=req.getParameter("category");
    int offer= Integer.parseInt(req.getParameter("menuOffer"));
    int abovePrice= Integer.parseInt(req.getParameter("menuAbovePrice"));

    try{
        String sql="INSERT INTO menu_items (name, price, ingredients, image_url, category, Offer, AbovePrice) VALUES (?, ?, ?, ?, ?,?,?)";
        Connection con= Database.getCon();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setDouble(2, price);
        ps.setString(3, ingredients);
        ps.setString(4, imageUrl);
        ps.setString(5,category);
        ps.setInt(6, offer);
        ps.setInt(7, abovePrice);

        int result= ps.executeUpdate();
        if (result > 0) {
            req.setAttribute("name", name);
            req.setAttribute("email", price);
            req.setAttribute("subject", ingredients);
            req.setAttribute("message",imageUrl);
            req.setAttribute("category",category);
            req.setAttribute("offer",offer);
            req.setAttribute("abovePrice",abovePrice);
            req.getRequestDispatcher("addMenuItem.jsp").forward(req, res);
        }
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
}
}
