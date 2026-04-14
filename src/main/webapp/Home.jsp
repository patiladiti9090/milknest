<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>MilkNest</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .hero-text {
            font-weight: bold;
        }

        .feature-box {
            transition: 0.3s;
        }

        .feature-box:hover {
            transform: scale(1.05);
        }

        .product-card:hover {
            transform: scale(1.03);
            transition: 0.3s;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">

        <a class="navbar-brand" href="Admin/admin_login.jsp">MilkNest</a>

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
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
            </ul>

            <ul class="navbar-nav">
                <%
                    if (session.getAttribute("username") == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Customer Login</a>
                </li>
                <%
                    } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="frmCart.jsp">🛒 Cart</a>
                </li>
                <li class="nav-item">
                    <span class="nav-link">👤 <%=session.getAttribute("username")%></span>
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

<!-- 🔥 CAROUSEL -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="https://file.milkbasket.com/banners/NCR1+Push_1729774591.png?w=1400&dpr=1.3" class="d-block w-100" height="450">
        </div>

        <div class="carousel-item">
            <img src="https://file.milkbasket.com/banners/600x300_1709297272.jpeg?w=1400&dpr=1.3" class="d-block w-100" height="450">
        </div>

        <div class="carousel-item">
            <img src="https://file.milkbasket.com/banners/Sofit+Banner+Fit+IS+FAB+600+x+300+Pixel_1680679462.jpeg?w=1400&dpr=1.3" class="d-block w-100" height="450">
        </div>

    </div>
</div>

<!-- HERO TEXT -->
<div class="container text-center mt-4">
    <h1 class="hero-text">Fresh Milk Delivered Daily 🥛</h1>
    <p>Healthy • Organic • Farm Fresh</p>
    <a href="Shop.jsp" class="btn btn-success btn-lg">Shop Now</a>
</div>

<!-- FEATURES -->
<div class="container mt-5">
    <div class="row text-center">

        <div class="col-md-4">
            <div class="card p-3 feature-box">
                <h4>🚚 Fast Delivery</h4>
                <p>Get milk delivered within hours</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3 feature-box">
                <h4>🥛 Fresh Products</h4>
                <p>Direct from farm to home</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3 feature-box">
                <h4>💳 Easy Payment</h4>
                <p>Secure online payment system</p>
            </div>
        </div>

    </div>
</div>

<!-- POPULAR PRODUCTS -->
<div class="container mt-5">
    <h3 class="text-center mb-4">Popular Products</h3>

    <div class="row">

        <div class="col-md-3">
            <div class="card product-card">
                <img src="https://img.freepik.com/premium-photo/cow-milk-packaging-designgreenillustration-vector_1197797-61275.jpg" class="card-img-top" height="200">
                <div class="card-body text-center">
                    <h5>Cow Milk 1L</h5>
                    <p>₹50</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card product-card">
                <img src="https://www.southernliving.com/thmb/JOV1II4ho49bEI50Drk4RDtDK1Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/How_To_Soften_Butter_013-2000-61e8b4e1ad9c431887472483ae714dbb.jpg" class="card-img-top" height="200">
                <div class="card-body text-center">
                    <h5>Butter</h5>
                    <p>₹120</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card product-card">
                <img src="https://thumbs.dreamstime.com/b/assorted-cheese-blocks-displayed-market-stall-various-types-arranged-showcasing-variety-textures-colors-cheeses-390057044.jpg" class="card-img-top" height="200">
                <div class="card-body text-center">
                    <h5>Cheese</h5>
                    <p>₹150</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card product-card">
                <img src="https://tiimg.tistatic.com/fp/1/007/952/pack-of-1-kilogram-white-cube-shape-pure-and-healthy-fresh-paneer-147.jpg" class="card-img-top" height="200">
                <div class="card-body text-center">
                    <h5>Paneer</h5>
                    <p>₹200</p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center p-3 mt-5">
    <p>© 2026 MilkNest | Fresh Dairy Products</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>