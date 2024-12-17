package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/checkOut")
public class CheckOutCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");
        HashMap<String, String> addressDetails = (HashMap<String, String>) session.getAttribute("addressDetails");
        if (addressDetails == null) {
            addressDetails = new HashMap<>();
            session.setAttribute("addressDetails", addressDetails);
        }

        List<Cart> carts = new ArrayList<>();
        double totalsum = 0;
        double totalDis= 0;
        double discount= 0;
        double discount2=0;

        try (Connection con = Database.getCon()) {
            if (user != null) {
                int userId = user.getId();

                String cartQuery = "SELECT * FROM cart WHERE uid = ?";
                PreparedStatement cartStmt = con.prepareStatement(cartQuery);
                cartStmt.setInt(1, userId);
                ResultSet cartRs = cartStmt.executeQuery();

                while (cartRs.next()) {
                    int itemId = cartRs.getInt("Id");
                    int quantity = cartRs.getInt("quantity");

                    String menuQuery = "SELECT * FROM menu_items WHERE id = ?";
                    PreparedStatement menuStmt = con.prepareStatement(menuQuery);
                    menuStmt.setInt(1, itemId);
                    ResultSet menuRs = menuStmt.executeQuery();

                    if (menuRs.next()) {
                        Cart cart = new Cart();
                        cart.setId(menuRs.getInt("id"));
                        cart.setName(menuRs.getString("name"));
                        cart.setImageUrl(menuRs.getString("image_url"));
                        cart.setOffer(menuRs.getInt("Offer"));
                        cart.setCartPrice(menuRs.getDouble("price"));
                        double amount = menuRs.getDouble("price") * quantity;
                        double amount1 = menuRs.getDouble("price") * quantity;
                        discount2 +=amount1;

                        if (quantity >= menuRs.getInt("AbovePrice")) {
                            discount = (amount * menuRs.getInt("Offer")) / 100;
                            amount -= discount;
                        }

                        totalsum += amount;
                        totalDis += discount;
                        cart.setDiscount(discount);
                        cart.setPrice(amount);
                        cart.setAbovePrice(menuRs.getInt("AbovePrice"));
                        cart.setCategory(menuRs.getString("category"));
                        cart.setIngredients(menuRs.getString("ingredients"));
                        cart.setQuantity(quantity);

                        carts.add(cart);
                    }
                }

                String addressQuery = "SELECT * FROM address WHERE u_id = ? ORDER BY id DESC LIMIT 1";
                PreparedStatement addressStmt = con.prepareStatement(addressQuery);
                addressStmt.setInt(1, userId);
                ResultSet addressRs = addressStmt.executeQuery();

                if (addressRs.next()) {
                    addressDetails.put("u_id", String.valueOf(addressRs.getInt("u_id")));
                    addressDetails.put("pinNo", addressRs.getString("pinno"));
                    addressDetails.put("location", addressRs.getString("location"));
                    addressDetails.put("area", addressRs.getString("area"));
                    addressDetails.put("plotNo", addressRs.getString("plot_no"));
                    addressDetails.put("firstname", addressRs.getString("firstname"));
                    addressDetails.put("lastname", addressRs.getString("lastname"));
                    addressDetails.put("state", addressRs.getString("state"));
                    addressDetails.put("country", addressRs.getString("country"));
                    addressDetails.put("city", addressRs.getString("city"));
                    addressDetails.put("street", addressRs.getString("street"));
                    addressDetails.put("phone", addressRs.getString("phone"));
                    addressDetails.put("email", addressRs.getString("email"));

                    session.setAttribute("addressDetails", addressDetails);
                }

                session.setAttribute("discount2" ,discount2);
                session.setAttribute("carts", carts);

            } else {
                HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
                if (sessionCart != null) {
                    for (Integer id : sessionCart.keySet()) {
                        int quantity = sessionCart.get(id);

                        String menuQuery = "SELECT * FROM menu_items WHERE id = ?";
                        PreparedStatement menuStmt = con.prepareStatement(menuQuery);
                        menuStmt.setInt(1, id);
                        ResultSet menuRs = menuStmt.executeQuery();

                        if (menuRs.next()) {
                            Cart cart = new Cart();
                            cart.setId(menuRs.getInt("id"));
                            cart.setName(menuRs.getString("name"));
                            cart.setImageUrl(menuRs.getString("image_url"));
                            cart.setOffer(menuRs.getInt("Offer"));
                            cart.setCartPrice(menuRs.getDouble("price"));
                            double amount = menuRs.getDouble("price") * quantity;
                            double amount1 = menuRs.getDouble("price") * quantity;
                            discount2 +=amount1;

                            if (quantity >= menuRs.getInt("AbovePrice")) {
                                discount = (amount * menuRs.getInt("Offer")) / 100;
                                amount -= discount;
                            }

                            totalsum += amount;
                            totalDis += discount;
                            cart.setPrice(amount);
                            cart.setDiscount(discount);
                            cart.setAbovePrice(menuRs.getInt("AbovePrice"));
                            cart.setCategory(menuRs.getString("category"));
                            cart.setIngredients(menuRs.getString("ingredients"));
                            cart.setQuantity(quantity);

                            carts.add(cart);
                        }

                    }
                    session.setAttribute("discount2" ,discount2);
                    session.setAttribute("carts", carts);
                } else {
                    request.setAttribute("message", "Your cart is empty.");
                }
            }

            session.setAttribute("totalsum", totalsum);
            session.setAttribute("discount",totalDis);
            if (addressDetails != null) {
                request.setAttribute("addressDetails", addressDetails);
            }
            response.sendRedirect("checkOut.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load cart data.");
            response.sendRedirect("error.jsp");
        }
    }
}
