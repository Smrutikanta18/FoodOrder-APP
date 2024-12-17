<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%
    UsersData users = (UsersData) request.getSession().getAttribute("users");
    List<Address> userAddresses = (List<Address>) request.getSession().getAttribute("userAddresses");

    String userId = String.valueOf(users.getId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Address</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            margin: 10px 0; /* Add space above and below the navbar */
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
    <style>
    /* General container styling */
    .address-container {
        width: 100%;
        max-width: 1250px;
        margin: 30px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* Headings */
    .address-container h2 {
        font-size: 26px;
        margin-bottom: 20px;
        font-weight: bold;
        text-align: center;
        color: #333;
    }

    /* Address item styling */
    .address-item {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 15px;
        margin: 10px 0;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
    }
    /* Add this to your existing CSS */
    .address-list {
        max-height: 300px; /* Adjust this value based on your layout */
        overflow-y: auto; /* Enables vertical scrolling */
        padding: 10px; /* Optional padding for better appearance */
        border: 1px solid #ddd; /* Optional border for better visibility */
        border-radius: 8px; /* Optional rounded corners */
        background-color: #f9f9f9; /* Background color for the list */
    }


    .address-item:hover {
        background-color: #e6e6e6;
        transform: translateY(-2px);
    }

    /* Form styles */
    .add-address-form {
        margin-top: 20px;
    }

    /* Responsive form fields */
    .form-control {
        border: 1px solid #ced4da;
        border-radius: 5px;
        padding: 10px;
        font-size: 14px;
    }

    /* Button styles */
    .btn {
        width: 30%;
        margin-bottom:3px;
        padding: 12px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    /* Add New Address button */
    .add-new-address-btn {
        background-color: #007bff;
        color: white;
        transition: background-color 0.3s;
    }

    .add-new-address-btn:hover {
        background-color: #0056b3;
    }

    /* Cart button styling */
    .cart-btn {
        background-color: #28a745;
        margin-bottom: 2px;
        width: 30%;
        color: white;
        transition: background-color 0.3s;
    }

    .cart-btn:hover {
        background-color: #218838;
    }

    /* Media Queries for Mobile Responsiveness */
    @media (max-width: 768px) {
        .address-container {
            padding: 15px;
        }

        .address-container h2 {
            font-size: 22px;
        }

        .address-item {
            padding: 12px;
        }

        .form-control {
            font-size: 12px;
        }

        .btn {
            font-size: 14px;
        }
    }

    @media (max-width: 576px) {
        .address-container {
            width: 95%;
        }

        .address-container h2 {
            font-size: 20px;
        }
    }
</style>
</head>
<body>
    <div class="container1">
        <nav class="navbar custom-navbar1">
            <ul class="breadcrumb-nav1">
                <li class="breadcrumb-item1">Cart</li>
                <li class="breadcrumb-item1 active">Address</li>
                <li class="breadcrumb-item1">Payment</li>
            </ul>
        </nav>
    </div>

    <div class="address-container">
        <h2>Give Address</h2>

        <% if (userAddresses == null || userAddresses.isEmpty()) { %>
            <div class="add-address-form" style="display: block;">
                <form action="addAddress" method="POST" class="mt-4">
                    <input type="hidden" name="userId" value="<%= userId %>">

                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" name="firstName" class="form-control" id="firstName" required>
                        </div>
                        <div class="col">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" name="lastName" class="form-control" id="lastName" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email" required>
                    </div>

                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <input type="text" name="location" class="form-control" id="location" required>
                    </div>

                    <div class="mb-3">
                        <label for="street" class="form-label">Street</label>
                        <input type="text" name="street" class="form-control" id="street" required>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="state" class="form-label">State</label>
                            <input type="text" name="state" class="form-control" id="state" required>
                        </div>
                        <div class="col">
                            <label for="country" class="form-label">Country</label>
                            <input type="text" name="country" class="form-control" id="country" required>
                        </div>
                        <div class="col">
                            <label for="city" class="form-label">City</label>
                            <input type="text" name="city" class="form-control" id="city" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="plotNo" class="form-label">Plot No</label>
                            <input type="text" name="plotNo" class="form-control" id="plotNo">
                        </div>
                        <div class="col">
                            <label for="pinno" class="form-label">Pin Code</label>
                            <input type="text" name="pinno" class="form-control" id="pinno" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="area" class="form-label">Area</label>
                        <input type="text" name="area" class="form-control" id="area" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone No.</label>
                        <input type="text" name="phone" class="form-control" id="phone" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit Address</button>
                </form>
            </div>
        <% } else { %>
            <div class="address-list">
                <h4>Select from previous address to proceed</h4>
                <% for (Address addr : userAddresses) { %>
                    <div class="address-item" onclick="submitAddress('<%= addr.getId() %>')">
                        <p> <%= addr.getFirstName() %> <%= addr.getLastName() %> , <%= addr.getPhone() %></p>
                        <p> <%= addr.getLocation() %>, <%= addr.getStreet() %>, <%= addr.getPlotNo() %>, <%= addr.getArea() %></p>
                        <p><%= addr.getCity() %>, <%= addr.getState() %>, <%= addr.getCountry() %>, <%= addr.getPinNo() %></p>
                    </div>
                <% } %>
            </div>
              <br>
            <form id="submitAddressForm" action="selectAddress" method="POST">
                <input type="hidden" id="selectedAddressId" name="addressId" value="">
                <input type="hidden" name="useremail" value="<%= users.getEmail() %>">
            </form>

            <button class="btn btn-secondary add-new-address-btn" onclick="toggleAddAddressForm()">Add New Address</button>
            <a class="btn btn-primary cart-btn" href="clearTempOrder">Cart</a>

            <div class="add-address-form" style="display: none;">
                <form action="addAddress" method="POST" class="mt-4">
                    <input type="hidden" name="userId" value="<%= userId %>">

                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" name="firstName" class="form-control" id="firstName" required>
                        </div>
                        <div class="col">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" name="lastName" class="form-control" id="lastName" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email" required>
                    </div>

                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <input type="text" name="location" class="form-control" id="location" required>
                    </div>

                    <div class="mb-3">
                        <label for="street" class="form-label">Street</label>
                        <input type="text" name="street" class="form-control" id="street" required>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="state" class="form-label">State</label>
                            <input type="text" name="state" class="form-control" id="state" required>
                        </div>
                        <div class="col">
                            <label for="country" class="form-label">Country</label>
                            <input type="text" name="country" class="form-control" id="country" required>
                        </div>
                        <div class="col">
                            <label for="city" class="form-label">City</label>
                            <input type="text" name="city" class="form-control" id="city" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="plotNo" class="form-label">Plot No</label>
                            <input type="text" name="plotNo" class="form-control" id="plotNo">
                        </div>
                        <div class="col">
                            <label for="pinno" class="form-label">Pin Code</label>
                            <input type="text" name="pinno" class="form-control" id="pinno" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="area" class="form-label">Area</label>
                        <input type="text" name="area" class="form-control" id="area" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone No.</label>
                        <input type="text" name="phone" class="form-control" id="phone" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit Address</button>
                </form>
            </div>
        <% } %>
    </div>



    <script>
        function submitAddress(addressId) {
            document.getElementById("selectedAddressId").value = addressId;
            document.getElementById("submitAddressForm").submit();
        }

         function toggleAddAddressForm() {
                var form = document.querySelector('.add-address-form');
                var displayStatus = form.style.display;

                // Toggle display between 'block' and 'none'
                if (displayStatus === 'none' || displayStatus === '') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }
    </script>
</body>
</html>
