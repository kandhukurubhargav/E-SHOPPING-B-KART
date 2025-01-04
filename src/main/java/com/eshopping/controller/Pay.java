package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator.RequestorType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eshopping.DAO.PayDAO;
import com.eshopping.DAO.PayDAOImp;

@WebServlet("/payment")
public class Pay extends HttpServlet{

	PayDAO payDAO=new PayDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String paymentType=request.getParameter("paymentMethod");
		session.setAttribute("paymenttype", paymentType);
		PrintWriter writer=response.getWriter();
		response.setContentType("text/html");
		
		if(payDAO.insertPaymentDetails(session)>0 && payDAO.insertOrderDetails(session)>0) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("PaymentSuccessfull.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("Cart.jsp");
			dispatcher.include(request, response);
			writer.println("<center>Not purchased</center>");
		}
		
	}
}
