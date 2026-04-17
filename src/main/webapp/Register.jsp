

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Set"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.milknest.milknest_online_services.User"%>
<%@page import="java.sql.SQLException"%> 



<%! User u = new User();%>

<%!
    String Username;
    String Usercontact;
    String Useremail;
    String UserPassword;
%>

<%    if (request.getParameter("btnSave") != null) {
        try {
            u.setUsername(request.getParameter("name"));
            u.setUsercontact(request.getParameter("mobno"));
            u.setUseremail(request.getParameter("email"));
            u.setUserPassword(request.getParameter("password"));
            u.insertUser(u);

        } catch (Exception ex) {
            out.print(ex);
        }

    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>


        <script>
            // Validation function for all fields
            function validateForm() {
                // Get form field values
                const username = document.getElementById("username").value.trim();
                const password = document.getElementById("password").value.trim();
                const contactNo = document.getElementById("contactno").value.trim();
                const email = document.getElementById("exampleInputEmail1").value.trim();

                // Check if any field is empty
                if (username === "") {
                    alert("Username is required.");
                    return false; // Prevent form submission
                }

                if (password === "") {
                    alert("Password is required.");
                    return false; // Prevent form submission
                }

                if (contactNo === "") {
                    alert("Contact No is required.");
                    return false; // Prevent form submission
                }

                if (email === "") {
                    alert("Email ID is required.");
                    return false; // Prevent form submission
                }

                // Check if contact number is numeric and 10 digits
                const contactNoPattern = /^\d{10}$/;
                if (!contactNoPattern.test(contactNo)) {
                    alert("Please enter a valid 10-digit contact number.");
                    return false; // Prevent form submission
                }

                // Check if email is valid
                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailPattern.test(email)) {
                    alert("Please enter a valid email address.");
                    return false; // Prevent form submission
                }

                return true; // Allow form submission
            }
        </script>
    </head>
    <body>

      <%@include file="WEB-INF/Navbar.jsp" %>

        <form> 
            <div class="main">
                <div class="container">
                    <form class="login-form">
                        <h1><b>Register Now..!</b></h1>

                        <label for="name">User Name</label>
                        <input type="text" id="name" name="name" onkeyup="validationUsername(this.value)" placeholder="Enter your user name" >

                        <label for="mobno">Contact</label>
                        <input type="tel" id="mobno" name="mobno" onkeyup="mobileValidation(this.value)" placeholder="Enter your contact number" required pattern="{10}">

                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" onkeyup="emailValidation(this.value)"  placeholder="Enter your email" required>

                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" onkeyup="passwordValidation(this.value)" placeholder="Enter your password">

                        <div class="buttons">
                            <button type="submit" value="Save" name="btnSave">Register..!</button>              
                        </div>
                </div>
            </div>
        </form> 

        <%@include file="../WEB-INF/Footer.jsp" %>
    </body>
</html>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    form {
        text-align: left;
        background-image: url("https://wallpapers.com/images/hd/milk-background-nn4uqvyma4v02ltr.jpg");
        padding-left: 28%;
        padding-bottom: 2%;
        padding-top: 2%;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        color: #333;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }


    .container {
        background-color: #fff;
        padding: 30px;
        margin-top: 100px;
        margin-left: 20px;
        border: 2px solid black;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 400px;
        flex-grow: 1;
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

    input, select {
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
        background-color: #28a745;
        color: #fff;
    }

    button.cancel {
        background-color: #dc3545;
        color: #fff;
    }
    /* 
       .main-content {
           flex: 1;
       }
         .hero-section{
       
               background-size: cover;
               height: 400px;
               justify-content: center;
               align-items: flex-end;
           }*/

</style>