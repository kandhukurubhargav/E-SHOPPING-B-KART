package com.eshopping.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.eshopping.model.Order_Details;

public class PayDAOImp implements PayDAO{

	private static final String url="jdbc:mysql://localhost:3306/teca63_e_shopping?user=root&password=9059545675";
    private static final String insert=
    		"insert into payment_details (Amount, Payment_Date, Payment_Tiime, Payment_Type, Product_Id, Customer_Id) values (?,?,?,?,?,?)";
    private static final String insert_OrderDetails=
    		"insert into order_details (Customer_Id, Product_Id, Purchase_Quantity, Purchase_Date, Total_Purchase_Price,Image) values(?,?,?,?,?,?)";
   
    private static final String select_Order="select * from order_details where Customer_Id=?";
    
    LocalDate currentDate = LocalDate.now();
    LocalTime currentTime = LocalTime.now();
    @Override
	public int insertPaymentDetails(HttpSession session) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		  Connection connection=DriverManager.getConnection(url);
		PreparedStatement preparedStatement=connection.prepareStatement(insert);
		preparedStatement.setDouble(1, (double) session.getAttribute("TotalAmount"));
		preparedStatement.setDate(2, Date.valueOf(currentDate));
		preparedStatement.setTime(3, Time.valueOf(currentTime));
		preparedStatement.setString(4, (String) session.getAttribute("paymenttype"));
		preparedStatement.setInt(5, (int) session.getAttribute("customerId"));
		preparedStatement.setInt(6, (int) session.getAttribute("ProId"));
		return preparedStatement.executeUpdate();
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch blockS
			e.printStackTrace();
			return 0;
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
	}
	@Override
	public int insertOrderDetails(HttpSession session) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		  Connection connection=DriverManager.getConnection(url);
		PreparedStatement preparedStatement=connection.prepareStatement(insert_OrderDetails);
		preparedStatement.setInt(1, (int) session.getAttribute("customerId"));
		preparedStatement.setInt(2, (int) session.getAttribute("ProId"));
		preparedStatement.setInt(3, (int) session.getAttribute("Proquantiy"));
		preparedStatement.setDate(4, Date.valueOf(currentDate));
		preparedStatement.setDouble(5, (double) session.getAttribute("TotalAmount"));
		preparedStatement.setString(6, (String) session.getAttribute("ProductImage"));
        return preparedStatement.executeUpdate();
				
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch blockS
			e.printStackTrace();
			return 0;
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
	}
	@Override
	public List<Order_Details> getOrderDetails(int CustomerId) {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				Connection	connection = DriverManager.getConnection(url);
			    PreparedStatement preparedStatement=connection.prepareStatement(select_Order);
			    preparedStatement.setInt(1, CustomerId);
			    ResultSet resultSet=preparedStatement.executeQuery();
			    List<Order_Details> list=new ArrayList<Order_Details>();
			    if(resultSet.isBeforeFirst()) {
			    	while(resultSet.next()) {
			    		Order_Details order_Details=new Order_Details();
			    		order_Details.setOrder_id(resultSet.getInt("Order_Id"));
			    		order_Details.setCustomer_id(resultSet.getInt("Customer_Id"));
			    		order_Details.setProduct_id(resultSet.getInt("Product_Id"));
			    		order_Details.setPurchase_Quantity(resultSet.getInt("Purchase_Quantity"));
			    		order_Details.setPurchase_Date(resultSet.getDate("Purchase_Date"));
			    		order_Details.setTotal_Purchase_Price(resultSet.getDouble("Total_Purchase_Price"));
			    		order_Details.setImage(resultSet.getString("Image"));
				    	list.add(order_Details);
			    	}
			    	return list;
			    }
			    return null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
	     	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
