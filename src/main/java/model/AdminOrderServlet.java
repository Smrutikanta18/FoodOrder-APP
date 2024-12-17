package model;

import com.google.gson.Gson;
import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/adminorder")
public class AdminOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    int userId;
    int total1 = 0;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("fetchStatuses".equals(action)) {
            fetchOrderStatuses(request, response);
            return;
        }
        List<OrderItem> orderItemList = new ArrayList<>();

        try (Connection conn = Database.getCon()) {
            int start = 0;
            int end = 5;
            int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
            start = pgno * end;

            String sql = "SELECT o.id, o.oid, o.uemail, o.quantity, o.date, o.status, o.address, " +
                    "m.id AS menu_id, m.name, m.price, m.ingredients, m.image_url, m.category, m.Offer, m.AbovePrice " +
                    "FROM `order` o " +
                    "JOIN menu_items m ON o.id = m.id " +
                    "ORDER BY o.oid DESC LIMIT ?, ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, start);
                stmt.setInt(2, end);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int orderId = rs.getInt("id");
                        int orderItemId = rs.getInt("oid");
                        int menuId = rs.getInt("menu_id");
                        String userEmail = rs.getString("uemail");
                        int quantity = rs.getInt("quantity");
                        Timestamp date = rs.getTimestamp("date");
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String ingredients = rs.getString("ingredients");
                        String imageUrl = rs.getString("image_url");
                        String category = rs.getString("category");
                        int offer = rs.getInt("Offer");
                        int abovePrice = rs.getInt("AbovePrice");
                        String status = rs.getString("status");
                        int address = rs.getInt("address");

                        double price1 = price * quantity;
                        if (quantity >= abovePrice) {
                            double discount = (offer * price1) / 100;
                            price1 -= discount;
                        }

                        OrderItem orderItem = new OrderItem();
                        orderItem.setMenuId(menuId);
                        orderItem.setOrderItemId(orderItemId);
                        orderItem.setUserEmail(userEmail);
                        orderItem.setAbovePrice(abovePrice);
                        orderItem.setOrderId(orderId);
                        orderItem.setCategory(category);
                        orderItem.setDate(date);
                        orderItem.setName(name);
                        orderItem.setImageUrl(imageUrl);
                        orderItem.setIngredients(ingredients);
                        orderItem.setPrice(price1);
                        orderItem.setQuantity(quantity);
                        orderItem.setOffer(offer);
                        orderItem.setStatus(status);
                        orderItem.setAddress(address);

                        String query = "SELECT id FROM users WHERE email = ?";
                        try (PreparedStatement p = conn.prepareStatement(query)) {
                            p.setString(1, userEmail);
                            try (ResultSet rs1 = p.executeQuery()) {
                                if (rs1.next()) {
                                    userId = rs1.getInt("id");
                                }
                            }
                        }
                        orderItem.setUserId(userId);
                        orderItemList.add(orderItem);
                    }
                }
            }

            String countQuery = "SELECT COUNT(*) FROM `order`";
            try (PreparedStatement ps = conn.prepareStatement(countQuery);
                 ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    total1 = resultSet.getInt(1);
                }
            }

            request.setAttribute("orderItemList", orderItemList);
            request.setAttribute("total", total1);
            request.setAttribute("end", end);
            request.setAttribute("pgno", pgno);

            request.getRequestDispatcher("tables/adminOrder.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fetchOrderStatuses(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (Connection con = Database.getCon()) {
            String query = "SELECT oid, status, uemail FROM `order`";
            try (PreparedStatement pst = con.prepareStatement(query);
                 ResultSet resultSet1 = pst.executeQuery()) {

                List<Map<String, String>> statusList = new ArrayList<>();
                while (resultSet1.next()) {
                    Map<String, String> statusData = new HashMap<>();
                    statusData.put("oid", String.valueOf(resultSet1.getInt("oid")));
                    statusData.put("status", resultSet1.getString("status"));
                    statusData.put("uemail", resultSet1.getString("uemail"));
                    statusList.add(statusData);
                }

                Gson gson = new Gson();
                String json = gson.toJson(Map.of("statusList", statusList));
                response.setContentType("application/json");
                response.getWriter().write("{\"jsonData\": " + json + "}");
                response.setStatus(HttpServletResponse.SC_OK);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error fetching order statuses.");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
