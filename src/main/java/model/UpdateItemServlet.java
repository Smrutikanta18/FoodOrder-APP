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

@WebServlet("/forms/updateMenu")
public class UpdateItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
    String id=request.getParameter("id");
    String menuName = request.getParameter("menuName");
    String menuPrice = request.getParameter("menuPrice");
    String menuIngredients = request.getParameter("menuIngredients");
    String menuImageUrl = request.getParameter("menuImageUrl");
    String menuOffer= request.getParameter("menuOffer");
    String menuAbove= request.getParameter("menuAbove");
    try{
        String updateSql = "UPDATE menu_items SET name = ?, price = ?, ingredients = ?, image_url = ?, Offer = ?, AbovePrice = ? WHERE id = ?";
        Connection con = Database.getCon();
        PreparedStatement ps = con.prepareStatement(updateSql);
        ps.setString(1, menuName);
        ps.setDouble(2, Double.parseDouble(menuPrice));
        ps.setString(3, menuIngredients);
        ps.setString(4, menuImageUrl);
        ps.setInt(5, Integer.parseInt(menuOffer));
        ps.setInt(6, Integer.parseInt(menuAbove));
        ps.setInt(7, Integer.parseInt(id));


        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            response.sendRedirect("addMenuItem.jsp");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
}
}
