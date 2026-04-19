<%@page import="com.milknest.milknest_online_services.Admin"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%!
ResultSet rs;
Admin a=new Admin();
%>
<%
if(request.getParameter("btnSave")!=null)
{
try{
            a.setAdmin_Name(request.getParameter("admin_name"));
            a.setAdmin_Contact(request.getParameter("admin_contact"));
            a.setAdmin_Email(request.getParameter("admin_email"));
            a.setAdmin_Username(request.getParameter("admin_username"));
            a.setAdmin_Password(request.getParameter("admin_password"));
            a.insertAdmin(a);

            // ? ONLY THIS LINE ADDED
            response.sendRedirect("admin_login.jsp");

}
catch(Exception ex)
{
out.print(ex);
}
}
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Sign Up</title>
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
            .signup-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                margin: auto;
                margin-top: 90px;
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
            .error-message {
                color: red;
                font-size: 14px;
                margin-top: 5px;
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
                let isValid = true;
                
                let name = document.getElementById("admin_name").value.trim();
                let contact = document.getElementById("admin_contact").value.trim();
                let email = document.getElementById("admin_email").value.trim();
                let username = document.getElementById("admin_username").value.trim();
                let password = document.getElementById("admin_password").value.trim();
                
                document.getElementById("nameError").textContent = "";
                document.getElementById("contactError").textContent = "";
                document.getElementById("emailError").textContent = "";
                document.getElementById("usernameError").textContent = "";
                document.getElementById("passwordError").textContent = "";
                
                if (name === "") {
                    document.getElementById("nameError").textContent = "Admin Name is required.";
                    isValid = false;
                }
                if (contact === "" || !/^[0-9]{10}$/.test(contact)) {
                    document.getElementById("contactError").textContent = "Enter a valid 10-digit contact number.";
                    isValid = false;
                }
                if (email === "" || !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
                    document.getElementById("emailError").textContent = "Enter a valid email address.";
                    isValid = false;
                }
                if (username === "") {
                    document.getElementById("usernameError").textContent = "Admin Username is required.";
                    isValid = false;
                }
                if (password === "" || password.length < 6) {
                    document.getElementById("passwordError").textContent = "Password must be at least 6 characters long.";
                    isValid = false;
                }
                return isValid;
            }
        </script>
    </head>
    <body>
        <main>
            <div class="signup-container">
                <h2>Admin Sign Up</h2>
                <form method="POST" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="admin_name">Admin Name</label>
                        <input type="text" id="admin_name" name="admin_name">
                        <div id="nameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="admin_contact">Admin Contact</label>
                        <input type="text" id="admin_contact" name="admin_contact">
                        <div id="contactError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="admin_email">Admin Email</label>
                        <input type="text" id="admin_email" name="admin_email">
                        <div id="emailError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="admin_username">Admin Username</label>
                        <input type="text" id="admin_username" name="admin_username">
                        <div id="usernameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="admin_password">Admin Password</label>
                        <input type="password" id="admin_password" name="admin_password">
                        <div id="passwordError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="btnSave" id="btnSave" >Sign Up</button>
                    </div>
                    <div class="sub-content">
                        <div class="s-part">
                            Already have an account? <a href="admin_login.jsp">Sign In</a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>