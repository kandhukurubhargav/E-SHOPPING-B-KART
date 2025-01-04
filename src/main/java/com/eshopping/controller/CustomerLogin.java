package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eshopping.DAO.CartDAO;
import com.eshopping.DAO.CartDAOImp;
import com.eshopping.DAO.CustomerDAO;
import com.eshopping.DAO.CustomerDAOImp;
import com.eshopping.model.Customer_Details;
@WebServlet("/customerLogin")
public class CustomerLogin extends HttpServlet{
	CustomerDAO customerDAO=new CustomerDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emailid=request.getParameter("emailid");
		String password=request.getParameter("password");
		PrintWriter writer=response.getWriter();
		
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		Customer_Details cust=customerDAO.getCustomerDetails(emailid, password);

		if(cust!=null ){
			session.setAttribute("customerDetails", cust);
			RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerActions.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerLogin.html");
			dispatcher.include(request, response);
			writer.println("<center><h3>Invalid data</h3></center>");
			
		}
	}

}
