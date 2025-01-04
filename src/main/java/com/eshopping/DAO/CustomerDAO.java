package com.eshopping.DAO;

import java.util.List;

import com.eshopping.model.Customer_Details;

public interface CustomerDAO {
    int insertCustomerDetails(Customer_Details customer_Details);
    List<Customer_Details> getAllCustomerDetails();
    Customer_Details getCustomerDetails(String emailid,String password);
    boolean checkCustomerEmailid(String emailid);
    int updatePassword(String emailid,String password);
}
