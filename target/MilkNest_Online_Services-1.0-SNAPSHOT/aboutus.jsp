<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%@include file="WEB-INF/Navbar.jsp" %>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - MilkNest</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="styles.css">

        <style>
            body {
                font-family: 'Arial', sans-serif;
                line-height: 1.6;
                background-color: #f8f9fa;
            }

            header{
                width: 100%;
                top: 0;
                right: 0;
                z-index: 1000;
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: #fff;
                box-shadow: 0 4px 41px rgba(14, 55, 54, 0.14);
                padding: 15px 10%;
                transition: 0.2s;
            }
            .navbar{
                display: flex;
            }
            .navbar a{
                font-size: 1rem;
                padding: 11px 30px;
                color: var(--second-color);
                font-weight: 600;
                text-transform: uppercase;
            }

            .navbar a:hover {
                color:var(--main-color)
            }
            .about-us img {
                max-width: 100%;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .mission {
                background-color: #f1f1f1;
                padding: 30px 15px;
                border-top: 3px solid #007bff;
                border-bottom: 3px solid #007bff;
            }

            .why-choose-us h4 {
                color: #007bff;
                font-weight: bold;
            }

            .why-choose-us .icon img {
                width: 100px;
                margin-bottom: 15px;
            }

            footer {
                background-color: #007bff;
                color: white;
                padding: 15px;
                font-size: 0.9rem;
            }

        </style>

    </head>
    <body>

        

        <!-- About Us Section -->
        <section class="about-us py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h2>About Us</h2>
                        <p>
                            At MilkNest, we pride ourselves on providing the freshest and highest quality milk and dairy products. 
                            Our journey started with a simple mission: to deliver farm-fresh milk directly to your doorstep while 
                            supporting local farmers. With state-of-the-art facilities and sustainable practices, we ensure that 
                            every product meets the highest standards of purity and taste.
                        </p>
                        <p>
                            From fresh milk to delicious dairy products like cheese, butter, and yogurt, MilkNest is committed 
                            to enriching your lifestyle with healthy and nutritious options.
                        </p>
                    </div>
                    <div class="col-md-6">
                        <img src="https://thumbs.dreamstime.com/z/us-vector-website-landing-page-design-template-webpage-mobile-site-development-business-company-organizational-148979858.jpg" alt="Fresh Milk and Dairy Products" class="img-fluid rounded shadow">
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Mission Section -->
        <section class="mission bg-light py-5">
            <div class="container text-center">
                <h2 class="mb-4">Our Mission</h2>
                <p>
                    To deliver high-quality milk and dairy products while promoting sustainability, supporting local farmers, 
                    and ensuring the health and well-being of our customers.
                </p>
            </div>
        </section>

        <!-- Why Choose Us Section -->
        <section class="why-choose-us py-5">
            <div class="container">
                <h2 class="text-center mb-4">Why Choose MilkNest?</h2>
                <div class="row text-center">
                    <div class="col-md-4">
                        <!--                        <div class="icon mb-3">
                                                    <img src="https://via.placeholder.com/100" alt="Freshness Icon" class="img-fluid">
                                                </div>-->
                        <h4>Freshness Guaranteed</h4>
                        <p>Our products come directly from farms to your table, ensuring unmatched freshness.</p>
                    </div>
                    <div class="col-md-4">
                        <!--                        <div class="icon mb-3">
                                                    <img src="https://via.placeholder.com/100" alt="Quality Icon" class="img-fluid">
                                                </div>-->
                        <h4>Top-Notch Quality</h4>
                        <p>We maintain the highest standards to deliver products you can trust.</p>
                    </div>
                    <div class="col-md-4">
                        <!--                        <div class="icon mb-3">
                                                    <img src="https://via.placeholder.com/100" alt="Sustainability Icon" class="img-fluid">
                                                </div>-->
                        <h4>Eco-Friendly Practices</h4>
                        <p>We care about the planet and use sustainable practices in our operations.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->

        <%@include file="WEB-INF/Footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>


</html>



<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>