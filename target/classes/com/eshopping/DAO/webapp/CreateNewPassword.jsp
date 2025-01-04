<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Password - B-Kart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Pacifico&display=swap');

        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(to bottom, rgb(128, 182, 207), #fff);
            color: #333;
            font-family: 'Poppins', sans-serif;
            position: relative;
            overflow-x: hidden;
        }

        /* Watermark */
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

        /* Header Section */
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

        /* Form Section */
        #form-container {
            width: 400px;
            margin-top: 120px;
            border-radius: 15px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
            text-align: center;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #2d2d2d;
            font-size: 24px;
            margin-bottom: 20px;
        }

        input[type="password"], input[type="submit"] {
            width: 100%;
            height: 40px;
            border-radius: 15px;
            border: 1px solid #2d2d2d;
            margin-bottom: 15px;
            padding: 10px;
            font-size: 14px;
        }

        input[type="password"]:focus {
            outline: none;
            border-color: #FFD700;
        }

        input[type="submit"] {
            background-color: #FFD700;
            color: #2d2d2d;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2d2d2d;
            color: #FFD700;
        }

        /* Footer Section */
        footer {
            background-color: #2d2d2d;
            color: #f0f0f0;
            text-align: center;
            padding: 20px;
            font-size: 16px;
            position: relative;
            top: 70px;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
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
        <!-- Main Form Section -->
        <div id="form-container">
            <% 
            int otp = Integer.parseInt(request.getParameter("oottpp"));
            session.setAttribute("oottpp", otp);
            int Eotp = (Integer) session.getAttribute("customerOTP");
            if (otp == Eotp) {
            %>
                <h1>Create New Password</h1>
                <form action="createpaasword">
                    <input type="password" placeholder="Enter New Password" name="newPassword" required><br>
                    <input type="password" placeholder="Confirm Password" name="newPassword1" required><br>
                    <input type="submit" value="Submit">
                </form>
            <% 
            } else { %>
           <form action="ForgotPassword.jsp">
              <center><h3 style="color: red;margin-top: 100px;text-align: center;" >Invalid Otp Go Back Verify Again</h3></center>
                      <input type="submit" value="Go Back" >
           
           </form>               
          <%  }
            %>
        </div>
    </center>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 B-Kart. All rights reserved.</p>
    </footer>
</body>
</html>
