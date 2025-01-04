package com.eshopping.DAO;

import java.util.List;

import com.eshopping.controller.Cart;
import com.eshopping.model.CartDetails;

public interface CartDAO {
     int insertToCart(int custid,int proid);
     List<CartDetails> getCartDetails(int customerid);
     int removeFromCart(int customerId,int productId);
}
