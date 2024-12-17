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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/menu")
public class ShowMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MenuItem> breakfasts = new ArrayList<>();
        List<MenuItem> lunches = new ArrayList<>();
        List<MenuItem> dinners=new ArrayList<>();
        List<MenuItem> disserts=new ArrayList<>();
        List<MenuItem> wine_Cards=new ArrayList<>();
        List<MenuItem> drinks=new ArrayList<>();
        List<image> images = new ArrayList<>();





        try {
            Connection con = Database.getCon();
            String sqlBreakfast = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement psBreakfast = con.prepareStatement(sqlBreakfast);
            psBreakfast.setString(1, "Breakfast");
            ResultSet rsBreakfast = psBreakfast.executeQuery();

            while (rsBreakfast.next()) {
                MenuItem breakfast = new MenuItem();
                breakfast.setId(rsBreakfast.getInt("id"));
                breakfast.setName(rsBreakfast.getString("name"));
                breakfast.setPrice(rsBreakfast.getDouble("price"));
                breakfast.setIngredients(rsBreakfast.getString("ingredients"));
                breakfast.setCategory(rsBreakfast.getString("category"));
                breakfast.setImageUrl(rsBreakfast.getString("image_url"));
                breakfast.setOffer(rsBreakfast.getInt("Offer"));
                breakfast.setAbovePrice(rsBreakfast.getInt("AbovePrice"));
                breakfasts.add(breakfast);
            }

            String adminsql="select * from admin";
            PreparedStatement ps=con.prepareStatement(adminsql);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("phone",rs.getString("phone"));
                request.setAttribute("email",rs.getString("email"));
            }

            String sqlLunch = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement psLunch = con.prepareStatement(sqlLunch);
            psLunch.setString(1, "Lunch");
            ResultSet rsLunch = psLunch.executeQuery();

            while (rsLunch.next()) {
                MenuItem lunch = new MenuItem();
                lunch.setId(rsLunch.getInt("id"));
                lunch.setName(rsLunch.getString("name"));
                lunch.setPrice(rsLunch.getDouble("price"));
                lunch.setIngredients(rsLunch.getString("ingredients"));
                lunch.setCategory(rsLunch.getString("category"));
                lunch.setImageUrl(rsLunch.getString("image_url"));
                lunch.setOffer(rsLunch.getInt("Offer"));
                lunch.setAbovePrice(rsLunch.getInt("AbovePrice"));
                lunches.add(lunch);
            }
            String query = "SELECT id, img FROM img WHERE id BETWEEN 2 AND 7";
            PreparedStatement ps1 = con.prepareStatement(query);
            ResultSet rs2 = ps1.executeQuery();

            while (rs2.next()) {
                image img = new image();
                img.setId(rs2.getInt("id"));
                img.setImage(rs2.getString("img"));
                images.add(img);
            }

            String sql="SELECT id, img FROM img WHERE id = 1";
            PreparedStatement ps2 = con.prepareStatement(sql);
            ResultSet rs3 = ps2.executeQuery();
            if(rs3.next()){
                request.setAttribute("image1",rs3.getString("img"));
            }

            String sqlDinner = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement psDinner = con.prepareStatement(sqlDinner);
            psDinner.setString(1, "Dinner");
            ResultSet rsDinner = psDinner.executeQuery();

            while (rsDinner.next()) {
                MenuItem dinner = new MenuItem();
                dinner.setId(rsDinner.getInt("id"));
                dinner.setName(rsDinner.getString("name"));
                dinner.setPrice(rsDinner.getDouble("price"));
                dinner.setIngredients(rsDinner.getString("ingredients"));
                dinner.setCategory(rsDinner.getString("category"));
                dinner.setImageUrl(rsDinner.getString("image_url"));
                dinner.setOffer(rsDinner.getInt("Offer"));
                dinner.setAbovePrice(rsDinner.getInt("AbovePrice"));
                dinners.add(dinner);
            }

            String sqlDissert = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement psDissert = con.prepareStatement(sqlDissert);
            psDissert.setString(1, "Desserts");
            ResultSet rsDissert = psDissert.executeQuery();

            while (rsDissert.next()) {
                MenuItem dissert = new MenuItem();
                dissert.setId(rsDissert.getInt("id"));
                dissert.setName(rsDissert.getString("name"));
                dissert.setPrice(rsDissert.getDouble("price"));
                dissert.setIngredients(rsDissert.getString("ingredients"));
                dissert.setCategory(rsDissert.getString("category"));
                dissert.setImageUrl(rsDissert.getString("image_url"));
                dissert.setOffer(rsDissert.getInt("Offer"));
                dissert.setAbovePrice(rsDissert.getInt("AbovePrice"));
                disserts.add(dissert);
            }

            String sqlwine = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement pswine = con.prepareStatement(sqlwine);
            pswine.setString(1, "Wine Card");
            ResultSet rswine = pswine.executeQuery();

            while (rswine.next()) {
                MenuItem wine = new MenuItem();
                wine.setId(rswine.getInt("id"));
                wine.setName(rswine.getString("name"));
                wine.setPrice(rswine.getDouble("price"));
                wine.setIngredients(rswine.getString("ingredients"));
                wine.setCategory(rswine.getString("category"));
                wine.setImageUrl(rswine.getString("image_url"));
                wine.setOffer(rswine.getInt("Offer"));
                wine.setAbovePrice(rswine.getInt("AbovePrice"));
                wine_Cards.add(wine);
            }

            String sqlDrink = "SELECT * FROM menu_items WHERE category = ? ORDER BY id DESC";
            PreparedStatement psDrink = con.prepareStatement(sqlDrink);
            psDrink.setString(1, "Drinks");
            ResultSet rsDrink = psDrink.executeQuery();

            while (rsDrink.next()) {
                MenuItem drink = new MenuItem();
                drink.setId(rsDrink.getInt("id"));
                drink.setName(rsDrink.getString("name"));
                drink.setPrice(rsDrink.getDouble("price"));
                drink.setIngredients(rsDrink.getString("ingredients"));
                drink.setCategory(rsDrink.getString("category"));
                drink.setImageUrl(rsDrink.getString("image_url"));
                drink.setOffer(rsDrink.getInt("Offer"));
                drink.setAbovePrice(rsDrink.getInt("AbovePrice"));
                drinks.add(drink);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("breakfastItems", breakfasts);
        request.setAttribute("lunchItems", lunches);
        request.setAttribute("dinnerItems", dinners);
        request.setAttribute("dessertsItems",disserts);
        request.setAttribute("wineCardItems",wine_Cards);
        request.setAttribute("drinksItems",drinks);
        request.setAttribute("images", images);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
