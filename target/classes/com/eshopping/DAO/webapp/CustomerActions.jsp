<%@page import="com.eshopping.model.CartDetails"%>
<%@page import="com.eshopping.DAO.CartDAOImp"%>
<%@page import="com.eshopping.DAO.CartDAO"%>
<%@page import="com.eshopping.model.Customer_Details"%>
<%@page import="com.eshopping.DAO.CustomerDAOImp"%>
<%@page import="com.eshopping.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAOImp"%>
<%@page import="com.eshopping.DAO.ProductDetailsDAO"%>
<%@page import="com.eshopping.model.Product_Details"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B-kart CustomerActions</title>
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

        nav {
            display: flex;
            align-items: center;
        }

        nav a {
            color: #FFD700;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 15px;
            transition: background 0.3s;
            margin-left: 20px;
        }

        nav img{
        width: 18px;
        height: auto;
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
            position: relative;
            top: 230px;
        }
        #customername{
        width: 100px;
        height: 23px;
        border:1px solid yellow;
         color: #FFD700;
        position: relative;
        border-radius:15px;
        right: 40px;
        left:10px;
        text-align: center;
        }
        #cartButton{
        position: relative;
        left: 290px;
        background-color:#2d2d2d;
        color: red;
        border: none;
        outline: none;
        }
        #cart{
        width: 65px;
        height:55px;
        }
        #count{
        position: relative;
        color: #FFD700;
        font-size: 18px;
        bottom: 30px;
        right: 12px;
        }
        .product-image {
    width: 80px; /* Adjust based on your table layout */
    height: auto;
    border-radius: 5px; /* Optional for rounded corners */
}
    </style>
</head>
<body>
      <%!
        ProductDetailsDAO productDetailsDAO = new ProductDetailsDAOImp();
        List<Product_Details> list;
        CustomerDAO customerDAO=new CustomerDAOImp();
        CartDAO cartDAO=new CartDAOImp();
    %>
    <% 
     Customer_Details customer_Details=(Customer_Details)session.getAttribute("customerDetails");
            List<CartDetails> list3=cartDAO.getCartDetails(customer_Details.getId());
            int count=list3.size();
            if(session.getAttribute("CustCount")!=null){
            	count=(Integer) session.getAttribute("CustCount");
            }
    %>
    <header>
        <div class="logo">
            <img src="images/logoB-kart-removebg-preview.png" alt="B-Kart Logo">
            <span>B-Kart</span>
        </div>
         <form action="Cart.jsp">
        <button id="cartButton">
            <img id="cart" src="images/cart.png" ><sup id="count"><%= count %></sup>     
        </button>
    </form>
        
        <nav>
            <a href="HomePage.html">Home</a>
            <a href="MyOrders.jsp">My Orders</a> <!-- New My Orders link -->
            <img alt="" src="images/profile.png">
            <div id="customername"><%=customer_Details.getName()%></div>
        </nav>
    </header>

    <h2>All Product Details</h2>
    <div class="search-bar">
        <form action="CustomerActions.jsp">
            <input type="text" name="query" placeholder="Search products...">
            <button type="submit">Search</button>
        </form>
    </div>

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
            <th>Buy</th>
            <th>Add To Cart</th>
        </tr>
    </thead>
    <tbody>
        <% for (Product_Details pro : list1) { %>
        <tr>
            <td>
                <img src="images/<%=pro.getImage() %>" alt="<%= pro.getName() %>" class="product-image">
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
                   <input type="hidden" name="customerid" value="<%= customer_Details.getId() %>">
                
                    <input type="hidden" name="proid" value="<%= pro.getId() %>">
                    <input type="hidden" name="proname" value="<%= pro.getName() %>">
                    <input type="hidden" name="proprice" value="<%= pro.getPrice() %>">
                    <input type="hidden" name="proDiscount" value="<%= pro.getDiscount() %>">
                    <input type="submit" value="Buy">
                </form>
            </td>
            <td class="action-buttons">
                <form action="addToCart">
                    <input type="hidden" name="custid" value="<%= customer_Details.getId() %>">
                    <input type="hidden" name="proid" value="<%= pro.getId() %>">
                    <input type="submit" value="Add To Cart">
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
