<%@page import="java.util.ArrayList"%>
<%@page import="com.milknest.milknest_online_services.Cart"%>
<%@page import="com.milknest.milknest_online_services.Payment"%>

<%
String user = (String) session.getAttribute("username");
if(user == null){
    response.sendRedirect("Login.jsp");
    return;
}

ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart");
double total = 0;

if(cartList != null){
    for(Cart c : cartList){
        total += c.getPrice();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<div class="card p-4">
    <h2 class="text-center">Payment Page</h2>

    <h4>Total Amount: ? <%=total%></h4>

    <form method="post">

        <label>Select Payment Method</label>
        <select name="paymentMode" class="form-control" required>
            <option value="">--Select--</option>
            <option value="Cash">Cash on Delivery</option>
            <option value="UPI">UPI</option>
            <option value="Card">Debit/Credit Card</option>
        </select>

        <br>

        <input type="text" name="upi" class="form-control" placeholder="Enter UPI ID">
        <input type="text" name="card" class="form-control mt-2" placeholder="Enter Card Number">

        <br>

        <button type="submit" name="payNow" class="btn btn-success">Pay Now</button>
    </form>
</div>

</body>
</html>

<%
if(request.getParameter("payNow") != null){
    try{
        Integer userId = (Integer) session.getAttribute("userId");

        Payment p = new Payment();

        p.setPaymentname("MilkNest Order");
        p.setPaymentdate(java.time.LocalDate.now().toString());
        p.setPaymentmode(request.getParameter("paymentMode"));
        p.setPaymenttotalamount((int) total);
        p.setQty(cartList.size());
        p.setDiscount(0);
        p.setNetamount((int) total);
        p.setCustomerID(userId);

        boolean status = p.insertPayment(p);

        if(status){
            session.removeAttribute("cart");
%>
<script>
    alert("Payment Successful!");
    window.location="Home.jsp";
</script>
<%
        } else {
%>
<script>alert("Payment Failed!");</script>
<%
        }

    } catch(Exception ex){
        out.print(ex);
    }
}
%>