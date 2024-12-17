package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        List<MenuItem> breakfasts = new ArrayList<>();
        List<MenuItem> lunches = new ArrayList<>();
        List<MenuItem> dinners = new ArrayList<>();
        List<MenuItem> disserts = new ArrayList<>();
        List<MenuItem> wine_Cards = new ArrayList<>();
        List<MenuItem> drinks = new ArrayList<>();
        List<BannerImage> banners = new ArrayList<>();
        List<image> images = new ArrayList<>();
        List<Chef> chefs = new ArrayList<>();
        UsersData user = new UsersData();


        try {
            Connection con = Database.getCon();

            String sql = "select * from users WHERE email = ? AND password = ?";
            PreparedStatement psuser = con.prepareStatement(sql);
            psuser.setString(1, email);
            psuser.setString(2, password);
            ResultSet rsuser = psuser.executeQuery();

            if (rsuser.next()) {
                user.setId(rsuser.getInt("id"));
                user.setFirstName(rsuser.getString("firstname"));
                user.setLastName(rsuser.getString("lastname"));
                user.setEmail(rsuser.getString("email"));
                user.setPassword(rsuser.getString("password"));
                user.setNumber(rsuser.getString("number"));
                user.setGender(rsuser.getString("gender"));
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

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

            String bannerSql = "SELECT * FROM banner_img";
            PreparedStatement bannerPs = con.prepareStatement(bannerSql);
            ResultSet bannerRs = bannerPs.executeQuery();

            while (bannerRs.next()) {
                BannerImage banner = new BannerImage();
                banner.setId(bannerRs.getInt("id"));
                banner.setImage(bannerRs.getString("image"));
                banner.setDesc(bannerRs.getString("desc"));
                banners.add(banner);
            }
            String adminsql = "select * from admin";
            PreparedStatement ps = con.prepareStatement(adminsql);
            ResultSet rs5 = ps.executeQuery();

            if (rs5.next()) {
                request.setAttribute("phone", rs5.getString("phone"));
                request.setAttribute("email", rs5.getString("email"));
            }

            String datasql = "select * from data_number";
            PreparedStatement psData = con.prepareStatement(datasql);
            ResultSet rsData = psData.executeQuery();

            while (rsData.next()) {
                request.setAttribute("experience", rsData.getInt("experience"));
                request.setAttribute("customers", rsData.getInt("customers"));
                request.setAttribute("menus", rsData.getInt("menus"));
                request.setAttribute("staffs", rsData.getInt("staffs"));
                request.setAttribute("DatImage", rsData.getString("image"));

            }

            String chefQuery = "select * from chef";
            PreparedStatement psChef = con.prepareStatement(chefQuery);
            ResultSet rsChef = psChef.executeQuery();

            while (rsChef.next()) {
                Chef chef = new Chef();
                chef.setId(rsChef.getInt("id"));
                chef.setName(rsChef.getString("name"));
                chef.setProfile(rsChef.getString("profile"));
                chef.setImage(rsChef.getString("image"));
                chef.setDesc(rsChef.getString("desc"));

                chefs.add(chef);
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

            HttpSession session = request.getSession();
            HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
            if (sessionCart != null) {
                String cart = "INSERT INTO cart (uid, Id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + ?";
                for (Map.Entry<Integer, Integer> entry : sessionCart.entrySet()) {
                    int itemId = entry.getKey();
                    int quantity = entry.getValue();

                    PreparedStatement psssss = con.prepareStatement(cart);
                    psssss.setInt(1, user.getId());
                    psssss.setInt(2, itemId);
                    psssss.setInt(3, quantity);
                    psssss.setInt(4, quantity);
                    psssss.executeUpdate();
                    session.removeAttribute("sessionCart");
                }
            }
            HashMap<String, String> addressDetails = (HashMap<String, String>) session.getAttribute("addressDetails");
            if (addressDetails != null) {
                String pinNo = addressDetails.get("pinNo");
                String location = addressDetails.get("location");
                String area = addressDetails.get("area");
                String plotNo = addressDetails.get("plotNo");
                String firstname = addressDetails.get("firstname");
                String lastname = addressDetails.get("lastname");
                String state = addressDetails.get("state");
                String country = addressDetails.get("country");
                String city = addressDetails.get("city");
                String street = addressDetails.get("street");
                String phone = addressDetails.get("phone");
                String email1 = addressDetails.get("email");

                if (pinNo != null && location != null && area != null && plotNo != null &&
                        firstname != null && lastname != null && state != null && country != null &&
                        city != null && street != null && phone != null && email != null) {

                    String addressQuery = "INSERT INTO address (u_id, pinno, location, area, plot_no, firstname, lastname, state, country, city, street, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pa = con.prepareStatement(addressQuery);
                    pa.setInt(1, user.getId());
                    pa.setString(2, pinNo);
                    pa.setString(3, location);
                    pa.setString(4, area);
                    pa.setString(5, plotNo);
                    pa.setString(6, firstname);
                    pa.setString(7, lastname);
                    pa.setString(8, state);
                    pa.setString(9, country);
                    pa.setString(10, city);
                    pa.setString(11, street);
                    pa.setString(12, phone);
                    pa.setString(13, email1);

                    pa.executeUpdate();
                    session.removeAttribute("addressDetails");

                } else {
                    String tempAddressQuery = "INSERT INTO temp_address (u_id, pinno, location, area, plot_no, firstname, lastname, state, country, city, street, phone, email, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement tempStmt = con.prepareStatement(tempAddressQuery);
                    tempStmt.setInt(1, user.getId());
                    tempStmt.setString(2, pinNo);
                    tempStmt.setString(3, location);
                    tempStmt.setString(4, area);
                    tempStmt.setString(5, plotNo);
                    tempStmt.setString(6, firstname);
                    tempStmt.setString(7, lastname);
                    tempStmt.setString(8, state);
                    tempStmt.setString(9, country);
                    tempStmt.setString(10, city);
                    tempStmt.setString(11, street);
                    tempStmt.setString(12, phone);
                    tempStmt.setString(13, email1);
                    tempStmt.setTimestamp(14, Timestamp.from(Instant.now()));
                    tempStmt.executeUpdate();
                }
            }
            request.getSession().setAttribute("breakfastItems", breakfasts);
            request.getSession().setAttribute("lunchItems", lunches);
            request.getSession().setAttribute("dinnerItems", dinners);
            request.getSession().setAttribute("dessertsItems", disserts);
            request.getSession().setAttribute("wineCardItems", wine_Cards);
            request.getSession().setAttribute("drinksItems", drinks);
            request.getSession().setAttribute("banners", banners);
            request.getSession().setAttribute("images", images);
            request.getSession().setAttribute("chefs", chefs);
            request.getSession().setAttribute("users", user);
            response.sendRedirect("welcome");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}