<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.*" %>
<%
UsersData users=(UsersData)request.getSession().getAttribute("users");
if(users != null){
request.setAttribute("users",users);
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Appetizer - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <style>

    .new-container {
        width: 100%;
        padding: 0 20px;
        margin: 0 auto;
    }

    .new-image-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: -110px;
    }

    .new-img {
        border-radius: 10px;
        max-height: 350px;
        object-fit: cover;
        width: 100%;
    }
    .gara{
    color: black;
    }
    .removeOffer{
    font-size: 10px;
    }

    .new-card-body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 20px; /* Add space between the image and content */
    }
    .notification {
        background-color: #dff0d8; /* Light green background */
        color: Black; /* Dark green text */
        border: 1px solid #d6e9c6; /* Light green border */
        border-radius: 5px; /* Rounded corners */
        padding: 15px; /* Padding around the text */
        margin: 20px 0; /* Space above and below */
        font-weight: bold; /* Bold text */
        display: flex; /* Flexbox for alignment */
        align-items: center; /* Center align items */
    }

    .notification p {
        margin: 0; /* Remove default margin */
        flex-grow: 1; /* Allow text to take available space */
    }


    /* Styling for Offer */
    .new-offer {
        color: blue;
        font-family: 'Courier New', Courier, monospace;
        font-size: 22px;
        font-weight: 700;
        letter-spacing: 1px;
    }

    /* Styling for Title */
    .new-title {
        color: black;
        font-family: 'Arial Black', Gadget, sans-serif;
        font-size: 1rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    /* Styling for Price */
    .new-price {
        color: #28a745;
        font-family: 'Georgia', serif;
        font-weight: 500;
        font-size: 1.5rem;
        margin-bottom: 1rem;
    }

    /* Styling for Description */
    .new-description {
        font-family: 'Tahoma', sans-serif;
        font-size: 1rem;
        color: #6c757d;
        margin-bottom: 1rem;
    }

    /* Styling for Category */
    .new-category {
        font-family: 'Verdana', sans-serif;
        font-size: 0.875rem;
        font-weight: 400;
        color: #343a40;
    }

    /* Responsive styles */

    /* On smaller devices, reduce text size and adjust layout */
    @media (max-width: 768px) {
        .new-container {
            padding: 0 15px;
        }

        .new-title {
            font-size: 1.5rem;
        }

        .new-price {
            font-size: 1.25rem;
        }

        .new-offer {
            font-size: 20px;
        }

        .new-description, .new-category {
            font-size: 0.875rem;
        }
    }

    /* On very small devices, stack image and data vertically */
    @media (max-width: 576px) {
        .new-img {
            max-height: 200px;
        }

        .new-image-wrapper {
            margin-left: 0; /* Reset left margin on small screens */
        }

        .new-offer {
            text-align: center;
        }

        .new-title,
        .new-price,
        .new-description,
        .new-category {
            text-align: center;
        }
        .notification p{
            font-size: 1rem;
        }

        .new-title {
            font-size: 1.25rem;
        }

        .new-price {
            font-size: 1.125rem;
        }

        .new-offer {
            font-size: 18px;
        }

        .new-description, .new-category {
            font-size: 0.75rem;
        }
    }
    </style>

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
    <div class="py-1 bg-black top">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ ${phone}</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">${email}</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						    <p class="mb-0 register-link"><span>Open hours:</span> <span>Monday - Sunday</span> <span>8:00AM - 9:00PM</span></p>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="welcome">Appetizer</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="welcome" class="nav-link">Home</a></li>
	        	<li class="nav-item active"><a href="about" class="nav-link">About</a></li>
	        	<li class="nav-item"><a href="menu" class="nav-link">Menu</a></li>
	          <li class="nav-item"><a href="contact1" class="nav-link">Contact</a></li>
	          <li class="nav-item cta"><a href="reserve" class="nav-link">Book a table</a></li>
	          <% if (users != null) { %>
                                <li class="nav-item">
                                    <a href="cart" class="nav-link">
                                        Cart
                                        <span class="badge badge-danger cart-count">
                                            <%= (cartProduct != null) ? cartProduct.stream().mapToInt(Cart::getQuantity).sum() : 0 %>
                                        </span>
                                    </a>
                                </li>

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
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/${image1}');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Item</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Read more <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


    <div class="new-container my-4">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="new-image-wrapper">
                    <img src="<c:out value='${image}'/>" class="new-img img-fluid" alt="<c:out value='${name}'/>">
                </div>
            </div>

            <div class="col-md-6">
                <div class="new-card-body">
                <div class="notification">
                    <p>You save &#8377;<c:out value="${discountAmount}"/> on your Total bill</p>
                </div>
                    <h5 class="new-title"><c:out value="${name}"/></h5>
                    <p class="new-price">
                        &#8377;<c:out value="${discountedPrice}"/>
                    </p>
                    <p class="new-offer"> You have added <c:out value="${amount}"/> items </p>
                    <p class="new-description"><c:out value="${descr}"/></p>
                    <p class="new-category text-muted">(<c:out value="${category}"/>)</p>

                    <a href="readMore?id=<c:out value="${id}"/>" class="removeOffer">Remove Offer</a>

                </div>
            </div>
        </div>
    </div>


    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container-fluid px-md-5 px-3">
        <div class="row mb-5">
          <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Appetizer</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Open Hours</h2>
              <ul class="list-unstyled open-hours">
                <li class="d-flex"><span>Monday</span><span>9:00 - 24:00</span></li>
                <li class="d-flex"><span>Tuesday</span><span>9:00 - 24:00</span></li>
                <li class="d-flex"><span>Wednesday</span><span>9:00 - 24:00</span></li>
                <li class="d-flex"><span>Thursday</span><span>9:00 - 24:00</span></li>
                <li class="d-flex"><span>Friday</span><span>9:00 - 02:00</span></li>
                <li class="d-flex"><span>Saturday</span><span>9:00 - 02:00</span></li>
                <li class="d-flex"><span>Sunday</span><span> 9:00 - 02:00</span></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Newsletter</h2>
            	<p>Far far away, behind the word mountains, far from the countries.</p>
              <form action="" class="subscribe-form">
                <div class="form-group">
                  <input type="text" class="form-control mb-2 text-center" placeholder="Enter email address">
                  <a href="welcome"  class="form-control submit px-3 text-center">Subscribe</a>
                </div>
              </form>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Instagram</h2>
              <div class="thumb d-sm-flex">
                  <c:forEach var="img" items="${images}" begin="0" end="2">
                     <a href="#" class="thumb-menu img" style="background-image: url('http://localhost:8080/untitled/images/${img.image}');">
                     </a>
                  </c:forEach>
              </div>
               <div class="thumb d-flex">
                    <c:forEach var="img" items="${images}" begin="3" end="5">
                       <a href="#" class="thumb-menu img" style="background-image: url('http://localhost:8080/untitled/images/${img.image}');">
                       </a>
                    </c:forEach>
               </div>
          </div>
        </div>
      </div>
      <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<script src="http://localhost:8080/untitled/js/jquery.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="http://localhost:8080/untitled/js/popper.min.js"></script>
  <script src="http://localhost:8080/untitled/js/bootstrap.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.easing.1.3.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.waypoints.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.stellar.min.js"></script>
  <script src="http://localhost:8080/untitled/js/owl.carousel.min.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.magnific-popup.min.js"></script>
  <script src="http://localhost:8080/untitled/js/aos.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.animateNumber.min.js"></script>
  <script src="http://localhost:8080/untitled/js/bootstrap-datepicker.js"></script>
  <script src="http://localhost:8080/untitled/js/jquery.timepicker.min.js"></script>
  <script src="http://localhost:8080/untitled/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="http://localhost:8080/untitled/js/google-map.js"></script>
  <script src="http://localhost:8080/untitled/js/main.js"></script>


  </body>
</html>