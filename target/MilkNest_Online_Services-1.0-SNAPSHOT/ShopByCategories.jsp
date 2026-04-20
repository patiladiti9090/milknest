<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<!DOCTYPE html>
<html>
<head>
<title>MilkNest Products</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    background: linear-gradient(to right, #f8f9fa, #e3f2fd);
    font-family: 'Segoe UI', sans-serif;
}

h2 {
    font-weight: bold;
    color: #333;
}

.product-box {
    border: none;
    padding: 15px;
    background: white;
    text-align: center;
    border-radius: 15px;
    height: 100%;
    box-shadow: 0px 5px 15px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.product-box:hover {
    transform: translateY(-8px) scale(1.03);
    box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
}

.product-box img {
    height: 170px;
    width: 100%;
    object-fit: cover;
    border-radius: 10px;
}

.product-box h5 {
    font-weight: 600;
    margin-top: 10px;
}

.product-box p {
    font-size: 14px;
    color: #555;
}

.price {
    color: #28a745;
    font-size: 18px;
    font-weight: bold;
}

.btn-cart {
    background: #007bff;
    color: white;
    border-radius: 20px;
    padding: 5px 15px;
    transition: 0.3s;
}

.btn-cart:hover {
    background: #0056b3;
}

</style>

</head>

<body>

<div class="container mt-4">

<h2 class="mb-4 text-center">? Our Products</h2>

<div class="row">

<%
    try {

        String catid = request.getParameter("catid");

        Connection cn = DataAccess.getConnection();

        PreparedStatement ps = cn.prepareStatement(
            "SELECT * FROM tb_productsmaster WHERE productCatID=? LIMIT 16"
        );

        ps.setInt(1, Integer.parseInt(catid));

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>

    <div class="col-md-3 mb-4">

        <div class="product-box">

            <img src="<%=rs.getString("productImage")%>"
                 onerror="this.src='images/default.png'">

            <h5><%=rs.getString("productname")%></h5>

            <p><%=rs.getString("productDescription")%></p>

            <p class="price">? <%=rs.getDouble("productSaleprise")%></p>

            <!-- ? ONLY FIX APPLIED HERE -->
            <form action="<%=request.getContextPath()%>/CartServlet" method="post">
    <input type="hidden" name="productId" value="<%=rs.getInt("productID")%>">
    <input type="hidden" name="productName" value="<%=rs.getString("productname")%>">
    <input type="hidden" name="price" value="<%=rs.getDouble("productSaleprise")%>">

    <button class="btn btn-cart btn-sm">? Add to Cart</button>
</form>

        </div>

    </div>

<%
        }

        rs.close();
        ps.close();
        cn.close();

    } catch (Exception e) {
%>

    <div class="alert alert-danger">
        Error: <%=e.getMessage()%>
    </div>

<%
    }
%>

</div>
</div>

</body>
</html>