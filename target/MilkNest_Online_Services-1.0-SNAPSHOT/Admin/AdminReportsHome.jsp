<%-- 
    Document   : AdminReportsHome
    Created on : 21 Feb 2025, 2:24:12 pm
    Author     : Santosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Reports - Milk-Nest</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        h1 {
            color: #007bff;
        }
        p {
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <%@include file="ReportsNavbar.jsp" %>

    <div class="container">
        <h1>Welcome to the Cream-Line Admin Reports</h1>
        <p>
            This reporting system provides an overview of **Cream-Line's** key data.  
            Admins can use this section to generate and analyze reports on:
        </p>
        <ul style="text-align: left; display: inline-block;">
            <li><b>Admins:</b> View and manage administrator details.</li>
            <li><b>Carts:</b> Track products added to user carts.</li>
            <li><b>Customers:</b> Access customer information and activity.</li>
            <li><b>Customer Orders:</b> Monitor and analyze customer purchase history.</li>
            <li><b>Products:</b> Manage product listings, pricing, and categories.</li>
            <li><b>Add new Products:</b> To Add new Products from admin side.</li>
            <li><b>Add new Categories:</b> To Add new Categories from admin side .</li>
        </ul>
        <p>Navigate using the menu above to access detailed reports.</p>
    </div>
</body>
</html>
