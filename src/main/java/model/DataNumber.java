package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DataNumber {
    private int id;
    private int experience;
    private int customers;
    private int menus;
    private int staffs;
    private String image;
}
