package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshopping.DAO.ProductDetailsDAO;
import com.eshopping.DAO.ProductDetailsDAOImp;
import com.eshopping.model.Product_Details;

@WebServlet("/allProductDetails")
public class AllProductDetails extends HttpServlet{

	ProductDetailsDAO productDetailsDAO=new ProductDetailsDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer=response.getWriter();
		response.setContentType("text/html");
		List<Product_Details> list=productDetailsDAO.getAllProductDeatils();
		if(list!=null) {
			writer.println(" <center style=\"font-size: 30px; color: red;\"><b>All Product Details</b>\r\n"
					+ "        <table style=\"border: 2px solid black;\">\r\n"
					+ "            <tr>\r\n"
					+ "                <th style=\"border: 1px solid black;\">id</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Name</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Brand</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Price</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Discount</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Category</th>\r\n"
					+ "                <th style=\"border: 1px solid black;\">Quantity</th>\r\n"
					+ "\r\n"
					+ "            </tr>");
				for (Product_Details pro : list) {
					writer.println("<tr>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+ pro.getId() +"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getName()+"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getBrand()+"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getPrice()+"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getDiscount()+"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getCategory()+"</td>\r\n"
							+ "                <td style=\"border: 1px solid black;\">"+pro.getQuantity()+"</td>\r\n"
							+ "            </tr>");
		          
		        }

		}
		else {
			writer.println("No data found");
		}
			
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
