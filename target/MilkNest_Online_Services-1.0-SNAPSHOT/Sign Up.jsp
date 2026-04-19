<%-- 
    Document   : test
    Created on : 28 Oct 2024, 1:08:41 pm
    Author     : patil 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.milknest.milknest_online_services.Customer"%>
<%@page import="java.sql.SQLException"%> 

<%! Customer c = new Customer();%>

<%!
    String successMessage = "";
%>

<%    if (request.getParameter("btnSave") != null) {
        try {
            c.setCustomerName(request.getParameter("name"));
            c.setCustomerAdress(request.getParameter("address"));
            c.setCustomerContact(request.getParameter("mobno"));
            c.setCustomerEmail(request.getParameter("email"));
            c.setCustomerUsername(request.getParameter("username"));
            c.setCustomerPassword(request.getParameter("password"));
            c.insertCustomer(c);
            successMessage = "Registration successful!";
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <script>
            function validateForm() {
                let isValid = true;

                document.getElementById("usernameError").innerText = "";
                document.getElementById("passwordError").innerText = "";
                document.getElementById("contactError").innerText = "";
                document.getElementById("emailError").innerText = "";

                const username = document.getElementById("username").value.trim();
                const password = document.getElementById("password").value.trim();
                const contactNo = document.getElementById("contactno").value.trim();
                const email = document.getElementById("email").value.trim();

                if (username === "") {
                    document.getElementById("usernameError").innerText = "Username is required.";
                    isValid = false;
                }

                if (password === "") {
                    document.getElementById("passwordError").innerText = "Password is required.";
                    isValid = false;
                }

                const contactNoPattern = /^\d{10}$/;
                if (!contactNoPattern.test(contactNo)) {
                    document.getElementById("contactError").innerText = "Please enter a valid 10-digit contact number.";
                    isValid = false;
                }

                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailPattern.test(email)) {
                    document.getElementById("emailError").innerText = "Please enter a valid email address.";
                    isValid = false;
                }

                return isValid;
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .error {
                color: red;
                font-size: 14px;
                margin-bottom: 10px;
            }
            button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="WEB-INF/Navbar.jsp" %>

        <form method="post" onsubmit="return validateForm();">
            <h1>Sign Up</h1>
            <% if (!successMessage.isEmpty()) {%>
            <p class="success"><%= successMessage%></p>
            <% }%>
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name">

            <label for="address">Address</label>
            <input type="text" id="address" name="address" placeholder="Enter your address">

            <label for="mobno">Contact</label>
            <input type="tel" id="contactno" name="mobno" placeholder="Enter your contact number">
            <span id="contactError" class="error"></span>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email">
            <span id="emailError" class="error"></span>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username">
            <span id="usernameError" class="error"></span>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password">
            <span id="passwordError" class="error"></span>

            <button type="submit" name="btnSave">Sign Up</button>
            <h5> Have an account? <a href="Login.jsp">Sign IN</a></h5>
        </form>

        <%@include file="WEB-INF/Footer.jsp" %>
    </body>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            background-image: url("https://wallpapers.com/images/hd/milk-background-nn4uqvyma4v02ltr.jpg");
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        form {
            /*                background-size: cover;*/
            background-color: #fff;
            padding: 20px;
            margin-top: 50px;
            border: 2px solid #000;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
        }

        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }

        button.cancel {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</html>
