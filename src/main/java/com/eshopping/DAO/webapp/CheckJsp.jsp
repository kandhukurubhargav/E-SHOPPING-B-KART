<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Pacifico&display=swap');

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

        body::before {
            content: '';
            background: url('images/logoB-kart-removebg-preview.png') no-repeat center center;
            background-size: 50%; 
            opacity: 0.1;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; 
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

        #product {
            width: 320px;
            margin-top: 20px; 
            border-radius: 10px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.9); 
            color: #333;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        #product img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        h2{
            color: #2d2d2d; 
            font-size: 20px;
            margin-bottom: 15px;
            font-weight: bold;
        }
        label {
            font-size: 12px;
            margin-bottom: 3px;
            display: block;
            text-align: left;
        }
        input {
            border-radius: 10px;
            width: 100%;
            height: 30px;
            background: transparent;
            border: 1px solid #2d2d2d;
            color: #333;
            margin-bottom: 10px;
            padding: 5px;
            font-size: 12px;
        }
        input:focus {
            outline: none;
            border-color: #FFD700;
        }

        #submit, #back {
            border-radius: 10px;
            width: 100%;
            height: 35px;
            background-color: #FFD700;
            color: #2d2d2d;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
            font-size: 14px;
        }

        #submit:hover, #back:hover {
            background-color: #2d2d2d;
            color: #FFD700;
        }

        footer {
            background-color: #2d2d2d;
            color: #f0f0f0;
            text-align: center;
            padding: 15px;
            font-size: 12px;
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.2);
            position: relative;
            top: 30px;
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
        <div id="product">
            <h2>Purchase</h2>
            <%
            String image=request.getParameter("proImage")!=null ? request.getParameter("proImage"):"No image";
            String name = request.getParameter("proname") != null ? request.getParameter("proname") : "Unknown Product";
            double price = request.getParameter("proprice") != null ? Double.parseDouble(request.getParameter("proprice")) : 0.0;
            double discount = request.getParameter("proDiscount") != null ? Double.parseDouble(request.getParameter("proDiscount")) : 0.0;
            String imageUrl = request.getParameter("proImage") != null ? request.getParameter("proImage") : "images/default-product.png";
            double discountedPrice = price - (price * discount / 100);
            %>
            <img src="images/<%= image%>" alt="<%= image %>" />
            <form action="" method="GET">
                <label for="originalName">Product Name:</label>
                <input value="<%= name %>" id="originalName" readonly><br>
                <label for="originalPrice">Original Price:</label>
                <input value="<%= price %>" id="originalPrice" readonly><br>
                <label for="originalDiscount">Discount (%):</label>
                <input value="<%= discount %>%" id="originalDiscount" readonly><br>
                <label for="discountedPrice">Discounted Price:</label>
                <input value="<%= discountedPrice %>" id="discountedPrice" readonly><br>
                <label for="quantity">Quantity:</label>
                <input placeholder="Enter Quantity" name="proQuantity" id="quantity" oninput="calculateTotal()"><br>
                <label for="totalAmount">Total Amount:</label>
                <input value="" id="totalAmount" name="totalAmount" placeholder="Total Amount" readonly><br>
                <button type="submit" id="submit">Buy</button>
            </form>
            <button onclick="history.back()" id="back">Back</button>
        </div>
    </center>

    <footer>
        <p>&copy; 2024 B-Kart. All rights reserved.</p>
    </footer>

    <script>
        function calculateTotal() {
            let quantity = document.getElementById("quantity").value;
            let discountedPrice = parseFloat(document.getElementById("discountedPrice").value);
            if (!isNaN(quantity) && quantity > 0) {
                let totalAmount = quantity * discountedPrice;
                document.getElementById("totalAmount").value = totalAmount.toFixed(2);
            } else {
                document.getElementById("totalAmount").value = "";
            }
        }
    </script>
</body>
</html>
