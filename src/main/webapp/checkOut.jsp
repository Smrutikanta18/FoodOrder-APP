<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>  <!-- Adjust package name -->
<%
    List<Cart> cartProduct = (List<Cart>) request.getSession().getAttribute("carts");
    Double total= (Double) request.getSession().getAttribute("totalsum");
    Double discount= (Double) request.getSession().getAttribute("discount");
    Double totalAmount = (Double) session.getAttribute("totalAmount");
        Double totalDiscount = (Double) session.getAttribute("totalDiscount");
        Double totalPrice = (Double) session.getAttribute("totalPrice");
        Double totalDis = (Double) session.getAttribute("discount2");
        double sum = 0;
        double discount1=0;
        double discount2=0;
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

    <style>
    .user-address-container{
        display: flex;
        justify-content: space-between;
        gap: 20px;
        padding: 20px;
        margin-top:10px;
        margin-left: 20px;
        width: 68%;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #fafcfc;
    }
    .user-address-display{
    flex: 1;
    background-color: #fff;
    border-radius: 8px;
    font-size: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 10px;
    gap:5px;
    margin-bottom:5px;
    }
    .ptag{
    margin-bottom:2px;
    }


    .button1 {
        width: 15%;
        padding: 12px;
        background-color: #dce6e6;
        border: none;
        color: black;
        margin-left:700px;
        font-size: 1rem;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.3s;
        margin-top: 1rem;
    }

    .button1:hover {
        background-color: #357ab8;
    }
   .user-address-form {
       background-color: #f9f9f9;
       padding: 15px;
       border-radius: 8px;
       max-width: 1000px;
       margin: 0 auto;
       box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
       font-family: Arial, sans-serif;
   }

   .user-address-form h3 {
       color: #333;
       text-align: center;
       margin-bottom: 15px;
       font-size: 1.3em;
   }

   .form-row {
       display: flex;
       gap: 10px;
       margin-bottom: 10px;
       flex-wrap: wrap;
   }

   .form-group {
       flex: 1;
       min-width: 160px;
   }

   .user-address-form label {
       display: block;
       margin-bottom: 4px;
       font-weight: 600;
       color: #555;
       font-size: 0.85em;
   }

   .user-address-form input[type="text"],
   .user-address-form input[type="email"],
   .user-address-form input[type="tel"] {
       width: 100%;
       padding: 8px;
       border: 1px solid #ccc;
       border-radius: 4px;
       font-size: 0.85em;
       transition: border-color 0.3s ease;
   }

   .user-address-form input[type="text"]:focus,
   .user-address-form input[type="email"]:focus,
   .user-address-form input[type="tel"]:focus {
       border-color: #007bff;
       outline: none;
   }

   .user-address-form button[type="submit"] {
       width: 100%;
       padding: 8px;
       background-color: #007bff;
       color: #fff;
       border: none;
       border-radius: 4px;
       font-size: 0.9em;
       font-weight: bold;
       cursor: pointer;
       transition: background-color 0.3s ease;
   }

   .user-address-form button[type="submit"]:hover {
       background-color: #0056b3;
   }

   /* Responsive adjustments */
   @media (max-width: 600px) {
       .form-row {
           flex-direction: column;
       }
   }
