package com.eshopping.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eshopping.DAO.CartDAO;
import com.eshopping.DAO.CartDAOImp;
import com.eshopping.model.CartDetails;

@WebServlet("/removeFromCart")
public class RemoveFromCart extends HttpServlet{

	 CartDAO cartDAO=new CartDAOImp();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId=Integer.parseInt(request.getParameter("proid"));
		int custmerId=Integer.parseInt(request.getParameter("custid"));
		List<CartDetails> cartlist=cartDAO.getCartDetails(custmerId);
		int count=cartlist.size();
		HttpSession session=request.getSession();
		if(cartDAO.removeFromCart(custmerId, productId)>0) {
			session.setAttribute("CustCount", count-1);
			RequestDispatcher dispatcher=request.getRequestDispatcher("Cart.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("Cart.jsp");
			dispatcher.forward(request, response);
		}
		
	}
}
