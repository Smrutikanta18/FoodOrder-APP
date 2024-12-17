package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart extends MenuItem{
    private int quantity;
    private double cartPrice;
    private int uid;
    private Timestamp created_time;
    private double discount;
}
