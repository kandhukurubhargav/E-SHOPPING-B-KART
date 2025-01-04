package com.eshopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eshopping.controller.Cart;
import com.eshopping.model.CartDetails;

public class CartDAOImp implements CartDAO{
	private static final String url="jdbc:mysql://localhost:3306/teca63_e_shopping?user=root&password=9059545675";
	private static final String insert="insert into cart (Customer_Id, Product_Id) values (?,?)";
	private static final String count_Of_CustomerId="select * from cart where Customer_Id=?";
	private static final String remove="delete from cart where Customer_Id=? and Product_Id=?";
	@Override
	public int insertToCart(int custid, int proid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(insert);
		    preparedStatement.setInt(1, custid);
		    preparedStatement.setInt(2, proid);
		    return preparedStatement.executeUpdate();
		   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public  List<CartDetails> getCartDetails(int customerid) {
	    List<CartDetails>  list=new ArrayList<CartDetails>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(count_Of_CustomerId);
		    preparedStatement.setInt(1, customerid);
		    ResultSet resultSet=preparedStatement.executeQuery();
		  if(resultSet.isBeforeFirst()) {
			while(resultSet.next()) {
				CartDetails cart=new CartDetails();
				cart.setId(resultSet.getInt("id"));
				cart.setCustomer_id(resultSet.getInt("Customer_Id"));
				cart.setProduct_id(resultSet.getInt("Product_Id"));
				 list.add(cart);

			}
			   return list;
		  }
		   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
		
	}
	@Override
	public int removeFromCart(int customerId, int productId) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(remove);
			preparedStatement.setInt(1, customerId);
			preparedStatement.setInt(2, productId);
			return preparedStatement.executeUpdate();
		   
		   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

}
