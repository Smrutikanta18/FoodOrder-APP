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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/placed")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    List<Order> orders = new ArrayList<>();
    List<Order> orderList = new ArrayList<>();
    int userId;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uemail = request.getParameter("uemail");
        Connection con = null;
        PreparedStatement psTempOrder = null;
        PreparedStatement psInsertOrder = null;
        PreparedStatement psDeleteTempOrder = null;
        PreparedStatement psDeleteCart=null;
        ResultSet rs = null;



        try {
            String fetchSql = "SELECT * FROM temp_order WHERE uemail = ?";
            con = Database.getCon();
            psTempOrder = con.prepareStatement(fetchSql);
            psTempOrder.setString(1, uemail);
            rs = psTempOrder.executeQuery();

            String insertSql = "INSERT INTO `order` (id, oid, uemail, quantity, date, status, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
            psInsertOrder = con.prepareStatement(insertSql);

            while (rs.next()) {
                int id = rs.getInt("id");
                int oid = rs.getInt("oid");
                String userEmail = rs.getString("uemail");
                int quantity = rs.getInt("quantity");
                Timestamp orderDate = rs.getTimestamp("date");
                String status = rs.getString("status");
                int address = rs.getInt("address");

                psInsertOrder.setInt(1, id);
                psInsertOrder.setInt(2, oid);
                psInsertOrder.setString(3, userEmail);
                psInsertOrder.setInt(4, quantity);
                psInsertOrder.setTimestamp(5, orderDate);
                psInsertOrder.setString(6, status);
                psInsertOrder.setInt(7, address);

                psInsertOrder.executeUpdate();
            }

            String deleteSql = "DELETE FROM temp_order WHERE uemail = ?";
            psDeleteTempOrder = con.prepareStatement(deleteSql);
            psDeleteTempOrder.setString(1, uemail);
            psDeleteTempOrder.executeUpdate();

            String find= "select id from users where email=?";
            PreparedStatement ps=con.prepareStatement(find);
            ps.setString(1,uemail);
            ResultSet rs1= ps.executeQuery();
            if(rs1.next()){
                userId = rs1.getInt("id");
            }

            String deletecart="Delete from cart where uid=?";
            psDeleteCart = con.prepareStatement(deletecart);
            psDeleteCart.setInt(1,userId);
            psDeleteCart.executeUpdate();

            response.sendRedirect("orderPlaced.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error processing orders", e);
        }
    }
}
