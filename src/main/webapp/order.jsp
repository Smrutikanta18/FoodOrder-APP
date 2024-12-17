<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    UsersData auth = (UsersData) session.getAttribute("users");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    double totalSum = (double) request.getAttribute("totalSum");

    if (auth == null) {
        response.sendRedirect("login.jsp");
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<%
UsersData users=(UsersData)request.getSession().getAttribute("users");
if(users != null){
request.setAttribute("users",users);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Cart</title>
    <style>
    /* Container for pagination controls */
    .pagination-controls {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }

    /* Style for pagination links (numbers) */
    .pagination-link {
        display: inline-block;
        width: 40px;
        height: 40px;
        line-height: 40px;
        margin: 0 5px;
        text-align: center;
        border-radius: 50%;
        background-color: #f0f0f0;
        color: #333;
        font-size: 16px;
        font-weight: bold;
        text-decoration: none;
        border: 2px solid #ddd;
        transition: all 0.3s ease;
    }

    /* Add hover effect for pagination links */
    .pagination-link:hover {
        background-color: #333;
        color: #fff;
        border-color: #333;
    }

    /* Active page (current page) */
    .pagination-link.active {
        background-color: #007bff;
        color: #fff;
        border-color: #007bff;
    }

    /* Style for the previous and next buttons */
    .pagination-controls button {
        background-color: #ddd;
        border: none;
        color: #333;
        font-size: 16px;
        padding: 10px 15px;
        margin: 0 10px;
        cursor: pointer;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    /* Hover effect for buttons */
    .pagination-controls button:hover {
        background-color: #333;
        color: #fff;
    }

    /* Disabled button styling */
    .pagination-controls button:disabled {
        background-color: #f0f0f0;
        color: #aaa;
        cursor: not-allowed;
    }

        .custom-cart-container {
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .custom-cart-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
            margin-bottom: 20px;
        }
        .limited-width {
            max-width: 150px; /* Adjust as necessary */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .custom-cart-table {
            width: 100%;
            background-color: #ffffff;
            border-radius: 10px;
            overflow-x: auto;
        }
        .custom-cart-table th, .custom-cart-table td {
            text-align: center;
            padding: 15px;
            vertical-align: middle;
            font-size: 1rem;
        }
        .custom-cart-table th {
            background-color: #6c757d;
            color: #ffffff;
        }
        .custom-cart-table tbody tr {
            transition: background-color 0.2s ease-in-out;
        }
        .custom-cart-table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .custom-cart-image {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid #dee2e6;
        }
        .custom-cart-cancel-btn {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            font-size: 0.875rem;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }
        .custom-cart-cancel-btn:hover {
            background-color: #c82333;
        }
        .custom-cart-footer {
            margin-top: 20px;
            text-align: right;
            font-size: 1.25rem;
            font-weight: bold;
        }
        @media (max-width: 768px) {
            .custom-cart-container {
                padding: 15px;
            }
            .custom-cart-table th, .custom-cart-table td {
                font-size: 0.875rem;
                padding: 10px;
            }
            .custom-cart-footer {
                font-size: 1.1rem;
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
        	        	<li class="nav-item "><a href="welcome" class="nav-link">Home</a></li>
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

        	            <li class="nav-item active"><a href="orders" class="nav-link">Orders</a></li>
        	            <li class="nav-item"><a href="userReservation" class="nav-link">Reservation</a></li>
        	            <li class="nav-item"><a href="userProfile?id=<%= users.getId()%>" class="nav-link">Profile</a></li>
        	            <li class="nav-item"><a href="userLogout" class="nav-link">Logout</a></li>
        	        </ul>
        	      </div>
        	    </div>
        	 </nav>
        <section class="hero-wrap hero-wrap-2" style="background-image: url('http://localhost:8080/untitled/images/black.avif');" data-stellar-background-ratio="0.5">
              <div class="overlay"></div>
              <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                  <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-2 bread">Orders</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>menu <i class="ion-ios-arrow-forward"></i></span></p>
                  </div>
                </div>
              </div>
        </section>

    <div class="container custom-cart-container">
        <div class="custom-cart-header">All Orders</div>
        <table class="table custom-cart-table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Image</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
            <%
                if (orders != null) {
                    for (Order o : orders) {
            %>
                        <tr>
                            <td class="limited-width" ><%= o.getName() %></td>
                            <td><img src="<%= o.getImageUrl() %>" class="custom-cart-image" /></td>
                            <td><%= o.getQuantity() %></td>
                            <td>&#8377; <%= dcf.format(o.getPrice()) %></td>

                            <td>
                                <%
                                    String buttonStyle = "background-color: red; color: black; border: none; border-radius: 5px; cursor: pointer;";
                                    String buttonText = "Cancel";
                                    boolean isDisabled = false;

                                    if ("success".equals(o.getStatus())) {
                                        buttonStyle = "background-color: green; color: black; border: none; border-radius: 5px;";
                                        buttonText = "On the way";
                                        isDisabled = true;
                                    } else if ("paid".equals(o.getStatus())) {
                                        buttonStyle = "background-color: green; color: black; border: none; border-radius: 5px;";
                                        buttonText = "Delivered";
                                        isDisabled = true;
                                    } else if ("cancle".equals(o.getStatus())) {
                                        buttonStyle = "background-color: red; color: black; border: none; border-radius: 5px;";
                                        buttonText = "Canceled";
                                        isDisabled = true;
                                    }
                                %>

                        <button class="status-btn"
                                id="paidBtn-<%= o.getOid() %>-<%= o.getUemail() %>"
                                style="<%= buttonStyle %>"
                                <%= isDisabled ? "disabled" : "" %>
                                onclick="<%= isDisabled ? "" : "updateOrderPaid(" + o.getOid() + ", '" + o.getUemail() + "')" %>">
                            <%= buttonText %>
                        </button>

                            </td>

                        </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>

        <a href="cart" class="btn btn-sm btn-danger custom-remove-btn">go to Cart</a>

        <!-- <div class="custom-cart-footer">
            Total Price: &#8377;<span><%= dcf.format(totalSum) %></span>
        </div> -->
        <div class="pagination-controls">
        <%
         int totalOrders = (int) request.getAttribute("total");
         int itemsPerPage = (int) request.getAttribute("end");
         int totalPages = (int) Math.ceil((double) totalOrders / itemsPerPage);
         int currentPage = (int) request.getAttribute("pgno");
          if (currentPage > 0) {
        %>
        <a href="orders?pgno=<%= currentPage - 1 %>" class="pagination-link prev-link" style="font-size:10px;">Back</a>
        <% } else { %>
                     <button disabled>Previous</button>
                 <% } %>
                 <% for (int i = 0; i < totalPages; i++) { %>
                              <a href="orders?pgno=<%= i %>" class="pagination-link <%= (i == currentPage) ? "active" : "" %>"><%= i + 1 %></a>
                          <% } %>
        <% if (currentPage < totalPages - 1) { %>
             <a href="orders?pgno=<%= currentPage + 1 %>" class="pagination-link prev-link" style="font-size:10px;">Next</a>
         <% } else { %>
             <button disabled>Next</button>
         <% } %>
        </div>

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
     function fetchOrderStatuses() {
         const xhr = new XMLHttpRequest();
         xhr.open("GET", "orders?action=fetchStatuses", true);
         xhr.setRequestHeader("Content-Type", "application/json");

         xhr.onreadystatechange = function() {
             if (xhr.readyState === 4) {
                 if (xhr.status === 200) {
                     const response = JSON.parse(xhr.responseText);
                     const jsonData = response.jsonData;

                     if (!jsonData || !Array.isArray(jsonData.statusList)) {
                         console.error("Expected jsonData.statusList to be an array, but got:", jsonData);
                         return; // Exit if not an array
                     }

                     const statusList = jsonData.statusList;
                     console.log(statusList); // Log the array

                     statusList.forEach(function(order) {
                         const orderId = order.oid;
                         const userEmail = order.uemail;
                         const status = order.status;
                         const button = document.getElementById('paidBtn-' + orderId + '-' + userEmail);


                         if (!button) return; // Ensure the button exists

                         let buttonText, buttonColor, disabled;

                         if (status === "success") {
                             buttonText = "On the way";
                             buttonColor = "green";
                             disabled = true;
                         } else if (status === "paid") {
                             buttonText = "Delivered";
                             buttonColor = "green";
                             disabled = true;
                         } else if (status === "cancle") { // Check spelling
                             buttonText = "Canceled";
                             buttonColor = "red";
                             disabled = true;
                         } else if (status === "pending") {
                             buttonText = "Cancel";
                             buttonColor = "red";
                             disabled = false;
                         } else {
                             buttonText = "Unknown Status";
                             buttonColor = "gray";
                             disabled = true;
                         }

                         // Update the button if the text or color has changed
                         if (button.textContent !== buttonText || button.style.backgroundColor !== buttonColor) {
                             button.textContent = buttonText;
                             button.style.backgroundColor = buttonColor;
                             button.style.color = "black";
                             button.disabled = disabled;
                         }
                     });
                 } else {
                     console.error("Failed to fetch order statuses:", xhr.statusText);
                 }
             }
         };

         xhr.send();
     }

     setInterval(fetchOrderStatuses, 1000); // Fetch every 5 seconds to avoid too-frequent polling


     function updateOrderPaid(orderItemId, userEmail) {
         const xhr = new XMLHttpRequest();
         xhr.open("POST", "cancel-order", true);
         xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

         xhr.onreadystatechange = function() {
             if (xhr.readyState === 4) {
                 if (xhr.status === 200) {
                     const response = JSON.parse(xhr.responseText);
                     const canceledPrice = response.canceledPrice;

                     const paidBtn = document.getElementById('paidBtn-' + orderItemId + '-' + userEmail);
                     paidBtn.style.setProperty("background-color", "red", "important");
                     paidBtn.textContent = "Canceled";
                     paidBtn.disabled = true;

                     const totalPriceElement = document.querySelector('.custom-cart-footer span');
                     let currentTotal = parseFloat(totalPriceElement.textContent.replace('₹', '').trim());
                     currentTotal -= canceledPrice;

                     totalPriceElement.textContent = `₹${currentTotal.toFixed(2)}`;
                 } else {
                     console.error("Error updating order status:", xhr.statusText);
                 }
             }
         };

         xhr.send("orderId=" + encodeURIComponent(orderItemId) + "&userEmail=" + encodeURIComponent(userEmail));
     }

     document.addEventListener("DOMContentLoaded", fetchOrderStatuses);
 </script>


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
