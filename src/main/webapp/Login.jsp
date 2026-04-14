<%@page import="java.sql.ResultSet"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/Navbar.jsp" %>

<%
if (request.getParameter("btnLogin") != null) {
    String username = request.getParameter("txtusername");
    String password = request.getParameter("txtpassword");

    Connection con = DataAccess.getConnection();
    boolean isValid = false;   // ✅ ADDED

    try {
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("Select CustomerID,CustomerUsername,CustomerPassword from tb_customermaster");

        while (rs.next()) {
            int dbCustid = rs.getInt(1);
            String dbusername = rs.getString(2);
            String dbpassword = rs.getString(3);

            if (dbusername.equalsIgnoreCase(username) && dbpassword.equalsIgnoreCase(password)) {
                
                session.setAttribute("username", username); // ✅ SAME NAME everywhere
                session.setAttribute("userId", dbCustid);

                response.sendRedirect("Home.jsp");
                isValid = true;   // ✅ ADDED
                break;            // ✅ VERY IMPORTANT
            }
        }

        if (!isValid) {   // ✅ ADDED
            out.print("Invalid input");
        }

    } catch (Exception ex) {
        out.print(ex.toString());
    }
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <script>
            function validateLogin() {
                let username = document.getElementById("username").value.trim();
                let password = document.getElementById("tpassword").value.trim();
                let usernameError = document.getElementById("usernameError");
                let passwordError = document.getElementById("passwordError");
                let isValid = true;

                usernameError.textContent = "";
                passwordError.textContent = "";

                if (username === "") {
                    usernameError.textContent = "Username is required.";
                    isValid = false;
                }

                if (password === "") {
                    passwordError.textContent = "Password is required.";
                    isValid = false;
                }

                return isValid;
            }
        </script>

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

            .signup-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                margin: auto;
                margin-top: 100px;
            }

            form {
                background-color: #fff;
                padding: 20px;
                margin-top: 70px;
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
                margin-bottom: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .error-message {
                color: red;
                font-size: 14px;
                margin-bottom: 10px;
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
    </head>

    <body>
        <form onsubmit="return validateLogin()">
            <h1><b>Login</b></h1>

            <label for="txtusername">Username</label>
            <input type="text" id="username" name="txtusername" placeholder="Enter your username">
            <div id="usernameError" class="error-message"></div>

            <label for="txtpassword">Password</label>
            <input type="password" id="tpassword" name="txtpassword" placeholder="Enter your password">
            <div id="passwordError" class="error-message"></div>

            <div class="buttons">
                <button type="submit" name="btnLogin">Login</button>
            </div>

            <h5> Don't have an account? <a href="Sign Up.jsp">Sign Up</a></h5>
        </form>
    </body>
</html>

<%@ include file="WEB-INF/Footer.jsp" %>