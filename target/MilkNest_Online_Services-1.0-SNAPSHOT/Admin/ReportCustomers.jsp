<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h2 { text-align: center; margin-top: 50px; }
        table { width: 80%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .pagination { margin-top: 20px; text-align: center; }
        .pagination a { padding: 8px 16px; text-decoration: none; color: #007bff; border: 1px solid #ddd; margin: 0 4px; }
        .pagination a.active { background-color: #007bff; color: white; }
    </style>
</head>
<body>
    <%@include file="ReportsNavbar.jsp" %>
    <h2>Customer Report</h2>
    <%
        int currentPage = 1;
        int recordsPerPage = 10 ;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DataAccess.getConnection();
            int start = (currentPage - 1) * recordsPerPage;

            String query = "SELECT CustomerID, CustomerName, CustomerAdress, CustomerContact, CustomerEmail, CustomerUsername FROM tb_customermaster LIMIT ?, ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, start);
            stmt.setInt(2, recordsPerPage);
            rs = stmt.executeQuery();
    %>
    
    <table>
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Username</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("CustomerID") %></td>
            <td><%= rs.getString("CustomerName") %></td>
            <td><%= rs.getString("CustomerAdress") %></td>
            <td><%= rs.getString("CustomerContact") %></td>
            <td><%= rs.getString("CustomerEmail") %></td>
            <td><%= rs.getString("CustomerUsername") %></td>
        </tr>
        <%
            }
        %>
    </table>
    
    <div class="pagination">
        <%
            stmt = con.prepareStatement("SELECT COUNT(CustomerID) FROM tb_customermaster");
            rs = stmt.executeQuery();
            rs.next();
            int totalRecords = rs.getInt(1);
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="?page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <%
            }
        %>
    </div>
    
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }
    %>
</body>
</html>
