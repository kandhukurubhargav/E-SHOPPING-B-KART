package com.eshopping.model;

import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment_Details {
	private int payment_id;
	private double amount;
	private Date payment_Date;
	private Time payment_Time;
	private int product_id;
	private int customer_id;
	
}
