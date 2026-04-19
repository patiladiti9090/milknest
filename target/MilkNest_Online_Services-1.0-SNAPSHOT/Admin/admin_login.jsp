<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<%
    if (request.getParameter("btnLogin") != null) {
        String adminUsername = request.getParameter("txtadmin_username").trim();
        String password = request.getParameter("txtadmin_password").trim();

        // Backend validation for empty fields
        if (adminUsername.isEmpty() || password.isEmpty()) {
            out.print("<script>alert('Username and Password cannot be empty!');</script>");
        } 
        // Validate username (only alphanumeric allowed)
        else if (!adminUsername.matches("^[a-zA-Z0-9]+$")) {
            out.print("<script>alert('Username must be alphanumeric only!');</script>");
        } 
        // Validate password (min 6 characters)
        else if (password.length() < 6) {
            out.print("<script>alert('Password must be at least 6 characters long!');</script>");
        } 
        else {
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                con = DataAccess.getConnection();
                String sql = "SELECT Admin_Username FROM admin_master WHERE Admin_Username = ? AND Admin_Password = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, adminUsername);
                pstmt.setString(2, password);

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    session.setAttribute("adminusername", adminUsername);
                    response.sendRedirect("AdminReportsHome.jsp");
                } else {
                    out.print("<script>alert('Invalid Username or Password');</script>");
                }

            } catch (Exception ex) {
                out.print("<script>alert('Database Error: " + ex.getMessage() + "');</script>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            background-image: url("https://wallpapers.com/images/hd/milk-background-nn4uqvyma4v02ltr.jpg");
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
            margin-top: 100px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function validateForm() {
            let username = document.getElementById("admin_username").value.trim();
            let password = document.getElementById("admin_password").value.trim();

            // Check if fields are empty
            if (username === "" || password === "") {
                alert("Username and Password cannot be empty.");
                return false;
            }

            // Username should be alphanumeric only
            let usernameRegex = /^[a-zA-Z0-9]+$/;
            if (!usernameRegex.test(username)) {
                alert("Username must be alphanumeric only!");
                return false;
            }

            // Password should be at least 6 characters long
            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="POST" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="admin_username">Admin Username</label>
                <input type="text" id="admin_username" name="txtadmin_username" placeholder="Enter your Username" required>
            </div>
            <div class="form-group">
                <label for="admin_password">Admin Password</label>
                <input type="password" id="admin_password" name="txtadmin_password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <button type="submit" name="btnLogin">Login</button>
            </div>
            <div class="sub-content">
                <div class="s-part">
                    Don't have an account? <a href="admin_signup.jsp">Sign Up</a>
                </div>
            </div>
        </form>
    </div>

    <%@ include file="../WEB-INF/Footer.jsp" %>
</body>
</html>
