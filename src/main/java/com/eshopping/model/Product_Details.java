package com.eshopping.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product_Details {
	
	private int id;
	private String name;
	private String brand;
	private double price;
	private double discount;
	private String category;
	private int quantity;
	private String image;
}
