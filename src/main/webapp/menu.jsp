<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.image" %>
<%@ page import="java.util.*" %>
<%@ page import="model.MenuItem" %>
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
    <style>
    .search-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }

    .search-input {
        padding: 10px 15px;
        width: 300px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .search-input:focus {
        border-color: #007bff;
    }

    .search-btn {
        padding: 10px 20px;
        border: none;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        margin-left: 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .search-btn:hover {
        background-color: #0056b3;
    }

    .container-unique {
        margin-top: 20px;
    }

    .menu-item-container {
        padding: 15px;
    }

    .menu-item-unique {
        border-radius: 10px;
        overflow: hidden;
        background-color: #fff;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .menu-item-unique:hover {
        transform: scale(1.05);
    }

    .menu-img-unique {
        height: 300px;
        background-size: cover;
        background-position: center;
    }

    .card-body-unique {
        padding: 20px;
    }

    .card-title-unique {
        font-size: 1.2em;
        font-weight: bold;
        margin-bottom: 0.5rem;
             -webkit-line-clamp: 2; /* Limit to 3 lines */
                                -webkit-box-orient: vertical; /* Set orientation to vertical */
                                overflow: hidden; /* Hide overflow */
                                text-overflow: ellipsis; /* Show ellipsis */
                                max-height: 1.5em; /* Set a max height based on line height (3 lines * line height) */
                                line-height: 1.5em;
    }

    .price-unique {
        font-size: 1.2em;
        color: #ff5a00;
        font-weight: bold;
    }

    .card-ingredient-unique {
        font-size: 0.9em;
        color: #888;
        margin: 10px 0;
        overflow: hidden; /* Ensures text fits within the container */
                text-overflow: ellipsis; /* Adds ellipsis if the text overflows */
                white-space: nowrap;
    }

    .para-unique {
        font-size: 1em;
        color: blue;
        font-weight: bold;
    }

    .read-more-unique {
        text-decoration: none;
        color: #007bff;
    }

    .read-more-unique:hover {
        text-decoration: underline;
    }
    @media (max-width: 768px) {
            .menu-item-unique {
                margin-bottom: 20px;
            }

            .menu-img-unique {
                height: 200px; /* Adjust image height for smaller screens */
            }

            .card-body-unique {
                padding: 15px;
            }

            .card-title-unique {
                font-size: 1em; /* Smaller font for mobile */
            }

            .price-unique {
                font-size: 1em;
            }

            .card-ingredient-unique {
                font-size: 0.8em;
            }

            .para-unique {
                font-size: 0.9em;
            }

            .container-unique {
                margin-top: 10px;
            }

            .menu-item-container {
                padding: 10px;
            }
        }

        @media (max-width: 576px) {
            .menu-item-container {
                padding: 5px;
            }

            .menu-img-unique {
                height: 150px; /* Further reduce image size for very small screens */
            }

            .card-body-unique {
                padding: 10px;
            }

            .card-title-unique {
                font-size: 0.9em;
            }

            .price-unique {
                font-size: 0.9em;
            }

            .card-ingredient-unique {
                font-size: 0.7em;
            }

            .para-unique {
                font-size: 0.8em;
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
	        	<li class="nav-item"><a href="about" class="nav-link">About</a></li>
	        	<li class="nav-item active"><a href="menu" class="nav-link">Menu</a></li>
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
            <h1 class="mb-2 bread">Our Specialties</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="welcome">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Menu <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

		<section class="ftco-section">
            	<div class="container-fluid px-4">
            		<div class="row justify-content-center mb-5 pb-2">
                  <div class="col-md-7 text-center heading-section ftco-animate">
                  	<span class="subheading">Specialties</span>
                    <h2 class="mb-4">Our Menu</h2>
                  </div>
                </div>

                <div class="search-container">
                    <input type="text" placeholder="Search items for breakfast..." class="search-input" id="searchInputBreakfast">
                    <button type="submit" class="search-btn" onclick="performSearch('Breakfast')">Search</button>
                </div>


                <div class="container-unique">
                    <!-- Row for heading -->
                    <div class="row">
                        <div class="col-12 text-center mb-4" style="font-weight: bold;">
                            <h3>BREAKFAST</h3>
                        </div>
                    </div>

                    <!-- Row for items -->
                    <div class="row justify-content-center" id="breakfastItemContainer">
                        <%
                            ArrayList<MenuItem> breakfastItems = (ArrayList<MenuItem>) request.getAttribute("breakfastItems");
                            if (breakfastItems != null && !breakfastItems.isEmpty()) {
                                for (MenuItem item : breakfastItems) {
                        %>
                        <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>);"></div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            } else {
                        %>
                        <p>No breakfast items available.</p>
                        <% } %>
                    </div>
                </div>
                <div class="search-container">
                    <input type="text" placeholder="Search items for lunch..." class="search-input" id="searchInputLunch">
                    <button type="submit" class="search-btn" onclick="performSearch('Lunch')">Search</button>
                </div>

                        <!-- Lunch -->
                        <div class="col-md-4-unique">
                            <div class="heading-menu-unique text-center mb-4">
                                <h3>LUNCH</h3>
                            </div>
                            </div>

                            <div class="row justify-content-center" id="lunchItemContainer">
                            <%
                                ArrayList<MenuItem> lunchItems = (ArrayList<MenuItem>) request.getAttribute("lunchItems");
                                if (lunchItems != null && !lunchItems.isEmpty()) {
                                    for (MenuItem item : lunchItems) {
                            %>
                            <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>); height: 300px; padding: 0; margin: 0; background-size: cover; width: 100%; background-repeat: no-repeat;">
                                    </div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique" style="color: blue; font-weight: bold;"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No lunch items available.</p>
                            <% } %>
                        </div>
                        </div>

                <div class="search-container">
                    <input type="text" placeholder="Search items for lunch..." class="search-input" id="searchInputDinner">
                    <button type="submit" class="search-btn" onclick="performSearch('Dinner')">Search</button>
                </div>
                        <!-- Dinner -->
                        <div class="col-md-4-unique">
                            <div class="heading-menu-unique text-center mb-4">
                                <h3>DINNER</h3>
                            </div>
                            </div>
                            <div class="row justify-content-center" id="dinnerItemContainer">
                            <%
                                ArrayList<MenuItem> dinnerItems = (ArrayList<MenuItem>) request.getAttribute("dinnerItems");
                                if (dinnerItems != null && !dinnerItems.isEmpty()) {
                                    for (MenuItem item : dinnerItems) {
                            %>
                            <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>); height: 300px; padding: 0; margin: 0; background-size: cover; width: 100%; background-repeat: no-repeat;">
                                    </div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique" style="color: blue; font-weight: bold;"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No dinner items available.</p>
                            <% } %>
                        </div>
                        </div>
                <div class="search-container">
                    <input type="text" placeholder="Search items for dessert..." class="search-input" id="searchInputDesserts">
                    <button type="submit" class="search-btn" onclick="performSearch('Desserts')">Search</button>
                </div>
                    <!-- Second Row: Desserts, Wine Card, Drinks -->
                        <!-- Desserts -->
                        <div class="col-md-4-unique">
                            <div class="heading-menu-unique text-center mb-4">
                                <h3>Desserts</h3>
                            </div>
                            </div>
                            <div class="row justify-content-center" id="dessertsItemContainer">
                            <%
                                ArrayList<MenuItem> dessertsItems = (ArrayList<MenuItem>) request.getAttribute("dessertsItems");
                                if (dessertsItems != null && !dessertsItems.isEmpty()) {
                                    for (MenuItem item : dessertsItems) {
                            %>
                            <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>); height: 300px; padding: 0; margin: 0; background-size: cover; width: 100%; background-repeat: no-repeat;">
                                    </div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique" style="color: blue; font-weight: bold;"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No desserts available.</p>
                            <% } %>
                        </div>
                        </div>

                <div class="search-container">
                    <input type="text" placeholder="Search items for wine..." class="search-input" id="searchInputWine">
                    <button type="submit" class="search-btn" onclick="performSearch('Wine Card')">Search</button>
                </div>
                        <!-- Wine Card -->
                        <div class="col-md-4-unique">
                            <div class="heading-menu-unique text-center mb-4">
                                <h3>Wine Card</h3>
                            </div>
                            </div>
                            <div class="row justify-content-center" id="wineItemContainer">
                            <%
                                ArrayList<MenuItem> wineCardItems = (ArrayList<MenuItem>) request.getAttribute("wineCardItems");
                                if (wineCardItems != null && !wineCardItems.isEmpty()) {
                                    for (MenuItem item : wineCardItems) {
                            %>
                            <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>); height: 300px; padding: 0; margin: 0; background-size: cover; width: 100%; background-repeat: no-repeat;">
                                    </div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique" style="color: blue; font-weight: bold;"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No wine card items available.</p>
                            <% } %>
                        </div>
                        </div>

                <div class="search-container">
                    <input type="text" placeholder="Search items for drinks..." class="search-input" id="searchInputDrinks">
                    <button type="submit" class="search-btn" onclick="performSearch('Drinks')">Search</button>
                </div>
                        <!-- Drinks -->
                        <div class="col-md-4-unique">
                            <div class="heading-menu-unique text-center mb-4">
                                <h3>Drinks</h3>
                            </div>
                            </div>
                            <div class="row justify-content-center" id="drinksItemContainer" >
                            <%
                                ArrayList<MenuItem> drinksItems = (ArrayList<MenuItem>) request.getAttribute("drinksItems");
                                if (drinksItems != null && !drinksItems.isEmpty()) {
                                    for (MenuItem item : drinksItems) {
                            %>
                            <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
                            <div class="card menu-item-unique mb-4">
                                <div class="d-flex flex-column">
                                    <div class="menu-img-unique" style="background-image: url(<%= item.getImageUrl() %>); height: 300px; padding: 0; margin: 0; background-size: cover; width: 100%; background-repeat: no-repeat;">
                                    </div>
                                    <div class="card-body-unique">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title-unique"><strong><%= item.getName() %></strong></h5>
                                            <span class="price-unique">&#8377;<%= item.getPrice() %></span>
                                        </div>
                                        <p class="card-ingredient-unique"><%= item.getIngredients() %></p>
                                        <p class="para-unique" style="color: blue; font-weight: bold;"><%= item.getOffer() %>% OFF FOR <%= item.getAbovePrice() %></p>
                                        <a href="readMore?id=<%= item.getId() %>" class="read-more-unique">Read more...</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No drinks available.</p>
                            <% } %>
                        </div>
                        </div>
                </div>
            </div>
        </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container-fluid px-0">
				<div class="row d-flex no-gutters">
          <div class="col-md-6 ftco-animate makereservation p-4 p-md-5 pt-5 pt-md-0">
          	<div class="heading-section ftco-animate mb-5">
	          	<span class="subheading">Book a table</span>
	            <h2 class="mb-4">Make Reservation</h2>
	          </div>
            <form action="book" method="post">
            	              <div class="row">
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Name</label>
            	                    <input type="text" name="name" class="form-control" placeholder="Your Name">
            	                  </div>
            	                </div>
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Email</label>
            	                    <input type="text" name="email" class="form-control" placeholder="Your Email">
            	                  </div>
            	                </div>
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Phone</label>
            	                    <input type="text" name="phone" class="form-control" placeholder="Phone">
            	                  </div>
            	                </div>
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Date</label>
            	                    <input type="text" name="date" class="form-control" id="book_date" placeholder="Date">
            	                  </div>
            	                </div>
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Time</label>
            	                    <input type="text" name="time" class="form-control" id="book_time" placeholder="Time">
            	                  </div>
            	                </div>
            	                <div class="col-md-6">
            	                  <div class="form-group">
            	                    <label for="">Person</label>
            	                    <div class="select-wrap one-third">
            	                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
            	                      <select type="text" name="persons" class="form-control">
            	                        <option value="">Person</option>
            	                        <option value="1">1</option>
            	                        <option value="2">2</option>
            	                        <option value="3">3</option>
            	                        <option value="4">4+</option>
            	                      </select>
            	                    </div>
            	                  </div>
            	                </div>
            	                <div class="col-md-12 mt-3">
            	                  <div class="form-group">
            	                    <a type="submit" href="reserve"  class="btn btn-primary py-3 px-5">Make a Reservation</a>
            	                  </div>
            	                </div>
            	              </div>
            	            </form>
          </div>
          <div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0">
						<div id="map" class="border"></div>
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
  <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.min.js"></script>

   <script id="menu-item-template" type="text/x-handlebars-template">
       {{#each items}}
       <div class="col-md-4 col-sm-6 col-xs-12 menu-item-container">
           <div class="card menu-item-unique mb-4">
               <div class="d-flex flex-column">
                   <div class="menu-img-unique" style="background-image: url('{{imageUrl}}');"></div>
                   <div class="card-body-unique">
                       <div class="d-flex justify-content-between">
                           <h5 class="card-title-unique"><strong>{{name}}</strong></h5>
                           <span class="price-unique">&#8377;{{price}}</span>
                       </div>
                       <p class="card-ingredient-unique">{{ingredients}}</p>
                       <p class="para-unique">{{Offer}}% OFF FOR {{AbovePrice}}</p>
                       <a href="readMore?id={{Id}}" class="read-more-unique">Read more...</a>
                   </div>
               </div>
           </div>
       </div>
       {{/each}}
   </script>

   <script>
   function performSearch(mealType) {
       var query;
       var containerId;

       if (mealType === 'Breakfast') {
           query = document.getElementById('searchInputBreakfast').value.trim();
           containerId = 'breakfastItemContainer';
       } else if (mealType === 'Lunch') {
           query = document.getElementById('searchInputLunch').value.trim();
           containerId = 'lunchItemContainer';
       } else if (mealType === 'Dinner') {
                   query = document.getElementById('searchInputDinner').value.trim();
                   containerId = 'dinnerItemContainer';
               } else if (mealType === 'Desserts') {
                           query = document.getElementById('searchInputDesserts').value.trim();
                           containerId = 'dessertsItemContainer';
                       }else if (mealType === 'Wine Card') {
                                   query = document.getElementById('searchInputWine').value.trim();
                                   containerId = 'wineItemContainer';
                               }else if (mealType === 'Drinks') {
                                           query = document.getElementById('searchInputDrinks').value.trim();
                                           containerId = 'drinksItemContainer';
                                       }



       if (query === "") {
           document.getElementById(containerId).innerHTML = '<p>Please enter a search query.</p>';
           return;
       }

       var xhr = new XMLHttpRequest();
       xhr.open('GET', 'searchItem?query=' + encodeURIComponent(query) + '&mealType=' + encodeURIComponent(mealType), true);
       xhr.setRequestHeader('Content-Type', 'application/json');

       xhr.onreadystatechange = function() {
           if (xhr.readyState == 4 && xhr.status == 200) {
               var response = JSON.parse(xhr.responseText);
               var items = response.items || response;
               if (items && items.length > 0) {
                   var source = document.getElementById("menu-item-template").innerHTML;
                   var template = Handlebars.compile(source);
                   var html = template({ items: items });
                   document.getElementById(containerId).innerHTML = html;
               } else {
                   document.getElementById(containerId).innerHTML = '<p>No items found.</p>';
               }
           }
       };

       xhr.send();
   }
   </script>
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