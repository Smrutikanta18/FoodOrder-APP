package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class OrderItem {
    private int orderItemId;
    private int orderId;
    private int userId;
    private int menuId;
    private String userEmail;
    private int quantity;
    private Timestamp date;
    private String name;
    private double price;
    private String ingredients;
    private String imageUrl;
    private String category;
    private int offer;
    private int abovePrice;
    private String status;
    private int address;
}
