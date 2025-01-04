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

import com.eshopping.DAO.CustomerDAO;
import com.eshopping.DAO.CustomerDAOImp;
@WebServlet("/createpaasword")
public class CreateNewPassword extends HttpServlet{

	CustomerDAO customerDAO=new CustomerDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int Gotp=(Integer) session.getAttribute("customerOTP");
		int Eotp=(Integer) session.getAttribute("oottpp");
		String emailid=(String)session.getAttribute("customerEmailid");
		String password1=request.getParameter("newPassword");
		String password2=request.getParameter("newPassword1");
		response.setContentType("text/html");
		PrintWriter writer=response.getWriter();
	
		if(Gotp==Eotp) {
			if(customerDAO.updatePassword(emailid, password2)>0) {
				RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerLogin.html");
				dispatcher.forward(request, response);
			}
			else {
				RequestDispatcher dispatcher=request.getRequestDispatcher("CreateNewPassword.html");
				dispatcher.include(request, response);
				writer.println("<center><h2>Not Updated</h2></center>");
			}
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("ForgotPassword.jsp");
			dispatcher.include(request, response);
			writer.println("<center><h2>Your Entered Invalid OTP</h2></center>");
		}
		
	}
}
