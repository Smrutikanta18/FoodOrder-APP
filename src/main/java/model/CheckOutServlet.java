package model;

import com.google.gson.Gson;
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
import java.util.*;

@WebServlet("/orders")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    int start = 0;
    int end = 5;
    int total1 = 0;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("fetchStatuses".equals(action)) {
            fetchOrderStatuses(request, response);
            return;
        }

        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new ArrayList<>();
        double totalSum = 0.0;
        double paidOrderTotal = 0.0;
        double temp;

        int pgno = request.getParameter("pgno") == null ? 0 : Integer.parseInt(request.getParameter("pgno"));
        start = pgno * end;

        try (Connection con = Database.getCon()) {
            String query = "SELECT * FROM `order` WHERE uemail=? ORDER BY oid DESC LIMIT ?, ?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, user.getEmail());
                pst.setInt(2, start);
                pst.setInt(3, end);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    Order order = new Order();
                    int pId = rs.getInt("id");
                    MenuItem product = getSingleProduct(pId, con);

                    int quantity = rs.getInt("quantity");
                    double price = product.getPrice() * quantity;

                    if (quantity >= product.getAbovePrice()) {
                        double discount = (product.getOffer() * price) / 100;
                        price -= discount;
                    }
                    temp = price;

                    order.setId(pId);
                    order.setOid(rs.getInt("oid"));
                    order.setName(product.getName());
                    order.setImageUrl(product.getImageUrl());
                    order.setQuantity(quantity);
                    order.setUemail(rs.getString("uemail"));
                    order.setDate(rs.getTimestamp("date"));
                    order.setStatus(rs.getString("status"));

                    if ("cancle".equalsIgnoreCase(order.getStatus())) {
                        price = 0;
                    } else {
                        totalSum += price;
                    }

                    if ("paid".equalsIgnoreCase(order.getStatus())) {
                        paidOrderTotal += price;
                    }

                    orders.add(order);
                    order.setPrice(temp);
                }

                String countQuery = "SELECT COUNT(*) FROM `order` where uemail = ?";
                PreparedStatement psss = con.prepareStatement(countQuery);
                psss.setString(1, user.getEmail());
                ResultSet resultSet = psss.executeQuery();

                if (resultSet.next()) {
                    total1 = resultSet.getInt(1);
                }

                if (paidOrderTotal > 0) {
                    totalSum -= paidOrderTotal;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("orders", orders);
        request.setAttribute("totalSum", totalSum);
        request.setAttribute("total", total1);
        request.setAttribute("end", end);
        request.setAttribute("pgno", pgno);
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }

    private MenuItem getSingleProduct(int id, Connection con) throws SQLException {
        MenuItem product = null;
        String query = "SELECT * FROM menu_items WHERE id=?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                product = new MenuItem();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image_url"));
                product.setOffer(rs.getInt("Offer"));
                product.setAbovePrice(rs.getInt("AbovePrice"));
            }
        }
        return product;
    }

    private void fetchOrderStatuses(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        UsersData user = (UsersData) session.getAttribute("users");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection con = Database.getCon()) {
            String query = "SELECT oid, status, uemail FROM `order` WHERE uemail = ?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, user.getEmail());
                ResultSet rs1 = pst.executeQuery();

                List<Map<String, String>> statusList = new ArrayList<>();
                while (rs1.next()) {
                    Map<String, String> statusData = new HashMap<>();
                    statusData.put("oid", String.valueOf(rs1.getInt("oid")));
                    statusData.put("status", rs1.getString("status"));
                    statusData.put("uemail", rs1.getString("uemail"));
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
