<%@page import="java.util.List"%>
<%@page import="model.Reservation"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Datatables - Kaiadmin Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="http://localhost:8080/untitled/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/webfont/webfont.min.js"></script>
    <style>
        /* General styles for cards and tables */
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-bottom: 1px solid #ddd;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .card-body {
            padding: 15px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
                .table {
                    display: block; /* Allow scrolling on small screens */
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .table thead {
                    display: none; /* Hide the header on mobile */
                }

                .table tbody tr {
                    display: block; /* Make each row a block */
                    margin-bottom: 10px;
                    border: 1px solid #ddd; /* Add border to rows */
                    padding: 10px; /* Add padding for better touch targets */
                }

                .table tbody td {
                    display: flex;
                    justify-content: space-between;
                    padding: 8px 0;
                }

                .table tbody td::before {
                    content: attr(data-label); /* Use the data-label attribute */
                    font-weight: bold;
                    color: #555; /* Slightly darker for better visibility */
                    flex-basis: 40%; /* Allocate space for label */
                    text-align: left; /* Align label to the left */
                }
            }
    </style>

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

    <!-- CSS Files -->
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="http://localhost:8080/untitled/assets/css/demo.css" />
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
                        <i class="fas fa-map-marker-alt"></i>
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
                            <a href="http://localhost:8080/untitled/project_images.jsp">
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
                            <a href="http://localhost:8080/untitled/admin_logout">
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
                            <a href="#">Reservation Data Tables</a>
                        </li>
                    </ul>
                </div>

                <!-- Reservations Section -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">Reservations</div>
                            </div>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Book Date</th>
                                            <th scope="col">Book Time</th>
                                            <th scope="col">Persons</th>
                                            <th scope="col">status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                                            if (reservations != null && !reservations.isEmpty()) {
                                                for (Reservation reservation : reservations) {
                                        %>
                                        <tr>
                                            <td data-label="Name"><%= reservation.getName() %></td>
                                            <td data-label="Phone"><%= reservation.getPhone() %></td>
                                            <td data-label="Book Date"><%= reservation.getBook_date() %></td>
                                            <td data-label="Book Time"><%= reservation.getBook_time() %></td>
                                            <td data-label="Persons"><%= reservation.getPersons() %></td>
                                            <td>

                                            <% if("success".equals(reservation.getStatus())) { %>
                                            <button class="status-btn" style="background-color: green; color: black; border: none; border-radius: 5px; cursor: pointer;" disabled>
                                                 Completed
                                            </button>
                                            <%} else if("cancel".equals(reservation.getStatus())) { %>
                                            <button class="status-btn" style="background-color: red; color: black; border: none; border-radius: 5px; cursor: pointer;" disabled>
                                                 Canceled
                                            </button>
                                            <%}else{%>
                                             <button class="status-btn" id="statusBtn-<%= reservation.getId()%>" style="background-color: red; border: none; border-radius: 5px; cursor: pointer;" onclick="updateOrderStatus(<%= reservation.getId()%>)">
                                                 Order
                                             </button>
                                            <% }%>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="6">No data available</td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
    <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="../assets/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="../assets/js/setting-demo2.js"></script>
    <script>
               function updateOrderStatus(id) {
                   console.log("Order ID to update:", id);
                   const xhr = new XMLHttpRequest();
                   xhr.open("POST", "<%= request.getContextPath() %>/statusupdate", true);
                   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                   xhr.onreadystatechange = function() {
                       if (xhr.readyState === 4) {
                           if (xhr.status === 200) {
                           console.log(id);
                               const statusBtn = document.getElementById('statusBtn-'+id);
                               statusBtn.style.setProperty("background-color", "green", "important");
                               statusBtn.textContent = "Completed";
                           } else {
                               console.error("Error updating order status:", xhr.statusText);
                           }
                       }
                   };
                    xhr.send("id=" + encodeURIComponent(id) );
               }
           </script>
    <script>
      $(document).ready(function () {
        $("#basic-datatables").DataTable({});

        $("#multi-filter-select").DataTable({
          pageLength: 5,
          initComplete: function () {
            this.api()
              .columns()
              .every(function () {
                var column = this;
                var select = $(
                  '<select class="form-select"><option value=""></option></select>'
                )
                  .appendTo($(column.footer()).empty())
                  .on("change", function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                    column
                      .search(val ? "^" + val + "$" : "", true, false)
                      .draw();
                  });

                column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                    select.append(
                      '<option value="' + d + '">' + d + "</option>"
                    );
                  });
              });
          },
        });

        // Add Row
        $("#add-row").DataTable({
          pageLength: 5,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
          $("#add-row")
            .dataTable()
            .fnAddData([
              $("#addName").val(),
              $("#addPosition").val(),
              $("#addOffice").val(),
              action,
            ]);
          $("#addRowModal").modal("hide");
        });
      });
    </script>
  </body>
</html>
