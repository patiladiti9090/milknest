<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>MilkNest</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">

        <a class="navbar-brand" href="Home.jsp">MilkNest</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Home.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Shop.jsp">Shop</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp">About</a>
                </li>
            </ul>

            <!-- RIGHT SIDE -->
            <ul class="navbar-nav">

                <%
                    if (session.getAttribute("username") == null) {
                %>

                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Login</a>
                </li>

                <%
                    } else {
                %>

                <li class="nav-item">
                    <a class="nav-link" href="frmCart.jsp">
                        🛒 Cart
                    </a>
                </li>

                <li class="nav-item">
                    <span class="nav-link">
                        👤 <%=session.getAttribute("username")%>
                    </span>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Logout.jsp">Logout</a>
                </li>

                <%
                    }
                %>

            </ul>

        </div>
    </div>
</nav>

</body>
</html>