<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAOImp"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAO"%>
<%@page import="com.eshopping.model.Product_Details"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       body {
            background: linear-gradient(to bottom, rgb(128, 182, 207), #fff);
            color: #333333;
            font-family: 'Poppins', sans-serif;
            position: relative;
            overflow-x: hidden;
        }

        header {
            width: 100%;
            height: 80px;
            background-color: #2d2d2d; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            position: relative;
        }

        header .logo {
            display: flex;
            align-items: center;
            color: #FFD700;
            font-size: 30px;
            font-weight: bold;
        }

        header .logo img {
            height: 60px;
            margin-right: 10px;
        }
          header .logo img {
            height: 80px;
        }

        header .logo span {
            font-size: 40px;
            font-family: 'Pacifico', cursive; 
            color: #FFD700;
            text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.5);
            position: relative;
            right: 18px;
        }

        nav {
            display: flex;
            gap: 15px;
        }

        nav a {
            color: #FFD700;
            text-decoration: none;
            font-size: 14px;
            padding: 6px 14px;
            border: 2px solid #FFD700;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }

        nav a:hover {
            background-color: #FFD700;
            color: #2d2d2d;
        }

        h2 {
            color: #2d2d2d;
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
            left: 450px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            position: relative;
            left: 450px;
        }

        form input[type="text"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        form input[type="submit"] {
            background-color: #FFD700;
            color: #2d2d2d;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        form input[type="submit"]:hover {
            background-color: #2d2d2d;
            color: #FFD700;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logoB-kart-removebg-preview.png" alt="B-Kart Logo">
            <span>B-Kart</span>
        </div>
        <nav>
            <a href="HomePage.html">Home</a>
            <a href="AdminLogin.html">Admin Login</a>
        </nav>
    </header>

    <h2>Update Product Details</h2>
    <form action="updateProduct">
        <input name="id" value="<%= Integer.parseInt(request.getParameter("id")) %>" hidden>
        <input type="text" placeholder="Update Price" name="price" required>
        <input type="text" placeholder="Update Discount" name="discount" required>
        <input type="text" placeholder="Update Quantity" name="quantity" required>
        <input type="submit" value="Update">
    </form>
    <form action="AllProductDetails.jsp">
        <input type="submit" value="Back">
    </form>
</body>
</html>
