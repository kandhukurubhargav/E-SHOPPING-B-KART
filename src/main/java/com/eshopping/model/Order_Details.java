package com.eshopping.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order_Details {
	private int order_id;
	private int customer_id;
	private int product_id;
	private int purchase_Quantity;
	private Date Purchase_Date;
	private double Total_Purchase_Price;
	private String image;
}
