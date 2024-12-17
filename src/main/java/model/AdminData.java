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
public class AdminData {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String phone;
    private String image;
    private Timestamp created_at;


}
