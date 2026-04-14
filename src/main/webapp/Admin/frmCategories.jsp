<%@page import="java.sql.ResultSet"%>
<%@page import="com.milknest.milknest_online_services.category"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! category c = new category();%>

<%! ResultSet rs;
    int MaxId;
    String Catname = "";
    String CategoryImage1 = "";
%>
<%!
    String category_id;
    String category_name;
    String category_img;

%>
<%!    void getMaxID() {
        try {
            rs = c.getCategory_Id();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("Category ID");
        } catch (Exception ex) {
        }
    }

%>


<%
    getMaxID();

    if (request.getParameter("btnSave") != null) {
        try {
            c.setCategory_id(Integer.parseInt(request.getParameter("categoryId")));
            c.setCategory_name(request.getParameter("categoryName"));
            c.setCategory_img(request.getParameter("Category_img"));

            c.insertCategories(c);
        } catch (Exception ex) {
            out.print(ex);
        }

    }

    //edit
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));

            ResultSet rs1 = c.getCatsByid(eid);
            MaxId = rs1.getInt(1);
            Catname = rs1.getString(2);
            CategoryImage1 = rs1.getString(3);

        } catch (Exception ex) {

            out.println(ex);
        }
    }
    
    //update
    
    if (request.getParameter("btnUpdate") != null) {

        c.setCategory_id(Integer.parseInt(request.getParameter("categoryId")));
        c.setCategory_name(request.getParameter("categoryName"));
        c.setCategory_img(request.getParameter("CategoryImage"));
        c.updateCategoriess(c);

    }
    
    // delete
    
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            c.deleteCategories(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Milk Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>

            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }
            .form-container {
                position: absolute; /* or fixed for always staying in view */
                top: 40%;
                left: 55%;
                transform: translate(-50%, -50%); /* Centering */
                background-color: #ffffff;
                padding: 30px; /* Adjust padding for size */
                border: 2px solid black;
                border-radius: 10px;
                width: 60%; /* Adjust width for smaller size */
                max-width: 450px; /* Limit the maximum size */
            }
            .form-container h2 {
                color: #007bff;
            }

            .form-container button {
                width: 100%;
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
            .form-card{
                height: 350px;
                width: 400px;
            }

        </style>
<%@include file="ReportsNavbar.jsp" %>
    </head>
    <body>
        

            <div class="form-container">
                <div class="form-card">
                    <div class="card-header bg-primary text-white">
                        <h4>Category Form</h4>
                    </div>

                    <div class="card-body">
                        <form action="" method="post">
                            <div class="mb-3">
                                <label for="categoryId" class="form-label">Category ID</label>
                                <input type="text" class="form-control" id="categoryId" name="categoryId" value='<%=MaxId%>' placeholder="Enter Category ID">
                            </div>
                            <div class="mb-3">
                                <label for="categoryName" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="categoryName" name="categoryName" value='<%=Catname%>' placeholder="Enter Category Name">
                            </div>
                            <div class="mb-3">
                                <label for="categoryName" class="form-label">Category Image</label>
                                <input type="file" class="form-control" id="CategoryImage" name="CategoryImage" value='<%=CategoryImage1%>' placeholder="Enter Category Image">
                            </div>
                            <div class="d-flex justify-content-between">
                                <span><button type="submit" name="btnSave" class="btn btn-success btn-view-all btn mr-3">Save</button></span>
<!--                                <span><button type="submit" name="btnUpdate" class="btn btn-warning btn-view-all btn mr-3">Update</button></span>
                                <span><button type="reset" name="btnCancel" class="btn btn-danger btn-view-all">Cancel</button></span>-->

                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>