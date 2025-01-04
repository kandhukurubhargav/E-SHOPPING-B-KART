package com.eshopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eshopping.model.Customer_Details;

public class CustomerDAOImp implements CustomerDAO{
	
	private static final String url="jdbc:mysql://localhost:3306/teca63_e_shopping?user=root&password=9059545675";
	private static final String insert="insert into customer_details"
			+ " (Name, MobileNumber, Emailid, Gender, Password, Address) values(?,?,?,?,?,?)";
	private static final String select_all="select * from customer_details";
	private static final String check_Customer="select * from customer_details where Emailid=? and Password=?";
	private static final String check_Customer_Emailid="select * from customer_details where Emailid=?";
    private static final String update_Password="update customer_details set Password=? where Emailid=?";
	
	@Override
	public int insertCustomerDetails(Customer_Details customer_Details) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection =DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(insert);
			preparedStatement.setString(1, customer_Details.getName());
			preparedStatement.setLong(2, customer_Details.getMobileNumber());
			preparedStatement.setString(3, customer_Details.getEmailid());
			preparedStatement.setString(4, customer_Details.getGender());
			preparedStatement.setString(5, customer_Details.getPassword());
			preparedStatement.setString(6, customer_Details.getAddress());
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
	public List<Customer_Details> getAllCustomerDetails() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select_all);
			ResultSet resultSet=preparedStatement.executeQuery();
			
			List<Customer_Details> list=new ArrayList();
			if(resultSet.isBeforeFirst()) {
				while(resultSet.next()) {
					Customer_Details customer_Details=new Customer_Details();
					customer_Details.setEmailid(resultSet.getString("Emailid"));
					customer_Details.setMobileNumber(resultSet.getLong("MobileNumber"));
					customer_Details.setPassword(resultSet.getString("Password"));
					list.add(customer_Details);
				}
				return list;
			}
			else {
				return null;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	
		
	}

	@Override
	public Customer_Details getCustomerDetails(String emailid, String password) {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(check_Customer);
		    preparedStatement.setString(1, emailid);
		    preparedStatement.setString(2, password);
		    ResultSet resultSet=preparedStatement.executeQuery();

		    if(resultSet.next()) {
		    	Customer_Details customer_Details=new Customer_Details();

		    	customer_Details.setName(resultSet.getString("Name"));
		    	customer_Details.setId(resultSet.getInt("id"));
		    	customer_Details.setEmailid(resultSet.getString("Emailid"));
		    	return customer_Details;
		    }
		    return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean checkCustomerEmailid(String emailid) {
	 try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection=DriverManager.getConnection(url);
		PreparedStatement preparedStatement=connection.prepareStatement(check_Customer_Emailid);
		preparedStatement.setString(1, emailid);
		ResultSet resultSet=preparedStatement.executeQuery();
		if (resultSet.next()) {
			return true;
		}
		return false;
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
	}

	@Override
	public int updatePassword(String emailid,String password) {
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection=DriverManager.getConnection(url);
				PreparedStatement preparedStatement=connection.prepareStatement(update_Password);
				preparedStatement.setString(1, password);
				preparedStatement.setString(2, emailid);
				return preparedStatement.executeUpdate();
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
			}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


