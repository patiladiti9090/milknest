<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Report</title>

    <!-- Bootstrap ADD -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { font-family: Arial, sans-serif; background-color:#f8f9fa; }
        h2 { text-align: center; margin-top: 30px; }

        table { width: 90%; margin: 20px auto; }
        th { background-color: #198754; color: white; }

        img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
        }

        .pagination a {
            padding: 8px 16px;
            text-decoration: none;
            color: #198754;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #198754;
            color: white;
        }
    </style>
</head>

<body>

<%@include file="ReportsNavbar.jsp" %>

<h2>🧾 Product Report</h2>

<%
    int currentPage = 1;
    int recordsPerPage = 5;

    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        con = DataAccess.getConnection();
        int start = (currentPage - 1) * recordsPerPage;

        String query = "SELECT * FROM tb_productsmaster LIMIT ?, ?";
        stmt = con.prepareStatement(query);
        stmt.setInt(1, start);
        stmt.setInt(2, recordsPerPage);
        rs = stmt.executeQuery();
%>

<div class="container">
<table class="table table-bordered table-hover text-center align-middle">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Image</th>
        <th>Description</th>
        <th>Sale Price</th>
        <th>Purchase Price</th>
        <th>Category</th>
    </tr>

<%
    boolean hasData = false;

    while (rs.next()) {
        hasData = true;

        String img = rs.getString("productImage");

        // 👉 IMAGE FIX (if null show default milk image)
        if (img == null || img.equals("")) {
            img = "https://images.unsplash.com/photo-1563636619-e9143da7973b";
        }
%>

<tr>
    <td><%= rs.getInt("productID") %></td>
    <td><%= rs.getString("productname") %></td>

    <td>
        <img src="<%= img %>">
    </td>

    <td><%= rs.getString("productDescription") %></td>
    <td>₹ <%= rs.getDouble("productSaleprise") %></td>
    <td>₹ <%= rs.getDouble("productpurchaseprice") %></td>
    <td><%= rs.getInt("productCatID") %></td>
</tr>

<%
    }

    // 👉 NO DATA MESSAGE
    if (!hasData) {
%>
<tr>
    <td colspan="7" class="text-danger">No Products Found ❌</td>
</tr>
<%
    }
%>

</table>
</div>

<!-- PAGINATION -->
<div class="pagination text-center">
<%
    stmt = con.prepareStatement("SELECT COUNT(productID) FROM tb_productsmaster");
    rs = stmt.executeQuery();
    rs.next();

    int totalRecords = rs.getInt(1);
    int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

    for (int i = 1; i <= totalPages; i++) {
%>

<a href="?page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>">
    <%= i %>
</a>

<%
    }
%>
</div>

<%
    } catch (Exception e) {
        out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

</body>
</html>s