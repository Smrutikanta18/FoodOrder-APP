<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Forms - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
        .form-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }

        .form-card .card-header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }

        .form-card .card-body {
            padding: 20px;
        }

        .form-card .form-group label {
            font-weight: bold;
        }

        .form-card .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .form-card .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-card .btn-custom {
            background-color: red;
            color: white;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 1rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .form-card .btn-custom:hover {
            background-color: darkred;
        }

        .form-card .btn-custom::before {
            content: '>> ';
            margin-right: 5px;
        }

        .form-row-custom {
            margin-bottom: 20px;
        }
    </style>


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
                        <a data-bs-toggle="collapse" href="#table1s">
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
                              <span class="sub-item">Insta Images</span>
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
                    <a href="index1" class="logo">
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
              <h3 class="fw-bold mb-3">Update Item</h3>
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
                  <a href="#">Form</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#"> Update Item </a>
                </li>
              </ul>
            </div>
           <div class="container">
               <h2 class="my-4">Update Item</h2>
               <div class="row">
                   <div class="col-md-12">
                       <div class="card form-card">
                           <div class="card-header">
                               <div class="card-title">Update Item</div>
                           </div>
                           <div class="card-body">
                               <form action="updateMenu" method="post">
                                   <div class="row">
                                       <!-- Hidden ID Field -->
                                       <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">

                                       <!-- Menu Item Name -->
                                       <div class="col-md-6">
                                           <div class="form-group form-row-custom">
                                               <label for="menuName">Menu Item Name</label>
                                               <input
                                                   type="text"
                                                   class="form-control"
                                                   id="menuName"
                                                   name="menuName"
                                                   value="<%= request.getAttribute("name") %>"
                                                   required
                                               />
                                           </div>
                                       </div>

                                       <!-- Price -->
                                       <div class="col-md-6">
                                           <div class="form-group form-row-custom">
                                               <label for="menuPrice">Price (in &#8377)</label>
                                               <input
                                                   type="number"
                                                   class="form-control"
                                                   id="menuPrice"
                                                   name="menuPrice"
                                                   value="<%= request.getAttribute("price") %>"
                                                   required
                                               />
                                           </div>
                                       </div>

                                       <!-- Ingredients -->
                                       <div class="col-md-6">
                                           <div class="form-group form-row-custom">
                                               <label for="menuIngredients">Ingredients</label>
                                               <input
                                                   type="text"
                                                   class="form-control"
                                                   id="menuIngredients"
                                                   name="menuIngredients"
                                                   value="<%= request.getAttribute("ingredients") %>"
                                                   required
                                               />
                                           </div>
                                       </div>

                                       <!-- Image URL -->
                                       <div class="col-md-6">
                                           <div class="form-group form-row-custom">
                                               <label for="menuImageUrl">Image URL</label>
                                               <input
                                                   type="text"
                                                   class="form-control"
                                                   id="menuImageUrl"
                                                   name="menuImageUrl"
                                                   value="<%= request.getAttribute("imageUrl") %>"
                                                   required
                                               />
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                                                                  <div class="form-group form-row-custom">
                                                                                      <label for="menuOffer">Offer (in %)</label>
                                                                                      <input
                                                                                          type="number"
                                                                                          class="form-control"
                                                                                          id="menuOffer"
                                                                                          name="menuOffer"
                                                                                          value="<%= request.getAttribute("offer") %>"
                                                                                          required
                                                                                      />
                                                                                  </div>
                                                                              </div>
                                       <div class="col-md-6">
                                                                                  <div class="form-group form-row-custom">
                                                                                      <label for="menuAbove">For amount</label>
                                                                                      <input
                                                                                          type="number"
                                                                                          class="form-control"
                                                                                          id="menuAbove"
                                                                                          name="menuAbove"
                                                                                          value="<%= request.getAttribute("abovePrice") %>"
                                                                                          required
                                                                                      />
                                                                                  </div>
                                                                              </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-row-custom">
                                                <label for="menuIngredients">Category</label>
                                                   <div class="select-wrap one-third">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                            <select type="text" name="category" class="form-control">
                                                                 <option value="<%= request.getAttribute("category") %>"><%= request.getAttribute("category") %></option>
                                                                 <option value="Breakfast">Breakfast</option>
                                                                 <option value="Lunch">Lunch</option>
                                                                 <option value="Dinner">Dinner</option>
                                                                 <option value="Desserts">Desserts</option>
                                                                 <option value="Wine Card">Wine Card</option>
                                                                 <option value="Drinks">Drinks</option>
                                                            </select>
                                                        </div>
                                                   </div>
                                                </div>

                                       <!-- Submit Button -->
                                       <div class="col-md-12 mt-4">
                                           <button type="submit" class="btn btn-primary">
                                               Update Item
                                           </button>
                                       </div>
                                   </div>
                               </form>
                           </div>
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
    <script src="http://localhost:8080/untitled/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="http://localhost:8080/untitled/assets/js/core/popper.min.js"></script>
    <script src="http://localhost:8080/untitled/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="http://localhost:8080/untitled/assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Google Maps Plugin -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/gmaps/gmaps.js"></script>

    <!-- Sweet Alert -->
    <script src="http://localhost:8080/untitled/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="http://localhost:8080/untitled/assets/js/kaiadmin.min.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="http://localhost:8080/untitled/assets/js/setting-demo2.js"></script>
  </body>
</html>
