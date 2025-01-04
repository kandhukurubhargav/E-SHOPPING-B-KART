<%@page import="java.util.Random"%>
<%@page import="com.eshopping.DAO.CustomerDAOImp"%>
<%@page import="com.eshopping.DAO.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAOImp"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAO"%>
<%@page import="com.eshopping.model.Product_Details"%>
<%@page import="com.eshopping.model.CartDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.eshopping.DAO.CartDAOImp"%>
<%@page import="com.eshopping.DAO.CartDAO"%>
<%@page import="com.eshopping.model.Customer_Details"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Email - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Pacifico&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background:rgb(128, 182, 207);
            font-family: 'Poppins', sans-serif;
            color: #333;
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
        }

        header .logo img {
            height: 64px;
        }

        header .logo span {
            font-size: 35px;
            font-family: 'Pacifico', cursive;
            color: #FFD700;
            text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.5);
            position: relative;
            bottom: 12px;
            right: 13px;
        }

        nav {
            display: flex;
            gap: 20px;
        }

        nav a {
            color: #FFD700;
            text-decoration: none;
            font-size: 14px;
            padding: 6px 14px;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }

        nav a:hover {
            background-color: #FFD700;
            color: #2d2d2d;
        }

        #email-form {
            margin-top: 100px;
            width: 300px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        form input[type="text"],
        form input[type="submit"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #2d2d2d;
        }

        form input[type="submit"] {
            background-color: #FFD700;
            color: #2d2d2d;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        form input[type="submit"]:hover {
            background-color: #2d2d2d;
            color: #FFD700;
        }

        center {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #2d2d2d;
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
        </nav>
    </header>

    <center>
        <div id="email-form">
            <form action="">
                <input type="text" placeholder="Enter your Email ID" name="emailid" required>
                <input type="submit" value="Verify">
            </form>
        </div>
        <%!
        CustomerDAO customerDAO = new CustomerDAOImp();
        Random random = new Random();
        int otp;
        %>
        <%
        String emailid = request.getParameter("emailid");
        if (customerDAO.checkCustomerEmailid(emailid)) {
            otp = random.nextInt(123456);
            session.setAttribute("customerOTP", otp);
            session.setAttribute("customerEmailid", emailid);
        %>
            <h1>OTP: <%= otp %></h1>
            <form action="CreateNewPassword.jsp">
                <input type="text" placeholder="Enter your OTP" name="oottpp" required>
                <input type="submit" value="Submit">
            </form>
        <% } %>
    </center>
</body>
</html>
