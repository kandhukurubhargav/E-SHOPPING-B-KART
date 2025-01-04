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
@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet{
	ProductDetailsDAO productDetailsDAO=new ProductDetailsDAOImp();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   int id=Integer.parseInt(request.getParameter("id"));
	   PrintWriter writer=response.getWriter();
	   response.setContentType("text/html");
	   if(productDetailsDAO.deleteProduct(id)) {
		   RequestDispatcher dispatcher=request.getRequestDispatcher("AllProductDetails.jsp");
		   dispatcher.forward(request, response);
	   }
	   else {
		   RequestDispatcher dispatcher=request.getRequestDispatcher("AllProductDetails.jsp");
		   dispatcher.include(request, response);

	   }
	 
	}
}
