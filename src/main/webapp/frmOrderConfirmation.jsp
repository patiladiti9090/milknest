<%@page import="java.time.LocalDateTime"%>
<%
    Integer userIDD = (Integer) session.getAttribute("userId");
    if (userIDD == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    double grandTotal = (double) session.getAttribute("grandTotal");
    String paymentMethod = (String) session.getAttribute("paymentMethod");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@include file="WEB-INF/Navbar.jsp" %>
    <div class="container mt-4">
        <h2 class="text-center text-success mb-4">Order Confirmed!</h2>
        <div class="card">
            <div class="card-body">
                <h4>Order Summary</h4>
                <p><strong>Order Date:</strong> <%= LocalDateTime.now() %></p>
                <p><strong>Payment Method:</strong> <%= paymentMethod %></p>
                <p><strong>Grand Total:</strong> ?<%= grandTotal %></p>
                <hr>
                <p>Thank you for shopping with us. Your order has been successfully placed!</p>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="Shop.jsp" class="btn btn-primary">Continue Shopping</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
