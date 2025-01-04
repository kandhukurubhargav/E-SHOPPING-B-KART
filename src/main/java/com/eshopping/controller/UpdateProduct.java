package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshopping.DAO.ProductDetailsDAO;
import com.eshopping.DAO.ProductDetailsDAOImp;

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet{

	ProductDetailsDAO productDetailsDAO=new ProductDetailsDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		double price=Double.parseDouble(request.getParameter("price"));
		double discount=Double.parseDouble(request.getParameter("discount"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		 PrintWriter writer=response.getWriter();
		 
		 response.setContentType("text/html");
		 if(productDetailsDAO.updateProduct(id, price, discount, quantity)) {
			 RequestDispatcher dispatcher=request.getRequestDispatcher("updateProduct.jsp");
			 dispatcher.include(request, response);
			 writer.println("<center><h1>Updated</h1></center>");
		 }
		 else {
			 RequestDispatcher dispatcher=request.getRequestDispatcher("updateProduct.jsp");
			 dispatcher.forward(request, response);
		 }
		 
		 
	}
}