</style>
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
             height: 200px;
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
        /* General container styling */
        .address-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .address-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Form styling */
        .add-address-form {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .add-address-form .form-label {
            font-weight: bold;
            color: #555;
        }

        .add-address-form .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            width: 100%;
        }

        .add-address-form .row .col {
            margin-bottom: 10px;
        }

        .add-address-form .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-address-form .btn:hover {
            background-color: #0056b3;
        }

        /* Address list */
        .address-list {
            margin-top: 20px;
        }

        .address-item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .address-item p {
            margin: 5px 0;
            color: #444;
        }

        .address-item strong {
            color: #000;
        }

        /* Buttons */
        .add-new-address-btn {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            display: block;
            width: 100%;
            text-align: center;
        }

        .add-new-address-btn:hover {
            background-color: #218838;
        }

        /* Form responsiveness */
        @media (max-width: 768px) {
            .address-container {
                width: 95%;
            }

            .add-address-form .row .col {
                margin-bottom: 10px;
            }

            .add-new-address-btn {
                width: 100%;
            }
        }
        </style>
    <style>
    .custom-navbar1 {
        background-color: transparent;
        padding: 0;
    }

    .breadcrumb-nav1 {
        list-style: none;
        display: flex;
        justify-content: center; /* Centers the breadcrumb items horizontally */
        align-items: center;
        padding: 0;
    }

    .breadcrumb-item1 {
        font-size: 15px;
        font-weight: bold;
        color: #333;
        position: relative;
    }

    .breadcrumb-item1.active {
        color: green; /* Active state color changed to green */
    }

    .breadcrumb-item1:not(:last-child)::after {
        content: '-------'; /* Separator between breadcrumb items */
        color: #999;
        font-weight: normal;
    }

    .breadcrumb-item1:last-child::after {
        content: ''; /* Remove the separator after the last breadcrumb item */
    }

    .container1 {
        display: flex;
        justify-content: center;
        margin: 20px 0; /* Add space above and below the navbar */
    }

    @media (max-width: 768px) {
        .breadcrumb-item1 {
            font-size: 16px;
        }

        .breadcrumb-item1:not(:last-child)::after {
            content: '---'; /* Shorten the separator for smaller screens */
        }
    }
    </style>

