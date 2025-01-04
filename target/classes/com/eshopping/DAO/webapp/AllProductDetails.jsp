<%@page import="java.util.ArrayList"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAOImp"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAO"%>
<%@page import="com.eshopping.model.Product_Details"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');

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
        header .logo span{
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
            position: relative;
            top: 230px;
        }

        .product-image {
            width: 80px; /* Adjust based on your table layout */
            height: auto;
            border-radius: 5px; /* Optional for rounded corners */
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="images/logoB-kart-removebg-preview.png" alt="B-Kart Logo">
            <span>B-Kart</span>
        </div>
        <nav>
            <a href="HomePage.html">Home</a>
            <a href="AddProductDetails.html">Add Product</a>
        </nav>
    </header>

    <h2>All Product Details</h2>
    <div class="search-bar">
        <form action="AllProductDetails.jsp">
            <input type="text" name="query" placeholder="Search products...">
            <button type="submit">Search</button>
        </form>
    </div>

    <%!
        ProductDetailsDAO productDetailsDAO = new ProductDetailsDAOImp();
        List<Product_Details> list;
    %>
    <%
        String search = request.getParameter("query");
        list = productDetailsDAO.getAllProductDeatils();
        List<Product_Details> list1 = new ArrayList<>();
        if (search != null) {
            for (Product_Details pro : list) {
                if (pro.getName().equalsIgnoreCase(search) ||  pro.getBrand().equalsIgnoreCase(search) || pro.getCategory().equalsIgnoreCase(search)) {
                    list1.add(pro);
                }
            }
        } else {
            list1 = list;
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
                <th>Update</th>
                <th>Delete</th>
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
                    <form action="updateProduct.jsp">
                        <input type="hidden" name="id" value="<%= pro.getId() %>">
                        <input type="submit" value="Update">
                    </form>
                </td>
                <td class="action-buttons">
                    <form action="deleteProduct">
                        <input type="hidden" name="id" value="<%= pro.getId() %>">
                        <input type="submit" value="Delete">
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
