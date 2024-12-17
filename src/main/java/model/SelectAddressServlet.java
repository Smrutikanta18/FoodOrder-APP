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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/selectAddress")
public class SelectAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addressId = request.getParameter("addressId");
        String useremail = request.getParameter("useremail");
        Double totalsum1 = (Double) request.getSession().getAttribute("totalsum");

        System.out.println(totalsum1);

        try (Connection con = Database.getCon()) {
            String query = "SELECT oid FROM temp_order WHERE uemail = ?";
            PreparedStatement pst1 = con.prepareStatement(query);
            pst1.setString(1, useremail);
            ResultSet rs = pst1.executeQuery();

            List<Integer> orderIds = new ArrayList<>();
            while (rs.next()) {
                orderIds.add(rs.getInt("oid"));
            }

            if (!orderIds.isEmpty()) {
                String updateQuery = "UPDATE temp_order SET address = ? WHERE uemail = ? AND oid = ?";
                PreparedStatement pst = con.prepareStatement(updateQuery);

                for (int orderId : orderIds) {
                    pst.setInt(1, Integer.parseInt(addressId));
                    pst.setString(2, useremail);
                    pst.setInt(3, orderId);
                    pst.addBatch();
                }

                pst.executeBatch();

                HttpSession session = request.getSession();
                UsersData user = (UsersData) session.getAttribute("users");
                 String email=   user.getEmail();
                if (user == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                String userEmail = user.getEmail();
                HashMap<String, ArrayList<Cart>> userCartMap = (HashMap<String, ArrayList<Cart>>) session.getAttribute("userCartMap");

                if (userCartMap == null) {
                    userCartMap = new HashMap<>();
                    session.setAttribute("userCartMap", userCartMap);
                }

                ArrayList<Cart> cart_list = userCartMap.get(userEmail);


                List<Cart> carts = new ArrayList<>();
                double totalSum = 0;

                if (cart_list != null && !cart_list.isEmpty()) {
                    for (Cart item : cart_list) {
                        String itemQuery = "SELECT price, Offer, AbovePrice FROM menu_items WHERE id = ?";
                        PreparedStatement pss = con.prepareStatement(itemQuery);
                        pss.setInt(1, item.getId());
                        ResultSet itemRs = pss.executeQuery();

                        if (itemRs.next()) {
                            Cart cart = new Cart();
                            double pricePerItem = itemRs.getDouble("price");
                            int quantity = item.getQuantity();
                            double amount = pricePerItem * quantity;

                            int abovePrice = itemRs.getInt("AbovePrice");
                            if (quantity >= abovePrice) {
                                int offer = itemRs.getInt("Offer");
                                double discount = (amount * offer) / 100;
                                amount -= discount;
                            }

                            totalSum += amount;

                            cart.setPrice(amount);
                            carts.add(cart);
                        }
                    }
                }

                session.setAttribute("totalsum", totalsum1);
                session.setAttribute("email",email);
                session.setAttribute("carts", carts);

                response.sendRedirect("payment.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();

            try (Connection con = Database.getCon()) {
                String deleteQuery = "DELETE FROM temp_order WHERE uemail = ?";
                PreparedStatement ps1 = con.prepareStatement(deleteQuery);
                ps1.setString(1, useremail);
                ps1.executeUpdate();
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            response.sendRedirect("error.jsp");
        }
    }
}