</head>
<body>
   <div class="container1">
           <nav class="navbar custom-navbar1">
               <ul class="breadcrumb-nav1">
                   <li class="breadcrumb-item1 active">Cart</li>
                   <li class="breadcrumb-item1">Address</li>
                   <li class="breadcrumb-item1">Payment</li>
               </ul>
           </nav>
       </div>


         <div class="cart-page-container">
             <!-- Cart Items and Order Form Section (Left Side) -->
             <div class="cart-items-container">
             <form id="order-now-form" action="order-now" method="post" class="custom-buy-form">


                     <div class="cart-items custom-scrollable">
                         <% if (cartProduct == null || cartProduct.isEmpty()) { %>
                             <p id="cart-status" data-status="empty">Your cart is empty.</p>
                         <% }
                        else {


                    for (Cart c : cartProduct) {
                        int abovePrice = c.getAbovePrice();
                        int offer = c.getOffer();
                %>
                        <div class="cart-item" data-id="<%= c.getId() %>">
                            <div class="product-image-quantity">
                                <!-- Image with fixed size -->
                                <img src="<%= c.getImageUrl() %>" alt="<%= c.getName() %>" class="custom-cart-image fixed-size-image" />
                            </div>

                            <input type="hidden" name="id" value="<%= c.getId() %>" />
                            <input type="hidden" name="above" value="<%= c.getAbovePrice() %>" class="form-input">
                            <input type="hidden" name="offer" value="<%= c.getOffer() %>" class="form-input">
                            <input type="hidden" name="amount" value="<%= c.getCartPrice() %>" class="form-input">
                            <input type="hidden" name="quantity" value="<%= c.getQuantity() %>" />
                            <input type="hidden" class="custom-quantity-input" name="quantityDisplay" value="<%= c.getQuantity() %>" readonly>

                            <div class="cart-item-box">
                                <div class="cart-details">
                                    <h5 class="product-name"><%= c.getName() %></h5>
                                    <div class="quantity">
                                        <span>Quantity:</span>
                                        <span class="quantity-value"><%= c.getQuantity() %></span>
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
                                <a style="display: none;" href="javascript:void(0);" data-id="<%= c.getId() %>" class="btn btn-sm btn-danger custom-remove-btn">Remove</a>
                            </div>
                        </div>
                        <%

                        sum += c.getPrice();
                        discount1 +=c.getDiscount();
                        discount2 += discount1;
                         discount1 = 0 ;
                        %>
                <%
                    }

                %>
                <% } %>
            </div>

                    <div class="custom-total-price-container">
                        <a href="cart" class="mx-3 btn btn-primary custom-checkout-btn">Add More</a>
                    </div>
                     <div class="custom-total-price-container">
                         <button type="submit" class="mx-3 btn btn-primary custom-checkout-btn">Place Order</button>
                     </div>
                 </form>
             </div>

             <div class="price-details-container">
                 <h3>Price Details</h3>
                 <div class="price-details">
                     <div class="price-item">
                         <span>Discount</span>
                         <span>- &#8377;<%= String.format("%.1f", totalDis-sum) %></span>
                     </div>
                     <div class="price-item total-amount">
                         <strong>Total Amount</strong>
                         <strong>&#8377;<%= String.format("%.1f", sum) %></strong>
                     </div>
                     <p class="savings-message">You will save &#8377;<%= String.format("%.1f", totalDis-sum) %> on this order</p>
                 </div>
             </div>
         </div>


   <div class="user-address-container">
      <div id="userAddressDisplay" class="user-address-display" style="${empty addressDetails ? 'display: none;' : 'display: block;'}">
          <p class="ptag"><span id="userFirstname">${addressDetails['firstname']}</span> <span id="userLastname">${addressDetails['lastname']}</span>, <span id="userEmail">${addressDetails['email']}</span>, <span id="userPhone">${addressDetails['phone']}</span></p>
          <p class="ptag"><span id="userLocation">${addressDetails['location']}</span>, <span id="userArea">${addressDetails['area']}</span>, <span id="userStreet">${addressDetails['street']}</span>, <span id="userPlotNo">${addressDetails['plotNo']}</span></p>
          <p class="ptag"><span id="userState">${addressDetails['state']}</span>, <span id="userCity">${addressDetails['city']}</span>, <span id="userCountry">${addressDetails['country']}</span>, <span id="userPinNo">${addressDetails['pinNo']}</span></p>
          <button id="userChangeAddressBtn" onclick="toggleUserAddressForm()">Change Address</button>
      </div>

       <button id="userToggleAddAddress" class="button1" onclick="toggleUserAddressForm()">Add Address</button>

       <div id="userAddressForm" class="user-address-form" style="display: none;">
           <h3>Enter Your Address</h3>
           <form id="submitForm" method="post">
               <div class="form-row">
                   <div class="form-group">
                       <label for="firstName">First Name:</label>
                       <input type="text" id="userFirstNameInput" name="firstName1" required>
                   </div>
                   <div class="form-group">
                       <label for="lastName">Last Name:</label>
                       <input type="text" id="userLastNameInput" name="lastName1" required>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-group">
                       <label for="pinno">Pin No:</label>
                       <input type="text" id="userPinNoInput" name="pinno1" required>
                   </div>
                   <div class="form-group">
                       <label for="plotNo">Plot No:</label>
                       <input type="text" id="userPlotNoInput" name="plotNo1">
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-group">
                       <label for="email">Email:</label>
                       <input type="email" id="userEmailInput" name="email1" required>
                   </div>
                   <div class="form-group">
                       <label for="phone">Phone:</label>
                       <input type="tel" id="userPhoneInput" name="phone1" required>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-group">
                       <label for="location">Location:</label>
                       <input type="text" id="userLocationInput" name="location1" required>
                   </div>
                   <div class="form-group">
                       <label for="street">Street:</label>
                       <input type="text" id="userStreetInput" name="street1">
                   </div>
                   <div class="form-group">
                       <label for="area">Area:</label>
                       <input type="text" id="userAreaInput" name="area1" required>
                   </div>
               </div>
               <div class="form-row">
                   <div class="form-group">
                       <label for="state">State:</label>
                       <input type="text" id="userStateInput" name="state1" required>
                   </div>
                   <div class="form-group">
                       <label for="country">Country:</label>
                       <input type="text" id="userCountryInput" name="country1" required>
                   </div>
                   <div class="form-group">
                       <label for="city">City:</label>
                       <input type="text" id="userCityInput" name="city1" required>
                   </div>
               </div>
               <button type="submit">Save Address</button>
           </form>
       </div>

       <script>
          document.getElementById("submitForm").onsubmit = function(event) {
              event.preventDefault();
              var xhr = new XMLHttpRequest();
              xhr.open('POST', '/untitled/addBeforeLogin', true);
              xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
              const firstName = document.getElementById("userFirstNameInput").value;
              const lastName = document.getElementById("userLastNameInput").value;
              const pinNo = document.getElementById("userPinNoInput").value;
              const plotNo = document.getElementById("userPlotNoInput").value;
              const email = document.getElementById("userEmailInput").value;
              const phone = document.getElementById("userPhoneInput").value;
              const location = document.getElementById("userLocationInput").value;
              const street = document.getElementById("userStreetInput").value;
              const area = document.getElementById("userAreaInput").value;
              const state = document.getElementById("userStateInput").value;
              const country = document.getElementById("userCountryInput").value;
              const city = document.getElementById("userCityInput").value;

              xhr.onload = function() {
                  if (xhr.status >= 200 && xhr.status < 300) {
                      const data = JSON.parse(xhr.responseText);

                      document.getElementById("userPinNo").innerText = data.pinNo || "N/A";
                      document.getElementById("userLocation").innerText = data.location || "N/A";
                      document.getElementById("userArea").innerText = data.area || "N/A";
                      document.getElementById("userPlotNo").innerText = data.plotNo || "N/A";
                      document.getElementById("userState").innerText = data.state || "N/A";
                      document.getElementById("userCity").innerText = data.city || "N/A";
                      document.getElementById("userFirstname").innerText = data.firstname || "N/A";
                      document.getElementById("userLastname").innerText = data.lastname || "N/A";
                      document.getElementById("userCountry").innerText = data.country || "N/A";
                      document.getElementById("userEmail").innerText = data.email || "N/A";
                      document.getElementById("userPhone").innerText = data.phone || "N/A";
                      document.getElementById("userStreet").innerText = data.street || "N/A";

                      document.getElementById("userAddressDisplay").style.display = "block";
                      document.getElementById("userAddressForm").style.display = "none";
                      document.getElementById("userToggleAddAddress").style.display = "none";
                  } else {
                      console.error('Request failed with status:', xhr.status);
                  }
              };

              xhr.send("firstName1=" + encodeURIComponent(firstName) + "&lastName1=" + encodeURIComponent(lastName) + "&pinno1=" + encodeURIComponent(pinNo) + "&plotNo1=" + encodeURIComponent(plotNo) + "&email1=" + encodeURIComponent(email) + "&phone1=" + encodeURIComponent(phone) + "&location1=" + encodeURIComponent(location) + "&street1="  + encodeURIComponent(street) + "&area1=" + encodeURIComponent(area) + "&state1=" + encodeURIComponent(state) + "&country1=" + encodeURIComponent(country) + "&city1=" + encodeURIComponent(city));
          };


           function toggleUserAddressForm() {
               const addressForm = document.getElementById("userAddressForm");
               const toggleButton = document.getElementById("userToggleAddAddress");
               const addressDisplay = document.getElementById("userAddressDisplay");

               if (addressForm.style.display === "none") {
                   addressForm.style.display = "block";
                   toggleButton.style.display = "none";
                   addressDisplay.style.display = "none";
               } else {
                   addressForm.style.display = "none";
                   toggleButton.style.display = "block";
               }
           }

       </script>
       <script>
       window.onload = function() {
               const addressDisplay = document.getElementById("userAddressDisplay");
               const toggleButton = document.getElementById("userToggleAddAddress");
               if (addressDisplay.style.display === "block") {
                   toggleButton.style.display = "none";
               }
           };
       </script>



    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta3/js/bootstrap.min.js"></script>
</body>
</html>
