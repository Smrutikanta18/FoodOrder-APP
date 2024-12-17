<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    UsersData users=(UsersData)request.getSession().getAttribute("users");
    if(users != null){
    request.setAttribute("users",users);
    }
    %>

<!DOCTYPE html>
<html>
<head>
    <title>your reservation</title>

    <style>
            .reservation-container {
                padding: 20px;
            }

            .reservation-card {
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
                transition: transform 0.2s ease;
            }

            .reservation-card:hover {
                transform: translateY(-5px);
            }

            .reservation-header {
                font-size: 1.5rem;
                font-weight: bold;
                color: #343a40;
            }

            .reservation-details {
                margin-top: 10px;
                font-size: 1rem;
                color: #6c757d;
            }

            .reservation-details span {
                font-weight: 600;
                color: #343a40;
            }

            .reservation-btn {
                background-color: light;
                color: white;
                border-radius: 5px;
                padding: 10px 20px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .reservation-btn:hover {
                background-color: #0056b3;
            }

            /* Mobile responsiveness */
            @media (max-width: 768px) {
                .reservation-card {
                    padding: 15px;
                }

                .reservation-header {
                    font-size: 1.3rem;
                }

                .reservation-details {
                    font-size: 0.9rem;
                }

                .reservation-btn {
                    padding: 8px 16px;
                }
            }
        </style>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">

    <link href="http://localhost:8080/untitled/css/animate.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/aos.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/flaticon.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/icomoon.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/ionicon.min.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/jquery.timepicker.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/magnific-popup.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/open-iconic-bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/owl.theme.default.min.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/untitled/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
             <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        	    <div class="container">
        	      <a class="navbar-brand" href="welcome">Appetizer</a>
        	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        	        <span class="oi oi-menu"></span> Menu
        	      </button>

        	      <div class="collapse navbar-collapse" id="ftco-nav">
        	        <ul class="navbar-nav ml-auto">
        	        	<li class="nav-item"><a href="welcome" class="nav-link">Home</a></li>
        	        	<li class="nav-item"><a href="about" class="nav-link">About</a></li>
        	        	<li class="nav-item"><a href="menu" class="nav-link">Menu</a></li>
        	          <li class="nav-item"><a href="contact1" class="nav-link">Contact</a></li>
        	          <li class="nav-item cta"><a href="reserve" class="nav-link">Book a table</a></li>
        	          <li class="nav-item">
                          <a href="cart" class="nav-link">
                              Cart
                              <span class="badge bg-primary" id="cart-count">0</span> <!-- Default 0, updated via AJAX -->
                          </a>
                      </li>

        	             <% if (users != null) { %>


                                          <li class="nav-item"><a href="orders" class="nav-link">Orders</a></li>
                                          <li class="nav-item"><a href="userReservation" class="nav-link">Reservation</a></li>
                                          <li class="nav-item"><a href="userProfile?id=<%= users.getId()%>" class="nav-link">Profile</a></li>
                                          <li class="nav-item"><a href="userLogout" class="nav-link">Logout</a></li>
                                      <% } else { %>
                                          <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                                      <% } %>
        	        </ul>
        	      </div>
        	    </div>
        	 </nav>
        <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/black.avif');" data-stellar-background-ratio="0.5">
              <div class="overlay"></div>
              <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                  <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-2 bread">Your Reservation</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i class="ion-ios-arrow-forward"></i></span></p>
                  </div>
                </div>
              </div>
        </section>

    <div class="container reservation-container">
        <h2 class="text-center mb-5">Your Reservations</h2>

        <c:forEach var="reservation" items="${reservation}">
            <div class="reservation-card">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <h3 class="reservation-header">${reservation.name}</h3>
                        <p class="reservation-details">
                            <span>Date:</span> ${reservation.book_date}<br>
                            <span>Time:</span> ${reservation.book_time}<br>
                            <span>Persons:</span> ${reservation.persons}<br>
                        </p>
                    </div>
                    <div class="col-12 col-md-6 d-flex align-items-center justify-content-md-end">
                        <c:choose>
                            <c:when test="${reservation.status == 'success'}">
                                <span class="text-success" style="color:green; font-weight: bold">Completed</span>
                            </c:when>
                            <c:when test="${reservation.status == 'cancel'}">
                                <span class="text-danger" style="color:red; font-weight: bold">Canceled</span>
                            </c:when>
                            <c:otherwise>
                                <a href="cancel-reservation?id=${reservation.id}" class="reservation-btn" style="background-Color: red">Cancel</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

<script src="http://localhost:8080/untitled/js/aos.js"></script>
<script src="http://localhost:8080/untitled/js/jquery.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="http://localhost:8080/untitled/js/popper.min.js"></script>
  <script src="http://localhost:8080/untitled/js/bootstrap.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.easing.1.3.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.waypoints.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.stellar.min.js"></script>
  <script src="http://localhost:8080/untitled/js/owl.carousel.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.magnific-popup.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.animateNumber.min.js"></script>
  <script src="http://localhost:8080/untitled/js/bootstrap-datepicker.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.timepicker.min.js"></script>
  <script src="http://localhost:8080/untitled/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="http://localhost:8080/untitled/js/google-map.js"></script>
  <script src="http://localhost:8080/untitled/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            // Function to fetch cart item count via AJAX and update the navbar
            function updateCartItemCount() {
                $.ajax({
                    url: 'cart-count', // Servlet URL
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        // Update the cart item count in the navbar
                        $('#cart-count').text(response.itemCount);
                    },
                    error: function(xhr, status, error) {
                        console.log('Error fetching cart item count:', error);
                    }
                });
            }

            // Call the function when the page loads to initialize cart count
            $(document).ready(function() {
                updateCartItemCount();
            });

            // You can also call updateCartItemCount() after adding an item to the cart
            // Example of adding item to cart via AJAX
            function addToCart(itemId) {
                $.ajax({
                    url: 'add-to-cart', // Your existing AddToCart servlet URL
                    type: 'GET',
                    data: { id: itemId },
                    success: function(response) {
                        // On success, update the cart item count
                        updateCartItemCount();
                    },
                    error: function(xhr, status, error) {
                        console.log('Error adding item to cart:', error);
                    }
                });
            }
        </script>
</body>
</html>
