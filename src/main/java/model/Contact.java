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
public class Contact {
    private int Id;
    private String username;
    private String useremail;
    private String subject;
    private String message;
    private Timestamp createdAt;

}
