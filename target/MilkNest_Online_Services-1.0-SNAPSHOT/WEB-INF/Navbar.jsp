<%@page import="com.milknest.milknest_online_services.insertCart"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Logout
    if (request.getParameter("btnLogout") != null) {
        session.removeAttribute("username");
        response.sendRedirect("Login.jsp");
    }

    Integer userIddd = (Integer) session.getAttribute("userId");
    int totalCartProducts = 0;

    if (userIddd != null) {
        try {
            insertCart cartHelper = new insertCart();
            totalCartProducts = cartHelper.getTotalCartProducts(userIddd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>MilkNest</title>

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

</head>

<body>

<header>
    <h1 class="logo"><a href="Home.jsp">MilkNest</a></h1>

    <ul class="navbar">
        <li><a href="Home.jsp">Home</a></li>
        <li><a href="Home.jsp">Shop</a></li>
        <li><a href="aboutus.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>

        <% if (session.getAttribute("username") == null) { %>
            <li><a href="Login.jsp">Login/Register</a></li>
        <% } %>
    </ul>

    <!-- Cart Icon -->
    <% if (session.getAttribute("username") != null) { %>
    <div class="cart">
        <!-- ✅ FIXED LINK -->
        <a href="frmCart.jsp">
            <i class="fas fa-shopping-cart"></i>
            <span class="badge"><%= totalCartProducts %></span>
        </a>
    </div>
    <% } %>

    <!-- User -->
    <div class="user">
        <%
            String user = (String) session.getAttribute("username");
            if (user != null) {
        %>
            <span><i class="fa fa-user"></i> <%= user %></span>
            <form method="post" style="display:inline;">
                <button type="submit" name="btnLogout">Logout</button>
            </form>
        <%
            } else {
        %>
            <span>Guest</span>
        <%
            }
        %>
    </div>

</header>

</body>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 10%;
    background: #fff;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.logo a {
    text-decoration: none;
    color: #000;
}

.navbar {
    display: flex;
    list-style: none;
}

.navbar li a {
    padding: 10px 15px;
    text-decoration: none;
    color: #333;
}

.navbar li a:hover {
    color: green;
}

.cart {
    position: relative;
}

.cart i {
    font-size: 22px;
}

.badge {
    position: absolute;
    top: -5px;
    right: -10px;
    background: red;
    color: white;
    padding: 3px 6px;
    border-radius: 50%;
    font-size: 12px;
}

.user {
    margin-left: 15px;
}
</style>