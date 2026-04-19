<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MilkNest | Fresh Dairy</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f9;
        }

        /* NAVBAR */
        .navbar {
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* HERO */
        .hero {
            position: relative;
        }

        .hero img {
            height: 450px;
            object-fit: cover;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
        }

        .hero-overlay h1 {
            font-size: 3rem;
            font-weight: 600;
        }

        /* FEATURES */
        .feature-box {
            border-radius: 15px;
            transition: 0.3s;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .feature-box:hover {
            transform: translateY(-10px);
        }

        /* PRODUCTS */
        .product-card {
            border-radius: 15px;
            overflow: hidden;
            transition: 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card img {
            object-fit: cover;
        }

        /* BUTTON */
        .btn-custom {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            color: white;
        }

        .btn-custom:hover {
            opacity: 0.9;
        }

        /* FOOTER */
        footer {
            background: #212529;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success sticky-top">
    <div class="container">

        <a class="navbar-brand fw-bold" href="Admin/admin_login.jsp">🥛 MilkNest</a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="nav">

            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Shop.jsp">Shop</a></li>
                <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            </ul>

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
                    <a class="nav-link" href="frmCart.jsp">🛒 Cart</a>
                </li>
                <li class="nav-item">
                    <span class="nav-link">👤 <%=session.getAttribute("username")%></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="Logout.jsp">Logout</a>
                </li>
                <%
                    }
                %>
            </ul>

        </div>
    </div>
</nav>

<!-- HERO SECTION -->
<div class="hero">
    <img src="https://file.milkbasket.com/banners/NCR1+Push_1729774591.png?w=1400&dpr=1.3" class="w-100">

    <div class="hero-overlay text-center">
        <h1>Fresh Milk Delivered Daily 🥛</h1>
        <p>Organic • Healthy • Direct from Farm</p>
        <a href="Shop.jsp" class="btn btn-custom btn-lg mt-3">Shop Now</a>
    </div>
</div>

<!-- FEATURES -->
<div class="container mt-5">
    <div class="row text-center g-4">

        <div class="col-md-4">
            <div class="p-4 feature-box">
                <h4>🚚 Fast Delivery</h4>
                <p>Quick delivery at your doorstep</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="p-4 feature-box">
                <h4>🥛 Farm Fresh</h4>
                <p>Direct sourcing from farmers</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="p-4 feature-box">
                <h4>💳 Secure Payment</h4>
                <p>Safe & easy transactions</p>
            </div>
        </div>

    </div>
</div>

<!-- PRODUCTS -->
<div class="container mt-5">
    <h3 class="text-center mb-4 fw-bold">Popular Products</h3>

    <div class="row g-4">

        <div class="col-md-3">
            <div class="product-card">
                <img src="https://img.freepik.com/premium-photo/cow-milk-packaging-designgreenillustration-vector_1197797-61275.jpg" class="w-100" height="200">
                <div class="p-3 text-center">
                    <h5>Cow Milk 1L</h5>
                    <p class="fw-bold text-success">₹50</p>
                    <a href="#" class="btn btn-sm btn-custom">Add to Cart</a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="product-card">
                <img src="https://www.southernliving.com/thmb/JOV1II4ho49bEI50Drk4RDtDK1Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/How_To_Soften_Butter_013-2000-61e8b4e1ad9c431887472483ae714dbb.jpg" class="w-100" height="200">
                <div class="p-3 text-center">
                    <h5>Butter</h5>
                    <p class="fw-bold text-success">₹120</p>
                    <a href="#" class="btn btn-sm btn-custom">Add to Cart</a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="product-card">
                <img src="https://thumbs.dreamstime.com/b/assorted-cheese-blocks-displayed-market-stall-various-types-arranged-showcasing-variety-textures-colors-cheeses-390057044.jpg" class="w-100" height="200">
                <div class="p-3 text-center">
                    <h5>Cheese</h5>
                    <p class="fw-bold text-success">₹150</p>
                    <a href="#" class="btn btn-sm btn-custom">Add to Cart</a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="product-card">
                <img src="https://tiimg.tistatic.com/fp/1/007/952/pack-of-1-kilogram-white-cube-shape-pure-and-healthy-fresh-paneer-147.jpg" class="w-100" height="200">
                <div class="p-3 text-center">
                    <h5>Paneer</h5>
                    <p class="fw-bold text-success">₹200</p>
                    <a href="#" class="btn btn-sm btn-custom">Add to Cart</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer class="text-white text-center p-4 mt-5">
    <p class="mb-0">© 2026 MilkNest | Designed with ❤️</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>