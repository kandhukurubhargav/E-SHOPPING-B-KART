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
import com.eshopping.model.Product_Details;
@WebServlet("/addProducts")
public class AddProductDetails extends HttpServlet{
	ProductDetailsDAO productDetailsDAO=new ProductDetailsDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productCategory=request.getParameter("category");
		String productBrand=request.getParameter("brand");
		String productName=request.getParameter("name");
		double productPrice=Double.parseDouble(request.getParameter("price"));
		int productQuantity=Integer.parseInt(request.getParameter("quantity"));
		double productDiscount=Double.parseDouble(request.getParameter("discount"));
		String productimage=request.getParameter("image");
		response.setContentType("text/html");
		
		Product_Details product_Details=new Product_Details();
		product_Details.setCategory(productCategory);
		product_Details.setBrand(productBrand);
		product_Details.setName(productName);
		product_Details.setPrice(productPrice);
		product_Details.setQuantity(productQuantity);
		product_Details.setDiscount(productDiscount);
		product_Details.setImage(productimage);
		
		PrintWriter writer=response.getWriter();
		if (productDetailsDAO.insertProductDetails(product_Details)>0) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("AddProductDetails.html");
			dispatcher.include(request, response);
			writer.println("<center><h2>Product Added Successfully</h2></center>");
		} else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("AddProductDetails.html");
			dispatcher.include(request, response);
			writer.println("<center><h2>Product not try again</h2></center>");
		}
	}

}
