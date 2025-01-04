package com.eshopping.service;

import java.util.List;

import com.eshopping.DAO.CustomerDAO;
import com.eshopping.DAO.CustomerDAOImp;
import com.eshopping.exception.CustomerException;
import com.eshopping.model.Customer_Details;

public class CustomerServiceImp implements CustomerService{

	CustomerDAO customerDAO=new CustomerDAOImp();
	@Override
	public boolean  userRegistration(Customer_Details customer_Details) {
	List<Customer_Details>	allCustomerDetails=customerDAO.getAllCustomerDetails();
	 Boolean emailidMatch=allCustomerDetails.stream().anyMatch(customer->customer.getEmailid().equalsIgnoreCase(customer_Details.getEmailid()));
	 if(emailidMatch) {
		 throw new CustomerException("Emailid Already Existed");
	 }
     boolean mobileNumberMatch=allCustomerDetails.stream().anyMatch(customer->customer.getMobileNumber()==customer_Details.getMobileNumber());
     if(mobileNumberMatch) {
      throw new CustomerException("MobileNumber Already Existed");
     }	 
     boolean passwordMatch=allCustomerDetails.stream().anyMatch(customer->customer.getPassword().equals(customer_Details.getPassword()));
     if(passwordMatch) {
         throw new CustomerException("Password Already Existed");

     }
     
     if(customerDAO.insertCustomerDetails(customer_Details)!=0) {
    	 return true;
     }else {
    	 return false;
     }
     
	}

}
