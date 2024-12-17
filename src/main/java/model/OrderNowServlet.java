package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();

            UsersData user = (UsersData) request.getSession().getAttribute("users");

            if (user != null) {
                String userEmail = user.getEmail();

                // Directly retrieve the cart list from the session
                ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("carts");
                if (cartList != null && !cartList.isEmpty()) {
                    String[] productIds = request.getParameterValues("id");
                    String[] quantities = request.getParameterValues("quantity");

                    if (productIds != null && quantities != null && productIds.length == quantities.length) {
                        Connection con = Database.getCon();
                        String query = "INSERT INTO `temp_order` (`id`, `uemail`, `quantity`, `date`, `address`) VALUES (?, ?, ?, ?, ?)";

                        try (PreparedStatement pst = con.prepareStatement(query)) {
                            for (int i = 0; i < productIds.length; i++) {
                                int productQuantity = Integer.parseInt(quantities[i]);
                                if (productQuantity <= 0) {
                                    productQuantity = 1;
                                }

                                pst.setInt(1, Integer.parseInt(productIds[i]));
                                pst.setString(2, userEmail);
                                pst.setInt(3, productQuantity);
                                pst.setString(4, formatter.format(date));
                                pst.setString(5, "1"); // Assuming a default address or fetching from somewhere
                                pst.addBatch();
                            }

                            int[] result = pst.executeBatch();
                            boolean itemsAdded = false;
                            for (int r : result) {
                                if (r > 0) {
                                    itemsAdded = true;
                                    break;
                                }
                            }

                            if (itemsAdded) {
                                // If items were added successfully, you might want to clear the cart here
                                //cartList.clear();
                                request.getSession().setAttribute("carts", cartList); // Update the session cart
                            }
                            response.sendRedirect("address");
                        } catch (SQLException e) {
                            try {
                                String sql1 = "DELETE FROM temp_order WHERE uemail=?";
                                PreparedStatement ps1 = con.prepareStatement(sql1);
                                ps1.setString(1, user.getEmail());
                                ps1.executeUpdate();
                            } catch (Exception ex) {
                                throw new RuntimeException(ex);
                            }
                            e.printStackTrace();
                            out.println("<h3 style='color:red;'>Error occurred while processing your order.</h3>");
                        }
                    }
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
