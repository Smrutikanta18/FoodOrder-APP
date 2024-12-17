<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UsersData" %>
<%@ page import="model.Subscriber" %>
<%@ page import="model.Contact" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Tables - Kaiadmin Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="http://localhost:8080/untitled/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />
    <style>
    .pagination-controls {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #addressDetails {
            font-size: 14px;
        }
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
    </style>

    <!-- Fonts and icons -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["http://localhost:8080/untitled/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>
     <style>
      /* Responsive Container */
      .responsive-order-container {
          padding: 20px;
          background-color: #f9f9f9;
      }

      /* Table Wrapper for responsiveness */
      .table-responsive-wrapper {
          overflow-x: auto; /* Enables horizontal scrolling on overflow */
          margin-bottom: 20px;
      }

      /* Table */
      .custom-order-table {
          width: 100%; /* Set table width to 100% */
          border-collapse: collapse;
          table-layout: auto; /* Ensures columns adjust to content */
      }

      .custom-order-table th, .custom-order-table td {
          padding: 12px;
          text-align: left;
          min-width: 100px; /* Ensures columns don't shrink too much */
      }

      .custom-order-table th {
          background-color: #e8e8e8;
          font-weight: bold;
      }

      .custom-order-table td {
          border-bottom: 1px solid #ddd;
      }

      /* Item Column */
      .item-column {
          display: flex;
          align-items: center;
      }

      .order-item-image {
          width: 50px;
          height: 50px;
          object-fit: cover;
          margin-right: 10px;
      }

      .item-name {
          font-size: 16px;
          font-weight: 600;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          overflow: hidden;
          -webkit-line-clamp: 2; /* Limit text to 2 lines */
          max-height: 2.4em;
          line-height: 1.2em;
      }

      /* Button Styling */
      .address-btn, .status-btn {
          border: none;
          cursor: pointer;
          border-radius: 5px;
          padding: 5px 10px;
      }

      .address-btn {
          background-color: #007bff;
          color: white;
      }

      .status-btn {
          background-color: red;
          color: white;
      }

      .status-btn[disabled] {
          cursor: not-allowed;
          opacity: 0.6;
      }

      /* Media Queries */
      @media (max-width: 768px) {
          .custom-order-table {
              font-size: 14px;
          }

          .custom-order-table th, .custom-order-table td {
              padding: 10px;
          }

          .order-item-image {
              width: 40px;
              height: 40px;
          }

          .status-btn, .address-btn {
              font-size: 12px;
              padding: 4px 8px;
          }
      }

      @media (max-width: 576px) {
          .custom-order-table th, .custom-order-table td {
              display: block;
              width: 100%;
          }

          .custom-order-table th {
              text-align: left;
          }

          .item-column {
              flex-direction: column;
              align-items: flex-start;
          }

          .order-item-image {
              width: 35px;
              height: 35px;
          }
      }

                </style>
    <!-- CSS Files -->
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/kaiadmin.min.css" />

   </head>
  <body>
    <div class="wrapper">
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
              <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                  <a href="http://localhost:8080/untitled/index1" class="logo">
                    <img
                      src="http://localhost:8080/untitled/assets/img/kaiadmin/logo_light.svg"
                      alt="navbar brand"
                      class="navbar-brand"
                      height="20"
                    />
                  </a>
                  <div class="nav-toggle">
                    <button class="btn btn-toggle toggle-sidebar">
                      <i class="gg-menu-right"></i>
                    </button>
                    <button class="btn btn-toggle sidenav-toggler">
                      <i class="gg-menu-left"></i>
                    </button>
                  </div>
                  <button class="topbar-toggler more">
                    <i class="gg-more-vertical-alt"></i>
                  </button>
                </div>
                <!-- End Logo Header -->
              </div>
              <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                  <ul class="nav nav-secondary">
                    <li class="nav-item active">
                      <a
                        data-bs-toggle="collapse"
                        href="admin_index"
                        class="collapsed"
                        aria-expanded="false"
                      >
                        <i class="fas fa-home"></i>
                        <p>Dashboard</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="dashboard">
                        <ul class="nav nav-collapse">
                          <li>
                            <a href="http://localhost:8080/untitled/index1">
                              <span class="sub-item">Dashboard 1</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-section">
                      <span class="sidebar-mini-icon">
                        <i class="fa fa-ellipsis-h"></i>
                      </span>
                      <h4 class="text-section">Components</h4>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#tables1">
                            <i class="fas fa-plus"></i>
                            <p>Add Data</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="tables1">
                            <ul class="nav nav-collapse">
                            <li>
                                <a href="http://localhost:8080/untitled/sales.jsp">
                                    <span class="sub-item">Add sales amount</span>
                                </a>
                            </li>
                                <li>
                                    <a href="http://localhost:8080/untitled/dataNumber">
                                        <span class="sub-item">Experience Data</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://localhost:8080/untitled/chefData">
                                        <span class="sub-item">Chef</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="collapse" href="#sidebarLayouts">
                        <i class="fas fa-th-list"></i>
                        <p>Profile</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="sidebarLayouts">
                        <ul class="nav nav-collapse">
                        <li>
                                               <a href="http://localhost:8080/untitled/profile">
                                                  <span class="sub-item">Profile</span>
                                                </a>
                                            </li>
                          <li>
                            <a href="http://localhost:8080/untitled/icon-menu.jsp">
                              <span class="sub-item">Change Password</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="collapse" href="#forms">
                        <i class="fas fa-pen-square"></i>
                        <p>Menu Item</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="forms">
                        <ul class="nav nav-collapse">
                          <li>
                            <a href="http://localhost:8080/untitled/forms/forms.jsp">
                              <span class="sub-item">Add Menu Item</span>
                            </a>
                          </li>
                          <li>
                            <a href="http://localhost:8080/untitled/forms/addMenuItem.jsp">
                               <span class="sub-item">show Menu Item</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="collapse" href="#tables">
                        <i class="fas fa-table"></i>
                        <p>Order & Reservations</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="tables">
                        <ul class="nav nav-collapse">
                          <li>
                            <a href="http://localhost:8080/untitled/adminorder">
                              <span class="sub-item">Orders</span>
                            </a>
                          </li>
                          <li>
                            <a href="http://localhost:8080/untitled/tables/datatables">
                              <span class="sub-item">Reservations</span>
                            </a>
                          </li>
                          <li>
                            <a href="http://localhost:8080/untitled/tables/tables">
                              <span class="sub-item">User Data</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="collapse" href="#maps">
                        <i class="fas fa-image"></i>
                        <p>Images</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="maps">
                        <ul class="nav nav-collapse">
                          <li>
                            <a href="http://localhost:8080/untitled/bannerImages">
                              <span class="sub-item">Banner Images</span>
                            </a>
                          </li>
                          <li>
                            <a href="http://localhost:8080/untitled/instagram">
                              <span class="sub-item">Images</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="collapse" href="#submenu">
                        <i class="fas fa-bars"></i>
                        <p>Logout</p>
                        <span class="caret"></span>
                      </a>
                      <div class="collapse" id="submenu">
                        <ul class="nav nav-collapse">
                          <li>
                            <a href="admin_logout">
                              <span class="sub-item">logout</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
              <div class="main-header">
                <div class="main-header-logo">
                  <!-- Logo Header -->
                  <div class="logo-header" data-background-color="dark">
                    <a href="http://localhost:8080/untitled/index1" class="logo">
                      <img
                        src="http://localhost:8080/untitled/assets/img/kaiadmin/logo_light.svg"
                        alt="navbar brand"
                        class="navbar-brand"
                        height="20"
                      />
                    </a>
                    <div class="nav-toggle">
                      <button class="btn btn-toggle toggle-sidebar">
                        <i class="gg-menu-right"></i>
                      </button>
                      <button class="btn btn-toggle sidenav-toggler">
                        <i class="gg-menu-left"></i>
                      </button>
                    </div>
                    <button class="topbar-toggler more">
                      <i class="gg-more-vertical-alt"></i>
                    </button>
                  </div>
                  <!-- End Logo Header -->
                </div>
                <!-- Navbar Header -->

                <!-- End Navbar -->
              </div>
        <div class="container">
          <div class="page-inner">
            <div class="page-header">
              <h3 class="fw-bold mb-3">Tables</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="#">
                    <i class="icon-home"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">Tables</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#"> User Data Tables </a>
                </li>
              </ul>
            </div>

        </div>

 <div class="responsive-order-container">
     <h2>Order List</h2>
     <div class="table-responsive-wrapper">
         <table class="table table-bordered custom-order-table">
             <thead>
                 <tr>
                     <th>User ID</th>
                     <th>Item</th>
                     <th>Quantity</th>
                     <th>Price</th>
                     <th>Date</th>
                     <th>Address</th>
                     <th>Status</th>
                     <th>Actions</th>
                 </tr>
             </thead>
             <tbody>
                 <!-- Iterate over the orderItemList -->
                 <c:forEach var="orderItem" items="${orderItemList}">
                     <tr>
                         <td>${orderItem.userId}</td>
                         <td class="item-column">
                             <img class="order-item-image" src="${orderItem.imageUrl}" alt="${orderItem.name}">
                             <span class="item-name">${orderItem.name}</span>
                         </td>
                         <td>${orderItem.quantity}</td>
                         <td>&#8377;${orderItem.price}</td>
                         <td><fmt:formatDate value="${orderItem.date}" pattern="dd/MM/yyyy" /></td>
                         <td><i class="fa fa-eye" onclick="showAddress(${orderItem.address})" style="cursor: pointer;"></i></td>
                         <td>
                             <c:choose>
                                 <c:when test="${orderItem.status == 'success'}">
                                     <button class="status-btn" style="background-color: green; color: black;" disabled>On the way</button>
                                 </c:when>
                                 <c:when test="${orderItem.status == 'cancle'}">
                                     <button class="status-btn" style="background-color: red; color: black;" disabled>Canceled</button>
                                 </c:when>
                                 <c:when test="${orderItem.status == 'paid'}">
                                     <button class="status-btn" style="background-color: green; color: black;" disabled>Delivered</button>
                                 </c:when>
                                 <c:otherwise>
                                     <button class="status-btn" id="statusBtn-${orderItem.orderItemId}-${orderItem.userEmail}"
                                             style="background-color: red; color: black;"
                                             onclick="updateOrderStatus(${orderItem.orderItemId}, '${orderItem.userEmail}')">
                                         Order
                                     </button>
                                 </c:otherwise>
                             </c:choose>
                         </td>

                         <td>
                             <c:choose>
                                 <c:when test="${orderItem.status == 'paid'}">
                                     <button class="status-btn" style="background-color: green; color: black;" disabled>Paid</button>
                                 </c:when>
                                 <c:when test="${orderItem.status == 'cancle'}">
                                     <button class="status-btn" style="background-color: red; color: black;" disabled>Canceled</button>
                                 </c:when>
                                 <c:otherwise>
                                     <button class="status-btn" id="paidBtn-${orderItem.orderItemId}-${orderItem.userEmail}"
                                             style="background-color: red; color: black;"
                                             onclick="updateOrderPaid(${orderItem.orderItemId}, '${orderItem.userEmail}')">
                                         Unpaid
                                     </button>
                                 </c:otherwise>
                             </c:choose>
                         </td>
                     </tr>
                 </c:forEach>
             </tbody>
         </table>
     </div>

     <!-- Pagination Links -->
     <div class="pagination-controls">
         <%
             int totalOrders = (int) request.getAttribute("total");
             int itemsPerPage = (int) request.getAttribute("end");
             int totalPages = (int) Math.ceil((double) totalOrders / itemsPerPage);
             int currentPage = (int) request.getAttribute("pgno");

             // Previous Button
             if (currentPage > 0) {
         %>
             <a href="adminorder?pgno=<%= currentPage - 1 %>" class="pagination-link prev-link" style="font-size:10px;">Back</a>
         <% } else { %>
             <button disabled>Previous</button>
         <% } %>

         <!-- Page Numbers -->
         <% for (int i = 0; i < totalPages; i++) { %>
             <a href="adminorder?pgno=<%= i %>" class="pagination-link <%= (i == currentPage) ? "active" : "" %>"><%= i + 1 %></a>
         <% } %>

         <!-- Next Button -->
         <% if (currentPage < totalPages - 1) { %>
             <a href="adminorder?pgno=<%= currentPage + 1 %>" class="pagination-link prev-link" style="font-size:10px;">Next</a>
         <% } else { %>
             <button disabled>Next</button>
         <% } %>
     </div>
 </div>
 <div id="addressModal" class="modal">
     <div class="modal-content">
         <span class="close" onclick="closeModal()">&times;</span>
         <div id="addressDetails"></div>
     </div>
 </div>

      </div>

        <footer class="footer">
          <div class="container-fluid d-flex justify-content-between">
            <nav class="pull-left">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="http://www.themekita.com">
                    ThemeKita
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Help </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Licenses </a>
                </li>
              </ul>
            </nav>
            <div class="copyright">
              2024, made with <i class="fa fa-heart heart text-danger"></i> by
              <a href="http://www.themekita.com">ThemeKita</a>
            </div>
            <div>
              Distributed by
              <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
            </div>
          </div>
        </footer>
      </div>

      <!-- Custom template | don't include it in your project! -->
      <div class="custom-template">
        <div class="title">Settings</div>
        <div class="custom-content">
          <div class="switcher">
            <div class="switch-block">
              <h4>Logo Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="selected changeLogoHeaderColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="selected changeLogoHeaderColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Navbar Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="selected changeTopBarColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Sidebar</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="selected changeSideBarColor"
                  data-color="white"
                ></button>
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="dark2"
                ></button>
              </div>
            </div>
          </div>
        </div>
        <div class="custom-toggle">
          <i class="icon-settings"></i>
        </div>
      </div>
      <!-- End Custom template -->
    </div>
    <!--   Core JS Files   -->
    <script src="http://localhost:8080/untitled/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="http://localhost:8080/untitled/assets/js/core/popper.min.js"></script>
    <script src="http://localhost:8080/untitled/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="http://localhost:8080/untitled/assets/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="http://localhost:8080/untitled/assets/js/setting-demo2.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
          function fetchOrderStatuses() {
              const xhr = new XMLHttpRequest();
              xhr.open("GET", "adminorder?action=fetchStatuses", true);
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

                          statusList.forEach(function(order) {
                              const orderId = order.oid;
                              const userEmail = order.uemail;
                              const status = order.status;
                              const button = document.getElementById('statusBtn-' + orderId + '-' + userEmail);

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
                             buttonText = "Order";
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
          document.addEventListener("DOMContentLoaded", fetchOrderStatuses);
  </script>
    <script>
         function fetchOrderStatuses() {
             const xhr = new XMLHttpRequest();
             xhr.open("GET", "adminorder?action=fetchStatuses", true);
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

                         statusList.forEach(function(order) {
                             const orderId = order.oid;
                             const userEmail = order.uemail;
                             const status = order.status;
                             const button = document.getElementById('paidBtn-' + orderId + '-' + userEmail);


                             if (!button) return; // Ensure the button exists

                             let buttonText, buttonColor, disabled;

                         if (status === "success") {
                             buttonText = "Unpaid";
                             buttonColor = "red";
                             disabled = false;
                         } else if (status === "paid") {
                             buttonText = "Paid";
                             buttonColor = "green";
                             disabled = true;
                         } else if (status === "cancle") { // Check spelling
                             buttonText = "Canceled";
                             buttonColor = "red";
                             disabled = true;
                         } else if (status === "pending") {
                             buttonText = "Unpaid";
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
         document.addEventListener("DOMContentLoaded", fetchOrderStatuses);
 </script>

    <script>
                   function updateOrderStatus(orderItemId,userEmail) {
                       console.log("Order ID to update:", orderItemId);
                       const xhr = new XMLHttpRequest();
                       xhr.open("POST", "successservlet", true);
                       xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                       xhr.onreadystatechange = function() {
                           if (xhr.readyState === 4) {
                               if (xhr.status === 200) {
                               console.log(orderItemId);
                                   const statusBtn = document.getElementById('statusBtn-'+orderItemId+'-'+userEmail);
                                   statusBtn.style.setProperty("background-color", "green", "important");
                                   statusBtn.textContent = "On the way";
                                   statusBtn.disabled = true;
                               } else {
                                   console.error("Error updating order status:", xhr.statusText);
                               }
                           }
                       };
                        xhr.send("orderId=" + encodeURIComponent(orderItemId) + "&userEmail=" + encodeURIComponent(userEmail));
                   }
               </script>
<script>
                   function updateOrderPaid(orderItemId,userEmail) {
                       console.log("Order ID to update:", orderItemId);
                       const xhr = new XMLHttpRequest();
                       xhr.open("POST", "paid", true);
                       xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                       xhr.onreadystatechange = function() {
                           if (xhr.readyState === 4) {
                               if (xhr.status === 200) {
                               console.log(orderItemId);
                                   const paidBtn = document.getElementById('paidBtn-'+orderItemId+'-'+userEmail);
                                   paidBtn.style.setProperty("background-color", "green", "important");
                                   paidBtn.textContent = "Paid";
                                   paidBtn.disabled = true;
                                   const statusBtn = document.getElementById('statusBtn-'+orderItemId+'-'+userEmail);
                                   statusBtn.style.setProperty("background-color", "green", "important");
                                   statusBtn.textContent = "Delivered";
                                   statusBtn.disabled = true;
                               } else {
                                   console.error("Error updating order status:", xhr.statusText);
                               }
                           }
                       };
                        xhr.send("orderId=" + encodeURIComponent(orderItemId) + "&userEmail=" + encodeURIComponent(userEmail));
                   }
               </script>
    <script>
      $("#displayNotif").on("click", function () {
        var placementFrom = $("#notify_placement_from option:selected").val();
        var placementAlign = $("#notify_placement_align option:selected").val();
        var state = $("#notify_state option:selected").val();
        var style = $("#notify_style option:selected").val();
        var content = {};

        content.message =
          'Turning standard Bootstrap alerts into "notify" like notifications';
        content.title = "Bootstrap notify";
        if (style == "withicon") {
          content.icon = "fa fa-bell";
        } else {
          content.icon = "none";
        }
        content.url = "index.html";
        content.target = "_blank";

        $.notify(content, {
          type: state,
          placement: {
            from: placementFrom,
            align: placementAlign,
          },
          time: 1000,
        });
      });
    </script>
    <script id="address-template" type="text/x-handlebars-template">
        <p><strong>Full Name:</strong> {{firstName}} {{lastName}}</p>
        <p><strong>Address:</strong> {{street}}, {{area}}, {{city}}, {{state}}, {{country}}, {{pinNo}}</p>
        <p><strong>Phone:</strong> {{phone}}</p>
        <p><strong>Email:</strong> {{email}}</p>
    </script>
    <script>
        function showAddress(addressId) {
            const xhr = new XMLHttpRequest();
            const encodedAddressId = encodeURIComponent(addressId);
            xhr.open("GET", "showAddress?id=" + encodedAddressId, true);
            console.log("Address ID:", addressId);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        try {
                            const address = JSON.parse(xhr.responseText);
                            console.log("Parsed Address:", address);

                            if (address && address.firstName) {
                                // Get the Handlebars template
                                const source = document.getElementById("address-template").innerHTML;

                                // Compile the Handlebars template
                                const template = Handlebars.compile(source);

                                // Generate the HTML by passing the address data to the compiled template
                                const html = template(address);

                                // Insert the generated HTML into the addressDetails div
                                document.getElementById("addressDetails").innerHTML = html;

                                // Display the modal
                                document.getElementById("addressModal").style.display = "block";
                            } else {
                                console.error("Invalid address data:", address);
                            }
                        } catch (error) {
                            console.error("Error parsing JSON response:", error);
                        }
                    } else {
                        console.error("Request failed. Status:", xhr.status);
                    }
                }
            };
            xhr.send();
        }

        function closeModal() {
            document.getElementById("addressModal").style.display = "none";
        }

        window.onclick = function(event) {
            const modal = document.getElementById("addressModal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.min.js"></script>

  </body>
</html>
