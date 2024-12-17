package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MenuItem {
    private int Id;
    private String name;
    private Double price;
    private String ingredients;
    private String imageUrl;
    private String category;
    private int Offer;
    private int AbovePrice;
}
