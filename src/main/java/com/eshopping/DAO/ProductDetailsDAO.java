package com.eshopping.DAO;

import java.util.List;

import com.eshopping.model.Product_Details;

public interface ProductDetailsDAO {
     int insertProductDetails(Product_Details product_Details);
     List<Product_Details> getAllProductDeatils();
     boolean deleteProduct(int id);
     boolean updateProduct(int id,double price,double discount,int quantity);
}
