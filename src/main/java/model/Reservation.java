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
public class Reservation {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String book_date;
    private String book_time;
    private int persons;
    private Timestamp created_at;
    private String uemail;
    private String status;
}
