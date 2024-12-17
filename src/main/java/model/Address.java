package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Address {
    private int id;
    private int userId;
    private String pinNo;
    private String location;
    private String area;
    private String state;
    private String firstName;
    private String lastName;
    private String country;
    private String street;
    private String city;
    private String phone;
    private String email;
    private String plotNo;

    public Address(int userId, String pinNo, String location, String area, String state, String firstName, String lastName, String country, String street, String city, String phone, String email, String plotNo) {
        this.userId = userId;
        this.pinNo = pinNo;
        this.location = location;
        this.area = area;
        this.state = state;
        this.firstName = firstName;
        this.lastName = lastName;
        this.country = country;
        this.street = street;
        this.city = city;
        this.phone = phone;
        this.email = email;
        this.plotNo = plotNo;
    }
}
