<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="com.milknest.milknest_online_services.category" %>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<%!
    ResultSet rs;
    category ic = new category();
    String CatName, CatImg;
%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <style>
        .common-widget {
            padding: 10px 3.125rem 0px 3.125rem !important;
        }
        .shop-by-category-container {
            margin-top: 20px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .shop-by-category-container {
            justify-content: center;
        }
        .shop-by-category-item {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            align-items: center;
            width: 150px;
            height: 160px;
            border-radius: 5px;
            box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.4);
            background-color: #fff;
            padding-top: 10px;
        }
        .shop-by-category-item img{
            height: 100px;
            width: 140px;
            object-fit: cover;
        }
        .heading{
            text-align: center;
            text-transform: uppercase;
        }
        .heading-span{
            font-size: 1rem;
            font-weight: 600;
            color: var(--second-color);
        }
        .heading-h1{
            font-size: 2rem;
            color: var(--main-color);
        }
        .categories {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .shop-by-category-link {
            text-decoration: none;
            flex: 1 1 calc(25% - 30px);
            max-width: 600px;
            min-width: 200px;
            display: flex;
            justify-content: center;
        }
        .shop-by-category-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 100%;
        }
        .shop-by-category-item img {
            width: 100%;
            max-width: 150px;
            height: auto;
            object-fit: cover;
        }
        .shop-by-category-header {
            font-size: 16px;
            color: #333;
            text-align: center;
            margin-top: 10px;
        }
        .container-fluid .text-primary {
            color: black !important;
        }
    </style>
</head>

<body>
    <%@include file="WEB-INF/Navbar.jsp" %>

    <section class="container mb-5">
        <div id="header-carousel" class="carousel slide" data-ride="carousel" data-interval="1000">
            <div class="carousel-inner">

                <!-- SAME CAROUSEL -->
                <div class="carousel-item active" style="height: 600px;">
                    <img class="img-fluid" src="https://file.milkbasket.com/banners/Milk+Shake+600+x+300_1693920471.jpeg?w=1400&dpr=1.3">
                </div>

                <div class="carousel-item" style="height: 600px;">
                    <img class="img-fluid" src="https://file.milkbasket.com/banners/IMG_8103-+Category+banner_1730995808.jpeg?w=1400&dpr=1.3">
                </div>

            </div>
        </div>
    </section>

    <!-- CATEGORY SECTION -->
    <section class="shop" id="shop">
        <div class="heading">
            <h2>ORDER NOW</h2>
            <h1>Milk and Milkproducts</h1>
        </div>

        <section class="container mb-5">
            <div class="categories d-flex flex-wrap justify-content-center">

                <%
                    rs = ic.getAllCategories();

                    if (rs != null) {
                        while (rs.next()) {

                            CatName = rs.getString("category_name");
                            CatImg = rs.getString("category_img");

                            // ✅ ONLY ADD THIS BLOCK (ONLINE IMAGE)
                            if (CatImg == null || CatImg.equals("")) {
                                if (CatName.equalsIgnoreCase("Cow Milk Products")) {
                                    CatImg = "https://5.imimg.com/data5/ANDROID/Default/2023/8/336879190/LM/MC/OI/139525445/product-jpeg-500x500.jpg";
                                } else if (CatName.equalsIgnoreCase("Buffalo Milk Products")) {
                                    CatImg = "https://cdn.pixabay.com/photo/2016/03/05/19/02/buffalo-1239243_1280.jpg";
                                } else if (CatName.equalsIgnoreCase("Snacks")) {
                                    CatImg = "https://cdn.pixabay.com/photo/2016/03/05/19/02/snack-1239244_1280.jpg";
                                } else if (CatName.equalsIgnoreCase("Dairy Products")) {
                                    CatImg = "https://cdn.pixabay.com/photo/2016/11/29/09/32/cheese-1869708_1280.jpg";
                                } else {
                                    CatImg = "https://cdn.pixabay.com/photo/2016/03/05/19/02/food-1239245_1280.jpg";
                                }
                            }
                %>

                <a href="ShopByCategories.jsp?catid=<%=rs.getInt(1)%>" class="shop-by-category-link">
                    <div class="shop-by-category-item">
                        <div>
                            <img src="<%=CatImg%>" alt="Category">
                        </div>
                        <div>
                            <span class="shop-by-category-header"><%=CatName%></span>
                        </div>
                    </div>
                </a>

                <%
                        }
                    }
                %>

            </div>
        </section>
    </section>

</body>
</html>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

<%@include file="WEB-INF/Footer.jsp" %>