package com.eshopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eshopping.model.Product_Details;

public class ProductDetailsDAOImp implements ProductDetailsDAO{
	private static final String url="jdbc:mysql://localhost:3306/teca63_e_shopping?user=root&password=9059545675";
	private static final String insert="insert into product_details (Name, Brand, price, DIscount, Category, Quantity,Image) values(?,?,?,?,?,?,?)";
	private static final String select_All="select * from product_details";
	private static final String delete_product="delete from product_details where id=?";
	private static final String update_product="update product_details set price=?,DIscount=?,Quantity=? where id=?";
	private static final String search_product="select * from product_details where Name=? or Brand=? or Category=?";
	@Override
	public int insertProductDetails(Product_Details product_Details) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(insert);
			preparedStatement.setString(1, product_Details.getName());
			preparedStatement.setString(2, product_Details.getBrand());
			preparedStatement.setDouble(3, product_Details.getPrice());
			preparedStatement.setDouble(4, product_Details.getDiscount());
			preparedStatement.setString(5, product_Details.getCategory());
			preparedStatement.setInt(6, product_Details.getQuantity());
			preparedStatement.setString(7, product_Details.getImage());
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
	public List<Product_Details> getAllProductDeatils() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select_All);
			ResultSet resultSet=preparedStatement.executeQuery();
			List<Product_Details> list=new ArrayList();
			if(resultSet.isBeforeFirst()) {
				while(resultSet.next()) {
					Product_Details product_Details=new Product_Details();
					product_Details.setId(resultSet.getInt("id"));
					product_Details.setName(resultSet.getString("Name"));
					product_Details.setBrand(resultSet.getString("Brand"));
					product_Details.setPrice(resultSet.getDouble("price"));
					product_Details.setDiscount(resultSet.getDouble("DIscount"));
					product_Details.setCategory(resultSet.getString("Category"));
					product_Details.setQuantity(resultSet.getInt("Quantity"));
					product_Details.setImage(resultSet.getString("Image"));
					list.add(product_Details);
				}
			}
			else {
				return null;
			}
			return list;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public boolean deleteProduct(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(delete_product);
			preparedStatement.setInt(1,id);
			int res=preparedStatement.executeUpdate();
			if(res>0) {
				return true;
			}
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean updateProduct(int id, double price, double discount, int quantity) {
		//update product_details set price=?,DIscount=?,Quantity=? where id=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(update_product);
			preparedStatement.setDouble(1,price);
			preparedStatement.setDouble(2, discount);
			preparedStatement.setInt(3, quantity);
			preparedStatement.setInt(4, id);
			int res=preparedStatement.executeUpdate();
			if(res>0) {
				return true;
			}
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
	

}
