package com.eshopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAOImp implements AdminDAO{
	
	private static final String url="jdbc:mysql://localhost:3306/teca63_e_shopping?user=root&password=9059545675";
    private static final String select="select * from admin where Admin_Emailid=? and Admin_Password=?";
	@Override
	public boolean getAdminDetails(String emailid, int password) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setString(1, emailid);
			preparedStatement.setInt(2, password);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
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

}
