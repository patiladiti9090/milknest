<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>

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

<div class="container mt-5">
    <div class="card p-4">

        <h2 class="text-center mb-4">Your Cart</h2>

<%
    double total = 0;
    boolean isEmpty = true;

    try {
        Connection con = DataAccess.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "SELECT c.cartID, p.productname, c.price FROM tbl_cartmaster c " +
            "JOIN tb_productsmaster p ON c.productId = p.productID " +
            "WHERE c.userId=?"
        );

        ps.setInt(1, 1); // ? TEMP USER (later login use kar)

        ResultSet rs = ps.executeQuery();
%>

        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Cart ID</th>
                        <th>Product Name</th>
                        <th>Price ?</th>
                    </tr>
                </thead>
                <tbody>

<%
        while (rs.next()) {
            isEmpty = false;
            total += rs.getDouble("price");
%>

                    <tr>
                        <td><%=rs.getInt("cartID")%></td>
                        <td><%=rs.getString("productname")%></td>
                        <td>? <%=rs.getDouble("price")%></td>
                    </tr>

<%
        }
%>

<%
        if (!isEmpty) {
%>
                    <tr class="table-success">
                        <td colspan="2"><b>Total</b></td>
                        <td><b>? <%=total%></b></td>
                    </tr>
<%
        }
%>

                </tbody>
            </table>
        </div>

<%
        if (isEmpty) {
%>
            <div class="text-center">
                <h4 class="text-danger">Cart is empty</h4>
            </div>
<%
        } else {
%>

        <!-- PAYMENT BUTTON -->
        <div class="text-center mt-3">
            <form method="post" action="Payment.jsp">
                <input type="submit" value="Proceed to Payment"
                class="btn btn-custom px-4">
            </form>
        </div>

<%
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
%>

        <div class="alert alert-danger">
            Error: <%=e.getMessage()%>
        </div>

<%
    }
%>

        <div class="text-center mt-3">
            <a href="Shop.jsp" class="btn btn-outline-primary">Continue Shopping</a>
            
        </div>

    </div>
</div>

</body>
</html>