<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Options</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Pacifico&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(to bottom, rgb(128, 182, 207), #fff);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            color: #333333;
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

        header .logo {
            display: flex;
            align-items: center;
        }

        header .logo span {
            font-size: 35px;
            font-family: 'Pacifico', cursive;
            color: #FFD700;
            text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.5);
        }

        nav a {
            color: #FFD700;
            text-decoration: none;
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }

        nav a:hover {
            background-color: #FFD700;
            color: #2d2d2d;
        }

        .payment-container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            color: #2d2d2d;
            position: relative;
            top: 50px;
        }

        .payment-container h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2d2d2d;
        }

        .payment-option {
            background: #f0f0f0;
            color: #2d2d2d;
            border-radius: 8px;
            padding: 10px;
            margin: 8px 0;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .payment-option:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            background-color: #FFD700;
            color: #2d2d2d;
        }

        .payment-option input {
            margin: 0;
            accent-color: #2d2d2d;
            transform: scale(1.2);
            cursor: pointer;
        }

        .payment-option img {
            height: 30px;
            width: 30px;
        }

        input[type="submit"] {
            background-color: #FFD700;
            color: #2d2d2d;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #2d2d2d;
            color: #FFD700;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <span>B-Kart</span>
        </div>
        <nav>
            <a href="HomePage.html">Home</a>
            <a href="MyOrders.jsp">My Orders</a>
            <a href="Cart.jsp">My Profile</a>
        </nav>
    </header>

    <%
        double amount = request.getParameter("totalAmount") != null ? Double.parseDouble(request.getParameter("totalAmount")) : 0.0;
        int quantity = request.getParameter("proQuantity") != null ? Integer.parseInt(request.getParameter("proQuantity")) : 0;
        session.setAttribute("TotalAmount", amount);
        session.setAttribute("Proquantiy", quantity);
    %>
    
    <div class="payment-container">
        <h2>Select Payment Method</h2>
        <form action="payment">
            <div class="payment-option">
                <input type="radio" name="paymentMethod" value="Cash On Delivery">
                <img src="images/CashOnDeliveryIcon.png" alt="Cash On Delivery">
                <span>Cash On Delivery</span>
            </div>
            <div class="payment-option">
                <input type="radio" name="paymentMethod" value="UPI">
                <img src="images/UPIicon.png" alt="UPI">
                <span>UPI</span>
            </div>
            <div class="payment-option">
                <input type="radio" name="paymentMethod" value="Credit Card">
                <img src="images/CreditCardIcon.png" alt="Credit Card">
                <span>Credit Card</span>
            </div>
            <div class="payment-option">
                <input type="radio" name="paymentMethod" value="EMI">
                <img src="images/EMIicon.png" alt="EMI">
                <span>EMI</span>
            </div>
            <input type="submit" value="Pay">
        </form>
    </div>
</body>
</html>
