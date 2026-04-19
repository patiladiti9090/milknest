<%-- 
    Document   : contact
    Created on : 23 Dec 2024, 2:07:33 pm
    Author     : Santosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 
 <%@include file="WEB-INF/Navbar.jsp" %>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

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
        <title>Contact Us - MilkNest</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

        <!-- link to custom js -->
        <script src="main.js"></script>

        <!-- Contact Section -->
        <section class="contact-section py-5">
            <div class="container">
                <div class="row">
                    <!-- Contact Information -->
                    <div class="col-md-6">
                        <h2>Get in Touch</h2>
                        <p>
                            Have questions about our products or services? Feel free to reach out, and our team will get back to you as soon as possible.
                        </p>
                        <ul class="list-unstyled">
                            <li><strong>Phone:</strong> <a href="tel:+18001234567">+91 7028668996</a></li>
                            <li><strong>Email:</strong> <a href="mailto:support@milknest.com">milknest@gmail.com</a></li>
                            <li><strong>Address:</strong> Near Hanuman Temple,Kalasgon Vishrantwadi pune-15</li>
                        </ul>
                        <h3>Follow Us</h3>
                        <div>
                            <a href="#" class="text-primary me-3"><i class="fab fa-facebook fa-2x"></i></a>
                            <a href="#" class="text-primary me-3"><i class="fab fa-twitter fa-2x"></i></a>
                            <a href="#" class="text-primary"><i class="fab fa-instagram fa-2x"></i></a>
                        </div>
                    </div>

<!--                     Contact Form 
                    <div class="col-md-6">
                        <h2>Contact Form</h2>
                        <form action="#" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Your Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Your message" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>-->
                    </div>
                </div>
            </div>
        </section>
        <style>

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                scroll-padding-top: 2rem;
                text-decoration: none;
                list-style: none;
                scroll-behavior: smooth;
                font-family: "Poppins",sans-serif;
            }
            .root{
                --main-color:#008148;
                --second-color:#1e3932;
            }
            section{
                padding: 50px 10%;
            }
            *::selection{
                color: #fff;
                background-color:cornflowerblue;
            }
            img{
                width: 100%;
            }
            .logo{
                /* width:100px; */
                display: flex;
                align-items: center;
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
        </style>

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