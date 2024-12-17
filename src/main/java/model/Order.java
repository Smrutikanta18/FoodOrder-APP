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
public class Order extends MenuItem{
    private int id;
    private int oid;
    private String uemail;
    private int quantity;
    private Timestamp date;
    private String status;
    private int address;
}
