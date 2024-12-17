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
@WebServlet("/clearTempOrder")
public class BackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        UsersData user = (UsersData) request.getSession().getAttribute("users");
        try{
            String sql="delete from temp_order where uemail=?";
            Connection con= Database.getCon();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.executeUpdate();

            response.sendRedirect("cart");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
