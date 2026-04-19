<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.milknest.milknest_online_services.category"%>
<%@page import="java.sql.ResultSet"%>

<%
    category C = new category();

    String cid = request.getParameter("catid");   // ✅ FIX

    int eid = 0;
    ResultSet rs2 = null;

    if (cid != null && !cid.equals("")) {        // ✅ FIX
        eid = Integer.parseInt(cid);
        rs2 = C.getCatsByid(eid);
    } else {
        out.println("Category ID Missing");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
</head>

<body>

<h2>Products</h2>

<div class="row">

<%
    if (rs2 != null) {
        while (rs2.next()) {

            int productid = rs2.getInt("productID");
            String productname = rs2.getString("productname");
            double price = rs2.getDouble("productSaleprise");
            String image = rs2.getString("productImage");
            String desc = rs2.getString("productDescription");
%>

    <div style="width:200px; border:1px solid #ccc; padding:10px; margin:10px;">
        <img src="<%=image%>" style="width:100%; height:120px;">
        <h4><%=productname%></h4>
        <p><%=desc%></p>
        <h5>₹ <%=price%></h5>

        <form action="CartServlet" method="post">
            <input type="hidden" name="productId" value="<%=productid%>">
            <input type="hidden" name="productName" value="<%=productname%>">
            <input type="hidden" name="price" value="<%=price%>">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

<%
        }
    }
%>

</div>

</body>
</html>