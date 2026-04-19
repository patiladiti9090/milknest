<%@page import="com.milknest.milknest_online_services.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.milknest.milknest_online_services.DataAccess"%>
<%@page import="com.milknest.milknest_online_services.category" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    ResultSet rs;
    Product P = new Product();
    int MaxId;
%>


<%!
    public int productID;
    public String productname;
    public String productImage;
    public String productDescription;
    public double productSaleprise;
    public double productpurchaseprice;
    public int productCatID;

%>


<%
    //Insert code 

    if (request.getParameter("btnSave") != null) {
        try {
            P.setProductID(Integer.parseInt(request.getParameter("productID")));
            P.setProductname(request.getParameter("productname"));
            P.setProductImage(request.getParameter("productImage"));
            P.setProductDescription(request.getParameter("productDescription"));
            P.setProductSaleprise(Double.parseDouble(request.getParameter("productSaleprise")));
            P.setProductpurchaseprice(Double.parseDouble(request.getParameter("productpurchaseprice")));

            P.insertProduct(P);

        } catch (Exception ex) {
            out.print(ex);
        }

    }

// Edit code 
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));

            ResultSet rs1 = P.getProductID(eid);
            MaxId = rs1.getInt(1);
            productname = rs1.getString(2);
            productImage = rs1.getString(3);
            productDescription = rs1.getString(4);
            productSaleprise = rs1.getDouble(5);
            productpurchaseprice = rs1.getDouble(6);
        } catch (Exception ex) {

            out.println(ex);
        }
    }

    //Update code 
    if (request.getParameter("btnUpdate") != null) {
        try {
            P.setProductCatID(Integer.parseInt(request.getParameter("productID")));
            P.setProductname(request.getParameter("productname"));
            P.setProductImage(request.getParameter("productImage"));
            P.setProductDescription(request.getParameter("productDescription"));
            P.setProductSaleprise(Double.parseDouble(request.getParameter("productSaleprise")));
            P.setProductpurchaseprice(Double.parseDouble(request.getParameter("productpurchaseprice")));
            P.UpdateDispProducts(P);

        } catch (Exception ex) {
            out.print(ex);
        }

    }

    if (request.getParameter("delete") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("delete"));
            P.deleteDispProducts(id);

        } catch (Exception ex) {
            out.print(ex);
        }

    }
%>

<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Milk Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="ReportsNavbar.jsp" %>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }
            .form-container {
                position: absolute;
                top: 50%;
                left: 55%;
                transform: translate(-50%, -50%);
                background-color: #ffffff;
                padding : 30px;
                border: 2px solid black;
                border-radius: 10px;
                width: 60%;
                max-width: 480px;
                height: 650px !important;
                margin-top: 30px;
            }
            .form-container h2 {
                color: #007bff;
            }
            .form-container button {
                width: 100%;
                display: block;
            }
            .sidebar {
                height: 100vh;
                width: 250px;
                background-color: #343a40;
                color: white;
                position: fixed;
            }
            .sidebar .nav-link {
                color: #adb5bd;
            }
            .sidebar .nav-link:hover {
                color: white;
            }
            .content {
                margin-left: 260px;
                padding: 20px;
            }
            .card {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .form-card {
                height: 450px;
                width: 400px;
            }


        </style>
    </head>

    <div class="form-container">
        <div class="form-card">
            <div class="card-header bg-primary text-white">
                <h4>Product Form</h4>
            </div>
            <div class="card-body">
                <form action="" method="post">
                    <div class="mb-3">
                        <label for="productID" class="form-label">Product ID</label>
                        <input type="text" class="form-control" id="productID" name="productID" value='<%=MaxId%>' placeholder="Enter Product ID">
                    </div>
                    <div class="mb-3">
                        <label for="productname" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productname" name="productname" value='<%=productname%>'placeholder="Enter Product Name">
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" class="form-control" id="productImage" name="productImage">
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Product Description</label>
                        <textarea class="form-control" id="productDescription" name="productDescription" value='<%=productDescription%>' placeholder="Enter Product Description"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productSaleprise" class="form-label">Product Sale Price</label>
                        <input type="text" class="form-control" id="productSaleprise" name="productSaleprise" value='<%=productSaleprise%>' placeholder="Enter Product Sale Price">
                    </div>
                    <div class="mb-3">
                        <label for="productpurchaseprice" class="form-label">Product Purchase Price</label>
                        <input type="text" class="form-control" id="productpurchaseprice" name="productpurchaseprice" value='<%=productpurchaseprice%>' placeholder="Enter Product Purchase Price">
                    </div>
                    <div class="d-flex justify-content-between">
                        <span><button type="submit" name="btnSave" class="btn btn-success">Save</button></span>
                        <!--                        <span><button type="submit" name="btnUpdate" class="btn btn-warning">Update</button></span>
                                                <span><button type="reset" name="btnCancel" class="btn btn-danger">Cancel</button></span>-->
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>
