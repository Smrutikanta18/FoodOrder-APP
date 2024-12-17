package model;
import db.Database;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/forms/updateMenuItem")
public class UpdateMenuItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");


        try {
            Connection con = Database.getCon();
            String query = "SELECT * FROM menu_items WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);


            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("price", rs.getDouble("price"));
                request.setAttribute("ingredients", rs.getString("ingredients"));
                request.setAttribute("imageUrl", rs.getString("image_Url"));
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("offer", rs.getString("Offer"));
                request.setAttribute("abovePrice", rs.getString("AbovePrice"));
            }
            RequestDispatcher rd = request.getRequestDispatcher("updateMenuItem.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

