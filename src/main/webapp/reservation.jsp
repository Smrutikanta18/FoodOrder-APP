<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.image" %>
<%@ page import="java.util.*" %>
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
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/${image1}');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Reservation</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container-fluid px-0">
				<div class="row d-flex no-gutters">
          <div class="col-md-6 order-md-last ftco-animate makereservation p-4 p-md-5 pt-5">
          	<div class="py-md-5">
	          	<div class="heading-section ftco-animate mb-5">
		          	<span class="subheading">Book a table</span>
		            <h2 class="mb-4">Make Reservation</h2>
		          </div>
	            <form id="contactForms">
	              <div class="row">
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Name</label>
	                    <input type="text" id="name" name="name" class="form-control" placeholder="Your Name">
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Email</label>
	                    <input type="text" id="email" name="email" class="form-control" placeholder="Your Email">
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Phone</label>
	                    <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone">
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Date</label>
	                    <input type="date" id="date" name="date" class="form-control" placeholder="Date">
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Time</label>
	                    <input type="text" id="time" name="time" class="form-control"  placeholder="Time">
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label for="">Person</label>
	                    <div class="select-wrap one-third">
	                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                      <select type="text" id="persons" name="persons" class="form-control">
	                        <option value="">Person</option>
	                        <option value="1">1</option>
	                        <option value="2">2</option>
	                        <option value="3">3</option>
	                        <option value="4">4+</option>
	                      </select>
	                    </div>
	                  </div>
	                </div>
	                <div id="statusMessage" style="margin-top: 15px; margin-left: 50px"></div>
	                <div class="col-md-12 mt-3">
	                  <div class="form-group">
	                    <button type="button" onclick="submitForm()" value="" class="btn btn-primary py-3 px-5">Make a Reservation</button>
	                  </div>
	                </div>
	              </div>
	            </form>
	          </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0">
						<div id="map"></div>
					</div>
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
         <script>
             function submitForm() {
                 console.log("Hello");

                 // Collect form values
                 const name = document.getElementById("name").value;
                 const email = document.getElementById("email").value;
                 const date = document.getElementById("date").value;
                 const time = document.getElementById("time").value;
                 const phone = document.getElementById("phone").value;
                 const persons = document.getElementById("persons").value;

                 // Prepare form data
                 const formData = new URLSearchParams();
                 formData.append("name", name);
                 formData.append("email", email);
                 formData.append("date", date);
                 formData.append("time", time);
                 formData.append("phone", phone);
                 formData.append("persons", persons);

                 // Send data to the server
                 fetch("book", {
                     method: "POST",
                     headers: {
                         "Content-Type": "application/x-www-form-urlencoded"
                     },
                     body: formData.toString()
                 })
                 .then(response => response.json())
                 .then(data => {
                     // Define status message element
                     const statusMessage = document.getElementById("statusMessage");

                     // Check for success or error in the server response
                     if (data.status === "success") {
                         statusMessage.textContent = data.message;
                         statusMessage.style.color = "green";
                     } else {
                         statusMessage.textContent = data.message;
                         statusMessage.style.color = "red";
                     }

                     // Show the message and then hide it after 3 seconds
                     statusMessage.style.display = "block";
                     setTimeout(() => {
                         statusMessage.style.display = "none";
                     }, 3000);
                 })
                 .catch(error => {
                     console.error("Error:", error);

                     // Display error message for network issues or unexpected errors
                     const statusMessage = document.getElementById("statusMessage");
                     statusMessage.textContent = "An error occurred. Please try again.";
                     statusMessage.style.color = "red";
                     statusMessage.style.display = "block";
                     setTimeout(() => {
                         statusMessage.style.display = "none";
                     }, 3000);
                 });
             }
         </script>
  </body>
</html>