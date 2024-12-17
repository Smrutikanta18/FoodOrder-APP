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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    double totalPrice = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");

        // Session cart for non-logged-in users
        HashMap<Integer, Integer> sessionCart = (HashMap<Integer, Integer>) session.getAttribute("sessionCart");
        ArrayList<Cart> cartList = new ArrayList<>();

        // Initialize variables to store cart data
        List<Cart> carts = new ArrayList<>();
        List<image> pictures = new ArrayList<>();
        double totalAmount = 0; // Total amount after discounts
        double totalDiscount = 0; // Total discount applied


        try {
            Connection con = Database.getCon();

            if (user != null) {  // If the user is logged in
                int userId = user.getId();

                String cartQuery = "SELECT * FROM cart WHERE uid = ? order by created_time desc";
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
                        double itemPrice = menuRs.getDouble("price") * quantity;


                        // Apply offer if quantity exceeds AbovePrice
                        double discount = 0; // Discount for the current item
                        if (quantity >= menuRs.getInt("AbovePrice")) {
                            discount = (itemPrice * menuRs.getInt("Offer")) / 100;
                        }

                        totalPrice += itemPrice;

                        totalAmount += itemPrice - discount; // Update total amount
                        totalDiscount += discount; // Update total discount

                        cart.setPrice(itemPrice - discount); // Set price after discount
                        cart.setAbovePrice(menuRs.getInt("AbovePrice"));
                        cart.setCategory(menuRs.getString("category"));
                        cart.setIngredients(menuRs.getString("ingredients"));
                        cart.setQuantity(quantity);

                        carts.add(cart);
                    }
                }
                session.removeAttribute("sessionCart");

                session.setAttribute("carts", carts);
                session.setAttribute("totalAmount", totalAmount); // Store total amount
                session.setAttribute("totalDiscount", totalDiscount); // Store total discount

            } else if (sessionCart != null) {  // Non-logged-in user cart from session
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
                        double itemPrice = menuRs.getDouble("price") * quantity;
                        double itemTotal = menuRs.getDouble("price")*quantity;

                        double discount = 0; // Discount for the current item
                        if (quantity >= menuRs.getInt("AbovePrice")) {
                            discount = (itemPrice * menuRs.getInt("Offer")) / 100;
                        }

                        totalPrice += itemPrice;

                        totalAmount += itemPrice - discount; // Update total amount
                        totalDiscount += discount; // Update total discount


                        cart.setPrice(itemPrice - discount); // Set price after discount
                        cart.setAbovePrice(menuRs.getInt("AbovePrice"));
                        cart.setCategory(menuRs.getString("category"));
                        cart.setIngredients(menuRs.getString("ingredients"));
                        cart.setQuantity(quantity);

                        carts.add(cart);
                    }
                }

                session.setAttribute("carts", carts);
                session.setAttribute("totalAmount", totalAmount); // Store total amount
                session.setAttribute("totalDiscount", totalDiscount); // Store total discount
                session.setAttribute("totalPrice",totalPrice);

            } else {
                request.setAttribute("message", "Your cart is empty.");
            }

            // Fetch admin contact details
            String adminSql = "SELECT * FROM admin";
            PreparedStatement ps2 = con.prepareStatement(adminSql);
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                session.setAttribute("phone", rs2.getString("phone"));
                session.setAttribute("email", rs2.getString("email"));
            }

            // Fetch pictures for the cart display
            String imgQuery = "SELECT id, img FROM img WHERE id BETWEEN 2 AND 7";
            PreparedStatement ps3 = con.prepareStatement(imgQuery);
            ResultSet imgResults = ps3.executeQuery();
            while (imgResults.next()) {
                image img = new image();
                img.setId(imgResults.getInt("id"));
                img.setImage(imgResults.getString("img"));
                pictures.add(img);
            }

            session.setAttribute("pictures", pictures);

            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load cart data.");
            response.sendRedirect("error.jsp");
        }
    }
}
