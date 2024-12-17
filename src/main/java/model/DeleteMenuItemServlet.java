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

@WebServlet("/forms/deleteMenuItem")
public class DeleteMenuItemServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            String sql = "DELETE FROM menu_items WHERE id = ?";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));

            int result = ps.executeUpdate();

            String query = "Delete from `order` where id = ? ";
            PreparedStatement ps1 = con.prepareStatement(query);
            ps1.setInt(1,Integer.parseInt(id));

            ps1.executeUpdate();

            if (result > 0) {
                req.setAttribute("successMassage" , "Item deleted");
                res.sendRedirect("addMenuItem.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

