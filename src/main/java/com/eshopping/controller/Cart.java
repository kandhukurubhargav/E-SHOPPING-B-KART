package com.eshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/addToCart")
public class Cart extends HttpServlet{
 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO cartDAO=new CartDAOImp();

	 int customerId=Integer.parseInt(request.getParameter("custid"));
	 int productId=Integer.parseInt(request.getParameter("proid"));
	 PrintWriter writer=response.getWriter();
	 response.setContentType("text/html");
	 List<CartDetails> list=cartDAO.getCartDetails(customerId);
	 int count=list.size();
	 boolean present=false;
	 for(CartDetails cart:list) {
		 if(cart.getProduct_id()==productId) {
			 present=true;
		 }
	 }
	 HttpSession session=request.getSession();
     if(present) {
    	 session.setAttribute("CustCount", count);
    	 RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerActions.jsp");
    	 dispatcher.forward(request, response);
    	 
     }
     else {
    	 if(cartDAO.insertToCart(customerId, productId)>0) {
    		 session.setAttribute("CustCount", count+1);
        	 RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerActions.jsp");
        	 dispatcher.forward(request, response);
    	 }
    	 else {
    		 session.setAttribute("CustCount", count);
        	 RequestDispatcher dispatcher=request.getRequestDispatcher("CustomerActions.jsp");
        	 dispatcher.forward(request, response);
        	 
    	 }
     }
 }
}
