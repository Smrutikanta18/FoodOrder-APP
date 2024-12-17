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
import java.sql.SQLException;

    @WebServlet("/cancel-order")
    public class CancleOrderServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("orderId");
            String email = request.getParameter("userEmail");

            try {
                Connection con = Database.getCon();

                String fetchPriceQuery = "SELECT * FROM `order` WHERE oid = ? AND uemail = ?";
                PreparedStatement fetchPriceStmt = con.prepareStatement(fetchPriceQuery);
                fetchPriceStmt.setInt(1, Integer.parseInt(id));
                fetchPriceStmt.setString(2, email);

                ResultSet rs = fetchPriceStmt.executeQuery();
                double price = 0.0;
                if (rs.next()) {
                    int quantity = rs.getInt("quantity");
                    int productId = rs.getInt("id");

                    MenuItem product = getSingleProduct(productId, con);
                    price = product.getPrice() * quantity;

                    if (quantity >= product.getAbovePrice()) {
                        double discount = (product.getOffer() * price) / 100;
                        price -= discount;
                    }
                }

                String query = "UPDATE `order` SET status = 'cancle' WHERE oid = ? and uemail = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, Integer.parseInt(id));
                ps.setString(2, email);

                int updatedRows = ps.executeUpdate();

                if (updatedRows > 0) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"canceledPrice\": " + price + "}");
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order not found or already canceled.");
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
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
}
