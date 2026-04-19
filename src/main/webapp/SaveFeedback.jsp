<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<%
/* ? STEP 1: LOGOUT HANDLE */
if("logout".equals(request.getParameter("action"))){
    session.invalidate();
%>
<script>
alert("Logged out successfully!");
window.location="Login.jsp";
</script>
<%
    return;
}
%>

<%
/* ? STEP 2: SAVE FEEDBACK */
String rating = request.getParameter("rating");
String comment = request.getParameter("comment");

Integer userId = (Integer) session.getAttribute("userId");

if(userId == null){
    response.sendRedirect("Login.jsp");
    return;
}

if(rating != null){   // only when form submitted

    try{

        Connection cn = DataAccess.getConnection();

        PreparedStatement ps = cn.prepareStatement(
            "INSERT INTO tb_feedback(rating,comment,customerID) VALUES(?,?,?)"
        );

        ps.setInt(1, Integer.parseInt(rating));
        ps.setString(2, comment);
        ps.setInt(3, userId);

        int i = ps.executeUpdate();

        ps.close();
        cn.close();

        if(i == 1){
%>

<!DOCTYPE html>
<html>
<head>
<title>Thank You</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #e8f5e9, #e3f2fd);
}
.card {
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}
</style>

</head>

<body>

<div class="container mt-5">
<div class="card p-4 text-center">

<h2 class="text-success">? Feedback Submitted Successfully!</h2>
<p class="mt-3">Thank you for your feedback ?</p>

<div class="mt-4">
    
    <!-- ? HOME BUTTON -->
    <a href="Home.jsp" class="btn btn-primary me-2">? Home</a>

    <!-- ? LOGOUT BUTTON (SAME PAGE CALL) -->
    <form method="post" style="display:inline;">
        <input type="hidden" name="action" value="logout">
        <button class="btn btn-danger">? Logout</button>
    </form>

</div>

</div>
</div>

</body>
</html>

<%
        } else {
%>
<script>
alert("Feedback not saved!");
window.location="Feedback.jsp";
</script>
<%
        }

    } catch(Exception e){
        out.print("Error: " + e.getMessage());
    }
}
%>