<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Chef" %>
<%@ page import="model.image" %>
<%@ page import="model.*" %>

<%
UsersData users=(UsersData)request.getSession().getAttribute("users");
if(users != null){
request.setAttribute("users",users);
}
%>
<%
    List<Cart> cartProduct = (List<Cart>) request.getSession().getAttribute("carts");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Appetizer - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<style>


.staff p {
  font-size: 14px;
  line-height: 1.4;
  height: 60px;
  overflow: hidden;
  text-overflow: ellipsis;
}

</style>
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
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/${image1}');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">About</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


		<section class="ftco-section ftco-wrap-about ftco-no-pb">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-sm-10 wrap-about ftco-animate text-center">
	          <div class="heading-section mb-4 text-center">
	          	<span class="subheading">About</span>
	            <h2 class="mb-4">Appetizer Restaurant</h2>
	          </div>
						<p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>

						<div class="video justify-content-center">
							<a href="https://vimeo.com/45830194" class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
  							<span class="ion-ios-play"></span>
	  					</a>
						</div>
					</div>
				</div>
			</div>
		</section>


		<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url('http://localhost:8080/untitled/images/${dataImage}');" data-stellar-background-ratio="0.5">
		<!-- <section class="ftco-section ftco-counter img ftco-no-pt" id="section-counter"> -->
    	<div class="container">
    		<div class="row d-md-flex align-items-center justify-content-center">
    			<div class="col-lg-10">
    				<div class="row d-md-flex align-items-center">
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="${experience}">0</strong>
		                <span>Years of Experienced</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="${customers}">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="${menus}">0</strong>
		                <span>Menus</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="${staffs}">0</strong>
		                <span>Staffs</span>
		              </div>
		            </div>
		          </div>
	          </div>
          </div>
        </div>
    	</div>
    </section>

		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Services</span>
            <h2 class="mb-4">Catering Services</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="flaticon-cake"></span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Birthday Party</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="flaticon-meeting"></span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Business Meetings</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="flaticon-tray"></span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Wedding Party</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>
          </div>
        </div>
			</div>
		</section>


		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Chef</span>
            <h2 class="mb-4">Our Master Chef</h2>
          </div>
        </div>
				 <div class="row">
				    <% List<Chef> chefs = (List<Chef>) request.getAttribute("chefs"); %>
                                         						 <% for (Chef chef : chefs) { %>
                        					<div class="col-md-6 col-lg-3 ftco-animate">
                        						<div class="staff">

                        							<div class="img" style="background-image: url('http://localhost:8080/untitled/images/<%= chef.getImage() %>');"></div>
                        							<div class="text pt-4">
                        								<h3><%= chef.getName() %></h3>
                        								<span class="position mb-2"><%= chef.getProfile() %></span>
                        								<p><%= chef.getDesc() %></p>
                        								<div class="faded">
                        									<!-- <p>I am an ambitious workaholic, but apart from that, pretty simple person.</p> -->
                        									<ul class="ftco-social d-flex">
                        		                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        		                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        		                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
                        		                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        		                <li class="ftco-animate"><a href="chefReadMore?id=<%= chef.getId()%>"><span style="font-size: 10px">Read more...</span></a></li>

                        		              </ul>
                        	              </div>
                        							</div>
                        						</div>
                        					</div>
                        					 <% } %>

                        				</div>

			</div>
		</section>

		<!-- <section class="ftco-section testimony-section" style="background-image: url(images/bg_5.jpg);" data-stellar-background-ratio="0.5"> -->
		<section class="ftco-section testimony-section img" style="background-image: url('http://localhost:8080/untitled/images/img_6.png');">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Testimony</span>
            <h2 class="mb-4">Happy Customer</h2>
          </div>
        </div>
        <div class="row ftco-animate justify-content-center">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap text-center pb-5">
                  <div class="user-img mb-4" style="background-image: url('http://localhost:8080/untitled/images/img_30.png')">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text p-3">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Jason McClean</p>
                    <span class="position">Customer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center pb-5">
                  <div class="user-img mb-4" style="background-image: url('http://localhost:8080/untitled/images/img_31.png')">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text p-3">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Mark Stevenson</p>
                    <span class="position">Customer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center pb-5">
                  <div class="user-img mb-4" style="background-image: url('http://localhost:8080/untitled/images/img_32.png')">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text p-3">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Art Leonard</p>
                    <span class="position">Customer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center pb-5">
                  <div class="user-img mb-4" style="background-image: url('http://localhost:8080/untitled/images/img_33.png')">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text p-3">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Rose Henderson</p>
                    <span class="position">Customer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center pb-5">
                  <div class="user-img mb-4" style="background-image: url('http://localhost:8080/untitled/images/img_32.png')">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text p-3">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Ian Boner</p>
                    <span class="position">Customer</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

		<section class="ftco-section ftco-no-pt ftco-no-pb">
                        <div class="container-fluid px-0">
                            <div class="row no-gutters">
                                <c:forEach var="img" items="${images}">
                                    <div class="col-md">
                                        <a href="#" class="instagram img d-flex align-items-center justify-content-center"
                                           style="background-image: url('http://localhost:8080/untitled/images/${img.image}');">
                                            <span class="ion-logo-instagram"></span>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>

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
              <form id="contactForm1" class="subscribe-form">
                                     <div class="form-group">
                                       <input type="email" name="email" id="number9" class="form-control mb-2 text-center" placeholder="Enter email address" required>
                                       <button type="button" onclick="submitPhone()" class="form-control submit px-3">Subscribe</button>
                                       <div id="statusMessagePhone" class="mt-2" style="font-size: 10px;"></div>
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
        <script>
                function submitPhone() {

                    const formData1 = $("#contactForm1").serialize(); // Prepare data to send
                    // AJAX request to send data to the servlet
                    $.ajax({
                        type: "POST",
                        url: "subscribe",  // Ensure this matches the servlet mapping
                        data: formData1,
                        success: function(response) {
                            if (response.status === "success") {
                                $("#statusMessagePhone").html("<div style='color: green;'>Message sent successfully!</div>");
                                $("#contactForm1")[0].reset(); // Reset the form on success
                            } else {
                                $("#statusMessagePhone").html("<div style='color: red;'>" + (response.message || "Error submitting message.") + "</div>");
                            }

                            clearMessageAfterTimeoutPhone();
                        },
                        error: function(xhr, status, error) {
                            console.error("AJAX error:", status, error); // Debugging: Log AJAX error
                            $("#statusMessagePhone").html("<div style='color: red;'>An error occurred.</div>");
                            clearMessageAfterTimeoutPhone();
                        }
                    });
                }

                function clearMessageAfterTimeoutPhone() {
                    setTimeout(function() {
                        $("#statusMessagePhone").html(""); // Clears the status message
                    }, 3000);
                }
            </script>

  </body>
</html>