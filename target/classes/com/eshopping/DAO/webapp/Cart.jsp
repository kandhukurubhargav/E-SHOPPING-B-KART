<%@page import="java.util.ArrayList"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAOImp"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAO"%>
<%@page import="com.eshopping.model.Product_Details"%>
<%@page import="com.eshopping.model.CartDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.eshopping.DAO.CartDAOImp"%>
<%@page import="com.eshopping.DAO.CartDAO"%>
<%@page import="com.eshopping.model.Customer_Details"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

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
        margin-right: 3px;
    }
    header .logo span {
        font-family: 'Pacifico', cursive;
        font-size: 35px;
        position: relative;
        right: 7px;
        top: 3px;
    }

    nav a {
        color: #FFD700;
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 15px;
        transition: background 0.3s;
        position: relative;
        right: 130px;
        top: 10px;
    }
     nav img{
        width: 18px;
        height: auto;
        position: relative;
        right: 105px;
        top: 15px;
        border-radius: 50%;
        }

    nav a:hover {
        background: #FFD700;
        color: #2d2d2d;
    }

    h2 {
        text-align: center;
        margin-top: 20px;
        font-size: 24px;
        color: #2d2d2d;
    }

    .search-bar {
        text-align: center;
        margin: 20px 0;
    }

    .search-bar input {
        padding: 8px;
        width: 250px;
        border: 1px solid #ccc;
        border-radius: 20px;
    }

    .search-bar button {
        padding: 8px 15px;
        background: #2d2d2d;
        color: #FFD700;
        border: none;
        border-radius: 20px;
        cursor: pointer;
    }

    .product-table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .product-table th, .product-table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .product-table th {
        background: #FFD700;
        color: #2d2d2d;
    }

    .product-table tr:hover {
        background: #f9f9f9;
    }

    .action-buttons input {
        background: #FFD700;
        color: #2d2d2d;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
    }

    .action-buttons input:hover {
        background: #2d2d2d;
        color: #FFD700;
    }

    footer {
        text-align: center;
        padding: 10px 0;
        background: #2d2d2d;
        color: #FFD700;
        margin-top: 20px;
        position: relative;
        top: 250px;
    }
    #CustomerName{
    position: relative;
     bottom: 7px;
     left:20px;
     border-radius: 10px;
     text-align: center;
    }
     .product-image {
        width: 80px;
        height: auto;
        border-radius: 5px;
    }
    </style>
</head>
<body>
<%!
ProductDetailsDAO productDetailsDAO = new ProductDetailsDAOImp();
CartDAO cartDao = new CartDAOImp();
List<Product_Details> productDetails;
%>
<%
productDetails = productDetailsDAO.getAllProductDeatils();
Customer_Details customerDetails = (Customer_Details) session.getAttribute("customerDetails");
List<CartDetails> cartDetails = cartDao.getCartDetails(customerDetails.getId());
List<Product_Details> cartlist = new ArrayList<>();
for (Product_Details pro : productDetails) {
    if (cartDetails.stream().anyMatch(cart -> cart.getProduct_id() == pro.getId())) {
        cartlist.add(pro);
    }
}
%>
<header>
    <div class="logo">
        <img src="images/logoB-kart-removebg-preview.png" alt="B-Kart Logo">
        <span>B-Kart</span>
    </div>
    <nav>
        <a href="HomePage.html">Home</a>
        <a href="MyOrders.jsp">My Orders</a> <!-- Added My Orders link -->
        <img alt="" src="images/profile.png">
        <p id="CustomerName"><%= customerDetails.getName() %></p>
    </nav>
</header>

<h2>All Product Details</h2>
<div class="search-bar">
    <form action="Cart.jsp">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</div>

<%
String search = request.getParameter("query");
List<Product_Details> list1 = new ArrayList<>();
if (search != null) {
    for (Product_Details pro : cartlist) {
        if (pro.getName().equalsIgnoreCase(search) || pro.getBrand().equalsIgnoreCase(search) || pro.getCategory().equalsIgnoreCase(search)) {
            list1.add(pro);
        }
    }
} else {
    list1 = cartlist;
}

if (list1 != null && !list1.isEmpty()) {
%>
<table class="product-table">
    <thead>
        <tr>
            <th>Image</th>
            <th>ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Category</th>
            <th>Quantity</th>
            <th>Buy</th>
            <th>Remove from Cart</th>
        </tr>
    </thead>
    <tbody>
        <% for (Product_Details pro : list1) { %>
        <tr>
            <td>
                <img src="images/<%= pro.getImage() %>" alt="<%= pro.getName() %>" class="product-image">
            </td>
            <td><%= pro.getId() %></td>
            <td><%= pro.getName() %></td>
            <td><%= pro.getBrand() %></td>
            <td><%= pro.getPrice() %></td>
            <td><%= pro.getDiscount() %></td>
            <td><%= pro.getCategory() %></td>
            <td><%= pro.getQuantity() %></td>
            <td class="action-buttons">
                <form action="Buy.jsp">
                     <input type="hidden" name="proImage" value="<%=pro.getImage() %>">
                    <input type="hidden" name="proid" value="<%= pro.getId() %>">
                    <input type="hidden" name="proname" value="<%= pro.getName() %>">
                    <input type="hidden" name="proprice" value="<%= pro.getPrice() %>">
                    <input type="hidden" name="proDiscount" value="<%= pro.getDiscount() %>">
                    <input type="submit" value="Buy">
                </form>
            </td>
            <td class="action-buttons">
                <form action="removeFromCart">
                    <input type="hidden" name="custid" value="<%= customerDetails.getId() %>">
                    <input type="hidden" name="proid" value="<%= pro.getId() %>">
                    <input type="submit" value="Remove from Cart">
                </form>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

<% } else { %>
<p style="text-align: center;">No products found.</p>
<% } %>

<footer>
    <p>&copy; 2024 B-Kart. All rights reserved.</p>
</footer>
</body>
</html>
