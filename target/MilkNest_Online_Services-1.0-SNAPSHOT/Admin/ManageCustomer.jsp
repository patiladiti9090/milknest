<%-- 
    Document   : ManageCustomer
    Created on : 14 Jan 2025, 3:15:30 pm
    Author     : Santosh
--%>

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
   public int CustomerID;
    public String CustomerName;
    public String CustomerAdress;
    public String CustomerContact;
    public String CustomerEmail;
    public String CustomerUsername;
    public String CustomerPassword;

%>
<%!    void getMaxID() {
        try {
            rs = c.getCategory_Id();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("CustomerID");
        } catch (Exception ex) {
        }
    }

%>


<%
    getMaxID();

    if (request.getParameter("btnSave") != null) {
        try {
            c.setCategory_id(Integer.parseInt(request.getParameter("CustomerID")));
            c.setCategory_name(request.getParameter("CustomerName"));
            c.setCategory_img(request.getParameter("CustomerAdress"));

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

            /*            Table css*/
            table {
                background: #fafafa;
                border-radius: 0.25em;
                border-collapse: collapse;
                margin: 1em;
                margin-left: 300px;
                margin-top: 500px;
                width: 50%;
                border: 1px solid #000;
            }
            th {
                border-bottom: 1px solid #364043;
                color: #E2B842;
                font-size: 0.85em;
                font-weight: 600;
                padding: 0.5em 1em;
                text-align: left;
            }
            td {
                color: #444;
                ;
                font-weight: 400;
                padding: 0.65em 1em;
            }
            tbody tr {
                transition: background 0.25s ease;
            }
            tbody tr:hover {
                background: #d1ecf1;
            }

        </style>

    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar d-flex flex-column p-3">
            <h1 class="text-center py-3">MilkNest</h1>
            <nav class="nav flex-column">
                <a href="admin.jsp" class="nav-link">Dashboard</a>
                <a href="frmCategories.jsp" class="nav-link">Categories</a>
                <a href="frmProduct.jsp" class="nav-link">Manage Products</a>
                <a href="Customer.jsp" class="nav-link">Manage Customer</a>
                <a href="User.jsp" class="nav-link">Manage Registration</a>
                <a href="#" class="nav-link">Reports</a>
                <a href="../Home.jsp" class="nav-link">LogOut</a>

            </nav>
        </div>
        <a href="../Home.jsp"></a>
        <!-- Main Content -->
        <div class="content">
            <h1 class="mb-4">Admin Dashboard</h1>
        </div>

        <!--                   //Table start-->   

        <table>
            <thead>
                <tr>
                    <th>CustomerID</th>
                    <th>CustomerName</th>
                    <th>CustomerAdress</th>
                    <th>CustomerContact</th>
                    <th>CustomerEmail</th>
                    <th>CustomerUsername</th>
                    <th>CustomerPassword</th>
<!--                    <th>Control</th>
                    <th>Control</th>-->
                </tr>
            </thead>
            <tbody>
                <%  int count = 1;
                    rs = c.getAllCategories();
                    do {


                %>

                <tr>
                    <td><%=count%></td>
                    <td><%=rs.getString(2)%></td>

                </tr>
                <%
                        count++;
                    } while (rs.next());


                %>
            </tbody>
        </table>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>