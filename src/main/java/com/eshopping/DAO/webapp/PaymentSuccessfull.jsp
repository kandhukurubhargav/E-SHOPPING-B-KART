<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            color: #333333;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            overflow: hidden;
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
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
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

        .content {
            margin-top: 120px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        img {
            width: 320px;
            height: auto;
            margin: 20px auto;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
            bottom: 35px;
        }

     

        h3 {
            font-size: 22px;
            color: #28a745;
            display: inline-block;
            padding: 0;
            margin-top: 15px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-weight: bold;
            letter-spacing: 0.5px;
            position: relative;
            z-index: 10;
            bottom: 70px;
        }

        /* Celebration effects */
        #celebration {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 2;
        }

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: rgba(255, 0, 0, 0.8);
            border-radius: 50%;
            animation: fall 4s linear infinite;
        }

        @keyframes fall {
            0% {
                transform: translateY(-100px) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(120vh) rotate(360deg);
                opacity: 0;
            }
        }

        .crackers {
            position: absolute;
            width: 20px;
            height: 20px;
            background-color: rgba(255, 165, 0, 0.8);
            border-radius: 50%;
            animation: explode 2s ease-out infinite;
        }

        @keyframes explode {
            0% {
                transform: scale(0.5);
                opacity: 1;
            }
            100% {
                transform: scale(2);
                opacity: 0;
            }
        }

        .toast-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 3;
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
        </nav>
    </header>

    <div class="content">
        <%
            String proImage = (String) session.getAttribute("ProductImage");
        %>
        <img alt="Product Image" src="images/<%=proImage%>">
        <div class="tick-symbol">
            <img src="images/tick-removebg-preview.png" alt="Tick Symbol" style="width: 80px; height:auto;position: relative;bottom: 10px;">
        </div>
        <h3>Order Confirmed</h3>
    </div>

    <!-- Celebration effects -->
    <div id="celebration"></div>

    <!-- Bootstrap Toast for celebration -->
    <div class="toast-container">
        <div id="paymentToast" class="toast" style="background-color: #28a745; color: white;">
            <div class="toast-body">
                🎉 Payment Successful! 🎉
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>

    <script>
        // Show toast
        const paymentToast = new bootstrap.Toast(document.getElementById('paymentToast'));
        paymentToast.show();

        // Create confetti and crackers
        function createCelebration() {
            const celebrationDiv = document.getElementById("celebration");
            for (let i = 0; i < 100; i++) {
                const confetti = document.createElement("div");
                confetti.classList.add("confetti");
                confetti.style.left = Math.random() * 100 + "vw";
                confetti.style.backgroundColor = `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255}, 0.8)`;
                confetti.style.animationDelay = Math.random() * 2 + "s";
                celebrationDiv.appendChild(confetti);
            }

            for (let i = 0; i < 50; i++) {
                const cracker = document.createElement("div");
                cracker.classList.add("crackers");
                cracker.style.left = Math.random() * 100 + "vw";
                cracker.style.top = Math.random() * 100 + "vh";
                cracker.style.animationDelay = Math.random() * 2 + "s";
                celebrationDiv.appendChild(cracker);
            }
        }

        createCelebration();
    </script>
</body>
</html>
