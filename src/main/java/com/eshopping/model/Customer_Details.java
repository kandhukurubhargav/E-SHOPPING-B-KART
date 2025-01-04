package com.eshopping.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Setter
//@Getter
//@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer_Details{
	private int id;
	private String name;
	private String emailid;
	private String password;
	private long mobileNumber;
	private String gender;
	private String address;
}
