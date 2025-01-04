package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshopping.DAO.CustomerDAO;
import com.eshopping.DAO.CustomerDAOImp;
import com.eshopping.exception.CustomerException;
import com.eshopping.model.Customer_Details;
import com.eshopping.service.CustomerService;
import com.eshopping.service.CustomerServiceImp;

@WebServlet("/customerRegistration")
public class CustomerRegistration extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String emailid=request.getParameter("emailid");
		long mobileNumber=Long.parseLong(request.getParameter("mobileNumber"));
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		Customer_Details customer_Details=new Customer_Details();
		customer_Details.setName(name);
		customer_Details.setEmailid(emailid);
		customer_Details.setMobileNumber(mobileNumber);
		customer_Details.setGender(gender);
		customer_Details.setAddress(address);
		customer_Details.setPassword(password);
		CustomerService customerService=new CustomerServiceImp();
		response.setContentType("text/html");

		
		PrintWriter writer =response.getWriter();
		
		try {
		if(customerService.userRegistration(customer_Details)) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerLogin.html");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerRegistration.html");
			dispatcher.include(request, response);
			writer.println("<center><h2>Invalid Data</h2></center>");
		}
		}catch (CustomerException e) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerRegistration.html");
			dispatcher.include(request, response);
			writer.println("<center><h2 style=color:red;>"+e.getExceptionMsg()+"</h2></center>");
		}
		
	}

}
