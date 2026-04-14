<%@page import="java.util.ArrayList"%>
<%@page import="com.milknest.milknest_online_services.Cart"%>
<%@page import="com.milknest.milknest_online_services.Payment"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #f3e5f5);
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .btn-custom {
            background-color: #6a1b9a;
            color: white;
        }

        .btn-custom:hover {
            background-color: #4a148c;
        }

        h2 {
            color: #6a1b9a;
        }
    </style>
</head>

<body>

<!-- ? LOGIN CHECK -->
<%
String user = (String) session.getAttribute("username");

if(user == null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<div class="container mt-5">

    <div class="card p-4">

        <h2 class="text-center mb-4">? Your Cart</h2>

<%
    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart");
    double total = 0;

    if (cartList != null && !cartList.isEmpty()) {
%>

        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Price ?</th>
                    </tr>
                </thead>

                <tbody>

<%
        for (Cart c : cartList) {
            total += c.getPrice();
%>

                    <tr>
                        <td><%=c.getProductId()%></td>
                        <td><%=c.getProductName()%></td>
                        <td>? <%=c.getPrice()%></td>
                    </tr>

<%
        }
%>

                    <tr class="table-success">
                        <td colspan="2"><b>Total</b></td>
                        <td><b>? <%=total%></b></td>
                    </tr>

                </tbody>
            </table>
        </div>

        <!-- ? FORM (added hidden fix, structure same) -->
        <div class="text-center mt-3">
            <form method="post" action="frmCart.jsp">
                <input type="hidden" name="btnPay" value="true"> <!-- ? ADDED -->
                <input type="submit" value="Proceed to Payment"
                class="btn btn-custom px-4">
            </form>
        </div>

<%
    } else {
%>

        <div class="text-center">
            <h4 class="text-danger">? Cart is empty</h4>
        </div>

<%
    }
%>

        <div class="text-center mt-3">
            <a href="Shop.jsp" class="btn btn-outline-primary">Continue Shopping</a>
        </div>

    </div>
</div>

<%
    // PAYMENT LOGIC (only condition updated)
    if ("true".equals(request.getParameter("btnPay"))) {
        try {

            Integer userId = (Integer) session.getAttribute("userId");

            if(userId == null){
                response.sendRedirect("Login.jsp");
                return;
            }

            Payment p = new Payment();

            p.setPaymentname("MilkNest Order");
            p.setPaymentdate(java.time.LocalDate.now().toString());
            p.setPaymentmode("Cash");
            p.setPaymenttotalamount((int) total);
            p.setQty(cartList.size());
            p.setDiscount(0);
            p.setNetamount((int) total);

            p.setCustomerID(userId);

            boolean status = p.insertPayment(p);

            if (status) {
                session.removeAttribute("cart");
%>
                <script>
                    alert("Payment Successful!");
                    window.location="Home.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("Payment Failed!");
                </script>
<%
            }

        } catch (Exception ex) {
            out.print("Error: " + ex.getMessage());
        }
    }
%>

</body>
</html>