package com.eshopping.DAO;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.eshopping.model.Order_Details;

public interface PayDAO {

	int insertPaymentDetails(HttpSession session);
    int insertOrderDetails(HttpSession session);
    List<Order_Details> getOrderDetails(int CustomerId);
}
