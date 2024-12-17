package model;

import com.google.gson.Gson;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/searchItem")
public class SearchItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        String data = request.getParameter("mealType");
        List<MenuItem> filteredItems = new ArrayList<>();

        List<MenuItem> allItems = new ArrayList<>();
        try{
            Connection con = Database.getCon();
            String sql="select * from menu_items where category = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, data);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                MenuItem menuItem = new MenuItem();
                menuItem.setName(rs.getString("name"));
                menuItem.setPrice(rs.getDouble("price"));
                menuItem.setAbovePrice(rs.getInt("AbovePrice"));
                menuItem.setId(rs.getInt("id"));
                menuItem.setOffer(rs.getInt("Offer"));
                menuItem.setIngredients(rs.getString("ingredients"));
                menuItem.setImageUrl(rs.getString("image_url"));
                menuItem.setCategory(rs.getString("category"));

                allItems.add(menuItem);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        if (query != null && !query.isEmpty()) {
            for (MenuItem item : allItems) {
                if (item.getName().toLowerCase().contains(query.toLowerCase())) {
                    filteredItems.add(item);
                }
            }
        } else {
            filteredItems = allItems;
        }

        Gson gson = new Gson();
        String jsonResponse = gson.toJson(filteredItems);
        System.out.println(jsonResponse);
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }
}
