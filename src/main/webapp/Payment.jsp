<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<!DOCTYPE html>
<html>
<head>
<title>Payment</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #e1f5fe, #fce4ec);
}
.card {
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}
.btn-custom {
    background-color: #6a1b9a;
    color: white;
}
</style>
</head>

<body>

<div class="container mt-5">
<div class="card p-4">

<h2 class="text-center mb-4">? Select Payment Method</h2>

<%
    boolean isEmpty = true;

    try {
        Connection con = DataAccess.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM tbl_cartmaster WHERE userId=?"
        );

        ps.setInt(1, 1); // temp user

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            isEmpty = false;
        }

        rs.close();
        ps.close();
        con.close();

    } catch(Exception e){
        out.println(e);
    }

    if(isEmpty){
        response.sendRedirect("frmCart.jsp");
        return;
    }
%>

<form action="ProcessPayment.jsp" method="post">

<div class="form-check">
<input type="radio" name="paymentMode" value="Cash" required> Cash on Delivery
</div>

<div class="form-check">
<input type="radio" name="paymentMode" value="UPI"> UPI
</div>

<div class="form-check">
<input type="radio" name="paymentMode" value="Card"> Card
</div>

<div class="text-center mt-4">
<button class="btn btn-custom">Pay Now</button>
</div>

</form>

</div>
</div>

</body>
</html>