<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.image" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    List<Cart> cartProduct = (List<Cart>) request.getSession().getAttribute("carts");
    Double totalAmount = (Double) session.getAttribute("totalAmount");
    Double totalDiscount = (Double) session.getAttribute("totalDiscount");
    Double totalPrice = (Double) session.getAttribute("totalPrice");
    %>

<%
UsersData users=(UsersData)request.getSession().getAttribute("users");
if(users != null){
request.setAttribute("users",users);
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Appetizer - Free Bootstrap 4 Template by Color lib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <style>
     /* General Container Styles */
     .cart-page-container {
         display: flex;
         justify-content: space-between;
         gap: 20px;
         padding: 20px;
         background-color: #f8f9fa;
     }

     /* Cart Items Section */
     .cart-items-container {
         flex: 1;
         background-color: #fff;
         border-radius: 8px;
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
         padding: 20px;
     }

     /* Cart Items Scrollable */
     .custom-scrollable {
         max-height: 400px;
         overflow-y: auto;
         padding-right: 10px;
     }

     .cart-item {
         display: flex;
         align-items: center;
         justify-content: space-between;
         margin-bottom: 20px;
         border-bottom: 1px solid #dee2e6;
         padding-bottom: 10px;
     }

     .cart-item:last-child {
         border-bottom: none;
     }

     .product-image-quantity {
         display: flex;
         align-items: center;
         gap: 20px;
     }

     /* Image Styles */
     .custom-cart-image {
         width: 80px;
         height: 80px;
         object-fit: cover;
         border-radius: 8px;
     }

     /* Quantity Control */
     .quantity-control {
         display: flex;
         align-items: center;
         gap: 5px;
     }

     .custom-quantity-input {
         width: 40px;
         text-align: center;
         font-size: 1em;
         padding: 5px;
         border: 1px solid #ced4da;
         border-radius: 4px;
     }

     .btn-decre, .btn-incre {
         font-size: 1.2em;
         color: #007bff;
         cursor: pointer;
     }

     .btn-decre:hover, .btn-incre:hover {
         color: #0056b3;
     }

     /* Cart Item Box */
     .cart-item-box {
         display: flex;
         gap: 15px;
     }

     .cart-details {
         display: flex;
         flex-direction: column;
         gap: 10px;
     }

     .product-name {
         font-size: 1.1em;
         font-weight: bold;
     }

     .quantity-value {
         font-weight: bold;
     }

     .offer-message {
         color: #28a745;
         font-size: 0.9em;
     }
     /* Set a fixed size for the image */
     .fixed-size-image {
         width: 100px; /* You can adjust the width */
         height: 100px; /* You can adjust the height */
         object-fit: cover; /* Ensures the image doesn't stretch */
         margin-bottom: 10px; /* Adds space below the image */
     }

     /* Center the quantity control buttons below the image */
     .quantity-control {
         display: flex;
         justify-content: center;
         align-items: center;
         margin-top: 5px; /* Adds space between image and buttons */
     }

     .quantity-btn-group {
         display: flex;
         align-items: center;
     }

     .custom-quantity-input {
         width: 40px; /* Adjust the width for the input box */
         text-align: center;
         margin: 0 5px; /* Space between buttons and input */
     }

     .btn-decre, .btn-incre {
         font-size: 1.5rem;
         cursor: pointer;
     }

     /* Styles for cart details */
     .cart-details {
         margin-left: 20px;
     }

     .cart-item {
         display: flex;
         justify-content: space-between;
         align-items: center;
         margin-bottom: 20px;
     }

     .product-actions {
         margin-left: auto; /* Align the Remove button to the far right */
     }


     .product-price {
         font-size: 1.1em;
         color: #495057;
     }

     /* Remove Button */
     .custom-remove-btn {
         background-color: #dc3545;
         color: #fff;
         padding: 8px 12px;
         border-radius: 4px;
         font-size: 0.9em;
         text-decoration: none;
     }

     .custom-remove-btn:hover {
         background-color: #c82333;
     }

     /* Total Price Section */
     .custom-total-price-container {
         display: flex;
         justify-content: flex-end;
         margin-top: 20px;
     }

     .custom-checkout-btn {
         background-color: #007bff;
         color: #fff;
         padding: 12px 24px;
         border-radius: 4px;
         font-size: 1.1em;
     }

     .custom-checkout-btn:hover {
         background-color: #0056b3;
     }

     /* Price Details Section */
     .price-details-container {
         width: 350px;
         height: 350px;
         background-color: #fff;
         border-radius: 8px;
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
         padding: 20px;
     }

     .price-details-container h3 {
         font-size: 1.3em;
         font-weight: bold;
         margin-bottom: 15px;
     }

     .price-details {
         display: flex;
         flex-direction: column;
         gap: 10px;
     }

     .price-item {
         display: flex;
         justify-content: space-between;
         font-size: 1em;
     }

     .price-item.total-amount {
         font-weight: bold;
         font-size: 1.2em;
     }

     .savings-message {
         color: #28a745;
         font-size: 0.9em;
         margin-top: 15px;
     }

     /* Responsive Styles */
     @media (max-width: 768px) {
         .cart-page-container {
             flex-direction: column;
         }

         .price-details-container {
             width: 100%;
             margin-top: 20px;
         }

         .custom-scrollable {
             max-height: none;
         }

         .cart-item {
             flex-direction: column;
             align-items: flex-start;
         }

         .product-image-quantity {
             flex-direction: column;
             gap: 10px;
         }

         .cart-item-box {
             flex-direction: column;
         }
     }
</style>
<style>
/* Modal background */
.modal.fade {
  background: rgba(0, 0, 0, 0.6); /* Adds a dark overlay behind the modal */
}

/* Modal content */
.modal-dialog {
  max-width: 400px; /* Adjust modal width for better mobile responsiveness */
  margin: 1.75rem auto;
}

.modal-content {
  border-radius: 15px; /* Rounded corners */
  border: none; /* Remove default border */
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Add shadow for depth */
  background-color: #f9f9f9; /* Soft background color */
}

/* Modal header */
.modal-header {
  background-color: #007bff; /* Custom header background color */
  color: white; /* Text color for title */
  border-bottom: none; /* Remove the default bottom border */
  padding: 1rem 1.5rem; /* Adjust padding */
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
}

.modal-title {
  font-size: 1.5rem; /* Increase font size */
  font-weight: bold;
}

/* Close button styling */
.modal-header .close {
  font-size: 1.25rem;
  color: #fff; /* White close button */
  opacity: 1; /* Make it fully opaque */
}

/* Modal body */
.modal-body {
  padding: 1.5rem; /* Increase padding */
  font-size: 1rem;
  line-height: 1.6;
  color: #555; /* Softer text color */
}

/* Modal footer */
.modal-footer {
  border-top: none; /* Remove top border */
  padding: 1rem 1.5rem;
  display: flex;
  justify-content: space-between;
}

.modal-footer .btn {
  padding: 0.5rem 1.5rem;
  border-radius: 25px; /* Rounded buttons */
  font-size: 1rem;
}

/* Button custom styles */
.modal-footer .btn-secondary {
  background-color: #6c757d;
  color: white;
}

.modal-footer .btn-danger {
  background-color: #dc3545;
  color: white;
  box-shadow: 0 4px 6px rgba(220, 53, 69, 0.3);
}

.modal-footer .btn-danger:hover {
  background-color: #c82333; /* Darken on hover */
}

.modal-footer .btn-secondary:hover {
  background-color: #5a6268; /* Darken on hover */
}

/* Mobile adjustments */
@media (max-width: 768px) {
  .modal-dialog {
    max-width: 95%; /* Make modal take up more width on small screens */
    margin: 1rem auto;
  }

  .modal-header, .modal-footer {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .modal-footer .btn {
    width: 100%; /* Full-width buttons on mobile */
    margin-top: 0.5rem;
  }

  .modal-footer {
    padding-bottom: 1.5rem; /* Add extra padding on the bottom */
  }
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet" type="text/css">

  </head>

  <body>
    <div class="py-1 bg-black top">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ <%= request.getSession().getAttribute("phone") %></span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text"><%= request.getSession().getAttribute("email") %></span>
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

    <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/blue.avif');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread"> Cart   </h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> </p>
          </div>
        </div>
      </div>
    </section>


      <div class="cart-page-container">

          <!-- Cart Items and Order Form Section (Left Side) -->
          <div class="cart-items-container">
          <div class="container">
                <h4>Your Cart Items</h4>
                    </div>
          <form id="order-now-form" action="order-now" method="post" class="custom-buy-form">


                  <div class="cart-items custom-scrollable">
                      <% if (cartProduct == null || cartProduct.isEmpty()) { %>
                          <p id="cart-status" data-status="empty">Your cart is empty.</p>
                      <% } else {
                          for (Cart c : cartProduct) {
                              int abovePrice = c.getAbovePrice();
                              int offer = c.getOffer();

                      %>
                         <div class="cart-item" data-id="<%= c.getId() %>">
                             <div class="product-image-quantity">
                                 <!-- Image with fixed size -->
                                 <img src="<%= c.getImageUrl() %>" alt="<%= c.getName() %>" class="custom-cart-image fixed-size-image" />

                                 <!-- Quantity control moved below the image -->
                                 <div class="quantity-control">
                                     <input type="hidden" name="id" value="<%= c.getId() %>" />
                                     <input type="hidden" name="above" value="<%= c.getAbovePrice() %>" class="form-input">
                                     <input type="hidden" name="offer" value="<%= c.getOffer() %>" class="form-input">
                                     <input type="hidden" name="amount" value="<%= c.getCartPrice() %>" class="form-input">
                                     <input type="hidden" name="quantity" value="<%= c.getQuantity() %>" />

                                     <!-- Align decrement, input, and increment buttons below the image -->
                                     <div class="quantity-btn-group">
                                         <a class="btn-decre" href="javascript:void(0);" onclick="updateQuantity('dec', <%= c.getId() %>, this)">
                                             <i class="fas fa-minus-square"></i>
                                         </a>
                                         <input type="text" class="custom-quantity-input" name="quantityDisplay" value="<%= c.getQuantity() %>" readonly>
                                         <a class="btn-incre" href="javascript:void(0);" onclick="updateQuantity('inc', <%= c.getId() %>, this)">
                                             <i class="fas fa-plus-square"></i>
                                         </a>
                                     </div>
                                 </div>
                             </div>

                             <div class="cart-item-box">
                                 <div class="cart-details">
                                     <h5 class="product-name"><%= c.getName() %></h5>
                                     <div class="quantity">
                                         <span>Quantity:</span>
                                         <span class="quantity-value" ><%= c.getQuantity() %></span>
                                     </div>


                                     <div class="offer-message" style='display: <%= (c.getQuantity() >= abovePrice) ? "block" : "none" %>;'>
                                                 <span><strong><%= offer %>%</strong> off on this product!</span>
                                             </div>


                                     <div class="product-price">
                                         Price: &#8377;<span class="price-value"><%= c.getPrice() %></span>
                                     </div>
                                 </div>
                             </div>

                             <div class="product-actions">
                                 <a href="javascript:void(0);" data-id="<%= c.getId() %>" class="btn btn-sm btn-danger custom-remove-btn">Remove</a>
                             </div>
                         </div>
                      <% } } %>
                  </div>

                  <div class="custom-total-price-container">
                      <a href="checkOut" class="mx-3 btn btn-primary custom-checkout-btn">Check out</a>
                  </div>
              </form>

          </div>
      </div>


<!-- Modal HTML -->
<div class="modal fade" id="removeConfirmModal" tabindex="-1" role="dialog" aria-labelledby="removeConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="removeConfirmModalLabel">Remove Item</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure you want to remove this item from the cart?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" id="confirmRemoveBtn">Remove</button>
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
                   <c:forEach var="img" items="${pictures}" begin="0" end="2">
                        <a href="#" class="thumb-menu img" style="background-image: url('http://localhost:8080/untitled/images/${img.image}');">
                   </a>
                </c:forEach>
             </div>

                <div class="thumb d-flex">
                      <c:forEach var="img" items="${pictures}" begin="3" end="5">
                             <a href="#" class="thumb-menu img" style="background-image: url('http://localhost:8080/untitled/images/${img.image}');">
                     </a>
                 </c:forEach>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Color lib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Color lib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script></body>
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
  <script src="http://localhost:8080/untitled/js/range.js"></script>
    <script src="http://localhost:8080/untitled/js/jquery-3.2.1.min.js"></script>
 <script>
     function updateQuantity(action, itemId, element) {
         const xhr = new XMLHttpRequest();
         xhr.open("POST", "quantity-inc-dec", true);
         xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

         const quantityInput = element.closest('.quantity-control').querySelector('.custom-quantity-input');
         const currentQuantity = parseInt(quantityInput.value, 10);

         const abovePrice = parseInt(element.closest('.product-image-quantity').querySelector('input[name="above"]').value, 10);
         const offer = parseInt(element.closest('.product-image-quantity').querySelector('input[name="offer"]').value, 10); // Get offer value
         const pricePerUnit = parseInt(element.closest('.product-image-quantity').querySelector('input[name="amount"]').value, 10);

         const priceElement = element.closest('.cart-item').querySelector('.price-value');
         const quantityValueElement = element.closest('.cart-item').querySelector('.quantity-value');
         const offerMessageElement = element.closest('.cart-item').querySelector('.offer-message');

         let newQuantity = (action === 'inc') ? currentQuantity + 1 : Math.max(1, currentQuantity - 1);
         let newPrice = pricePerUnit * newQuantity;

         // Apply discount if new quantity reaches the threshold
         if (newQuantity >= abovePrice) {
             const discount = (newPrice * offer) / 100;
             newPrice -= discount;
         }

         xhr.onreadystatechange = function() {
             if (xhr.readyState === 4) {
                 if (xhr.status === 200) {
                     const response = JSON.parse(xhr.responseText);

                     // Update the quantity in both the input field and the displayed quantity
                     quantityInput.value = response.newQuantity;
                     quantityValueElement.textContent = response.newQuantity;

                     // Update the price in the price element
                     priceElement.textContent = newPrice.toFixed(2); // Fixed decimal for currency

                     // Update cart count
                     updateCartItemCount();

                     // Log the offer value for debugging
                     console.log("Current offer value:", offer);

                     // Dynamically update offer message visibility and content based on the quantity and offer
                     if (response.newQuantity >= abovePrice) {
                         offerMessageElement.style.display = 'block';
                         if (offer > 0) {
                             console.log("Offer applied: " + offer + "%");

                             // Use string concatenation instead of template literals
                             offerMessageElement.innerHTML = '<span><strong>' + offer + '%</strong> off on this product!</span>';
                         } else {
                             console.error("Offer is invalid or zero:", offer);
                             offerMessageElement.innerHTML = ''; // Clear message if invalid
                         }
                     } else {
                         offerMessageElement.style.display = 'none';
                     }
                 } else {
                     console.error("Error updating quantity:", xhr.statusText);
                 }
             }
         };

         xhr.send("action=" + encodeURIComponent(action) + "&id=" + encodeURIComponent(itemId) + "&newQuantity=" + encodeURIComponent(newQuantity));
     }


     $(document).ready(function() {
         let itemIdToRemove;
         let removeBtnReference;

         // When clicking the remove button, show the modal
         $('.custom-remove-btn').on('click', function(e) {
             e.preventDefault(); // Prevent default behavior

             // Capture item ID and the remove button that was clicked
             itemIdToRemove = $(this).data('id');
             removeBtnReference = $(this);

             // Show the Bootstrap modal
             $('#removeConfirmModal').modal('show');
         });

         // When the "Remove" button in the modal is clicked
         $('#confirmRemoveBtn').on('click', function() {
             // Proceed to remove the item via AJAX
             $.ajax({
                 url: 'remove-from-cart',
                 type: 'GET',
                 data: { id: itemIdToRemove },
                 success: function(response) {
                     // Remove the cart item from the DOM
                     removeBtnReference.closest('.cart-item').remove();
                     updateCartItemCount(); // Update cart count dynamically

                     // Hide the modal after successful removal
                     $('#removeConfirmModal').modal('hide');
                 },
                 error: function(xhr, status, error) {
                     alert('Failed to remove item from the cart');
                 }
             });
         });

         // When the "Cancel" button in the modal is clicked, hide the modal
         $('#removeConfirmModal .btn-secondary').on('click', function() {
             // Just hide the modal; no further action required
             $('#removeConfirmModal').modal('hide');
         });
     });

     // Function to update the cart item count in the navbar
     function updateCartItemCount() {
         $.ajax({
             url: 'cart-count', // Servlet to fetch the total cart count
             type: 'GET',
             dataType: 'json',
             success: function(response) {
                 // Update the cart item count in the navbar
                 $('#cart-count').text(response.itemCount); // Update element with id 'cart-count'
             },
             error: function(xhr, status, error) {
                 console.log('Error fetching cart item count:', error);
             }
         });
     }

     $(document).ready(function() {
         updateCartItemCount(); // Initialize the cart count when the page loads
     });
 </script>

 <script>
     document.getElementById("order-now-form").addEventListener("submit", function(event) {
         var cartItems = document.querySelectorAll('.cart-item');
         if (cartItems.length === 0) {
             event.preventDefault();
             alert("Your cart is empty. Please add items to the cart before ordering.");
         }
     });
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

 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>