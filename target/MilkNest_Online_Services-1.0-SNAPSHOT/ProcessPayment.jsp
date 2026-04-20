<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<!DOCTYPE html>
<html>
<head>
<title>Receipt</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #e8f5e9, #e3f2fd);
}
.card {
    max-width: 550px;
    margin: auto;
    margin-top: 50px;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.2);
}
.success {
    color: green;
    font-weight: bold;
}
.btn-group a {
    margin: 5px;
}
</style>
</head>

<body>

<div class="card text-center">

<h2 class="success">? Payment Successful</h2>
<hr>

<%
    String mode = request.getParameter("paymentMode");
    int userId = 1;
    double total = 0;

    try {
        Connection con = DataAccess.getConnection();

        // ? GET TOTAL
        PreparedStatement ps1 = con.prepareStatement(
            "SELECT SUM(price) AS total FROM tbl_cartmaster WHERE userId=?"
        );
        ps1.setInt(1, userId);

        ResultSet rs = ps1.executeQuery();
        if(rs.next()){
            total = rs.getDouble("total");
        }

        // ? SAVE PAYMENT
        PreparedStatement ps2 = con.prepareStatement(
            "INSERT INTO tb_paymentmaster(paymentname, paymentdate, paymentmode, paymenttotalamount, qty, discount, netamount, customerID) VALUES(?,?,?,?,?,?,?,?)"
        );

        ps2.setString(1, "MilkNest Payment");
        ps2.setString(2, new java.util.Date().toString());
        ps2.setString(3, mode);
        ps2.setDouble(4, total);
        ps2.setInt(5, 1);
        ps2.setDouble(6, 0);
        ps2.setDouble(7, total);
        ps2.setInt(8, userId);

        ps2.executeUpdate();

        // ? CLEAR CART
        PreparedStatement ps3 = con.prepareStatement(
            "DELETE FROM tbl_cartmaster WHERE userId=?"
        );
        ps3.setInt(1, userId);
        ps3.executeUpdate();

        con.close();

    } catch(Exception e){
        out.println(e);
    }
%>

<p><b>Payment Mode:</b> <%=mode%></p>
<p><b>Total Amount:</b> ? <%=total%></p>
<p><b>Date:</b> <%=new java.util.Date()%></p>

<hr>

<div class="btn-group">
    <a href="Feedback.jsp" class="btn btn-warning">? Give Feedback</a>
    <a href="Shop.jsp" class="btn btn-primary">? Continue Shopping</a>
    <a href="Logout.jsp" class="btn btn-danger">? Logout</a>
</div>

</div>

</body>
</html>