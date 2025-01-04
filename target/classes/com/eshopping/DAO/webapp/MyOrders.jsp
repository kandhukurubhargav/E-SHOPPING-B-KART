<%@page import="com.eshopping.model.Customer_Details"%>
<%@page import="com.eshopping.model.Order_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.eshopping.DAO.PayDAOImp"%>
<%@page import="com.eshopping.DAO.PayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        body {
            background: linear-gradient(to bottom, rgb(128, 182, 207), #fff);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            color: #333333;
        }
        header {
            background-color: #2d2d2d;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #FFD700;
        }
        header .logo {
            display: flex;
            align-items: center;
            font-size: 20px;
        }
        header .logo img {
            height: 55px;
            margin-right: 10px;
        }
        header .logo span {
            font-family: 'Pacifico', cursive;
            font-size: 30px;
        }
        nav {
            display: flex;
            align-items: center;
        }
        nav a {
            color: #FFD700;
            text-decoration: none;
            padding: 5px 15px;
            border-radius: 15px;
            transition: background 0.3s;
            margin-right: 10px;
        }
        nav a:hover {
            background: #FFD700;
            color: #2d2d2d;
        }
        nav #customername {
            padding: 5px 10px;
            border: 1px solid #FFD700;
            border-radius: 15px;
            color: #FFD700;
            text-align: center;
        }
        h2 {
            text-align: center;
            margin: 20px 0;
            color: #2d2d2d;
        }
        .order-table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .order-table th, .order-table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .order-table th {
            background: #FFD700;
            color: #2d2d2d;
        }
        .order-table tr:hover {
            background: #f9f9f9;
        }
        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        footer {
            text-align: center;
            padding: 10px;
            background: #2d2d2d;
            color: #FFD700;
            margin-top: 280px;
        }
    </style>
</head>
<body>
    <%!
        PayDAO payDAO = new PayDAOImp();
    %>
    <%
        Customer_Details customer_Details = (Customer_Details) session.getAttribute("customerDetails");
        String customerName = customer_Details != null ? customer_Details.getName() : "Guest";
        
        int custId=0;
        if(session.getAttribute("customerId")!=null){
             custId = (Integer)session.getAttribute("customerId");
        }
        List<Order_Details> list = payDAO.getOrderDetails(custId);
    %>
    <header>
        <div class="logo">
            <img src="images/logoB-kart-removebg-preview.png" alt="B-Kart Logo">
            <span>B-Kart</span>
        </div>
        <nav>
            <a href="HomePage.html">Home</a>
            <div id="customername"><%= customerName %></div>
        </nav>
    </header>

    <h2>Order Details</h2>

    <%
        if (list != null && !list.isEmpty()) {
    %>
    <table class="order-table">
        <thead>
            <tr>
                <th>Image</th>
                <th>Order ID</th>
                <th>Customer ID</th>
                <th>Product ID</th>
                <th>Purchase Quantity</th>
                <th>Purchase Date</th>
                <th>Total Purchase Price</th>
            </tr>
        </thead>
        <tbody>
            <% for (Order_Details order : list) { %>
            <tr>
                <td><img class="product-image" src="images/<%= order.getImage() %>" alt="Product"></td>
                <td><%= order.getOrder_id() %></td>
                <td><%= order.getCustomer_id() %></td>
                <td><%= order.getProduct_id() %></td>
                <td><%= order.getPurchase_Quantity() %></td>
                <td><%= order.getPurchase_Date() %></td>
                <td><%= order.getTotal_Purchase_Price() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <p style="text-align: center; color: #333;">No orders found.</p>
    <%
        }
    %>

    <footer>
        <p>&copy; 2024 B-Kart. All rights reserved.</p>
    </footer>
</body>
</html>
