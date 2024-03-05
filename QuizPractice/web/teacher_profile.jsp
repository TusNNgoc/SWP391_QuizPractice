<%-- 
    Document   : teacher_profile
    Created on : Feb 26, 2024, 3:00:51 AM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Azzara Bootstrap 4 Admin Dashboard</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/icon.ico" type="image/x-icon" />
        <%@ page import="entity.Users" %>
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Open+Sans:300,400,600,700"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['assets/css/fonts.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/azzara.min.css">
        <link rel="stylesheet" href="assets/css/azzara.css">

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css">
    </head>

    <body>

        <%
    Users user = (Users) session.getAttribute("user");
        %>
        <div class="wrapper">
            <!--
                    Tip 1: You can change the background color of the main header using: data-background-color="blue | purple | light-blue | green | orange | red"
            -->
            <div class="main-header" data-background-color="purple">
                <!-- Logo Header -->
                <div class="logo-header">

                    <a href="teacherhome.jsp" class="logo">
                        <!-- <img src="assets/img/logoazzara.svg" alt="navbar brand" class="navbar-brand"> -->
                    </a>
                    <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse"
                            data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i class="fa fa-bars"></i>
                        </span>
                    </button>
                    <button class="topbar-toggler more"><i class="fa fa-ellipsis-v"></i></button>
                    <div class="navbar-minimize">
                        <button class="btn btn-minimize btn-rounded">
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->

                <!-- Navbar Header -->
                <nav class="navbar navbar-header navbar-expand-lg">

                    <div class="container-fluid">

                        <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                            <li class="nav-item toggle-nav-search hidden-caret">
                                <a class="nav-link" data-toggle="collapse" href="#search-nav" role="button"
                                   aria-expanded="false" aria-controls="search-nav">
                                    <i class="fa fa-search"></i>
                                </a>
                            </li>



                            <li class="nav-item dropdown hidden-caret">
                                <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"
                                   aria-expanded="false">
                                    <div class="avatar-sm">
                                        <img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-user animated fadeIn">
                                    <li>
                                        <div class="user-box">
                                            <div class="avatar-lg"><img src="assets/img/profile.jpg" alt="image profile"
                                                                        class="avatar-img rounded"></div>
                                            <div class="u-text">
                                                <h4>Hizrian</h4>
                                                <p class="text-muted">hello@sexample.com</p><a href="teacher_profile.jsp"
                                                                                               class="btn btn-rounded btn-danger btn-sm">View Profile</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                        <!-- <a class="dropdown-item" href="#">My Profile</a>
                                        <a class="dropdown-item" href="#">My Balance</a>
                                        <a class="dropdown-item" href="#">Inbox</a>
                                        <div class="dropdown-divider"></div> -->
                                        <!-- <a class="dropdown-item" href="#">Account Setting</a>
                                        <div class="dropdown-divider"></div> -->
                                        <a class="dropdown-item" href="#">Logout</a>
                                    </li>


                                </ul>
                            </li>
                            <li class="nav-item">
                                <p class="intro-text"> Xin chào <%= user.getFullname() %></p>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- End Navbar -->
            </div>

            <!-- Sidebar -->
            <div class="sidebar">

                <div class="sidebar-background"></div>
                <div class="sidebar-wrapper scrollbar-inner">
                    <div class="sidebar-content">
                        <div class="user">
                            <div class="avatar-sm float-left mr-2">
                                <img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                            </div>
                            <div class="info">
                                <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                                    <span>
                                         
                                        <%= user.getFullname() %>
                                  
                                        <span class="user-level">Teacher</span>
                                        <span class="caret"></span>
                                    </span>
                                </a>
                                <div class="clearfix"></div>

                                <div class="collapse in" id="collapseExample">
                                    <ul class="nav">
                                        <li>
                                            <a href="#profile">
                                                <span class="link-collapse">My Profile</span>
                                            </a>
                                        </li>
                                        <!-- <li>
                                                <a href="#edit">
                                                        <span class="link-collapse">Edit Profile</span>
                                                </a>
                                        </li> -->

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <ul class="nav">
                            <li class="nav-item active">
                                <a href="teacherhome.jsp">
                                    <i class="fas fa-home"></i>
                                    <p>Dashboard</p>
                                    <span class="badge badge-count">5</span>
                                </a>
                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>


                            <!-- <li class="nav-item">
                                    <a data-toggle="collapse" href="#tables">
                                            <i class="fas fa-table"></i>
                                            <p>Tables</p>
                                            <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="tables">
                                            <ul class="nav nav-collapse">
                                                    <li>
                                                            <a href="tables/tables.html">
                                                                    <span class="sub-item">Basic Table</span>
                                                            </a>
                                                    </li>
                                                    <li>
                                                            <a href="tables/datatables.html">
                                                                    <span class="sub-item">Datatables</span>
                                                            </a>
                                                    </li>
                                            </ul>
                                    </div>
                            </li>
                            -->
                            //
                            <li class="nav-item">
                                <a href="charts/charts.html">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                </a>

                            </li>
                            <li class="nav-item">
                                <a href="charts/charts.html">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="charts/charts.html">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                </a>

                            </li>



                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            Notepad++ v8.6.4 regression-fix:

            1. Fix regression that the view cannot be activated by mouse clicking.


            Notepad++ v8.6.3 bug-fixes & new enhancements:

            1. Restore multi-editing option & add "Column To Multi-editing" option on GUI.
            2. Make "copy/cut line while no selection" optional.
            <div class="main-panel">
                <div class="content">
                    <div class="page-inner">
                        <h4 class="page-title">Teacher Profile</h4>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card card-with-nav">
                                    <!-- <div class="card-header">
                                            <div class="row row-nav-line">
                                                    <ul class="nav nav-tabs nav-line nav-color-secondary" role="tablist">
                                                            <li class="nav-item"> <a class="nav-link active show" data-toggle="tab" href="#home" role="tab" aria-selected="true">Timeline</a> </li>
                                                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab" aria-selected="false">Profile</a> </li>
                                                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings" role="tab" aria-selected="false">Settings</a> </li>
                                                    </ul>
                                            </div>
                                    </div> -->
                                    <div class="card-body">
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="form-group form-group-default">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" name="name" placeholder="Name" value="<%= user.getFullname() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-group-default">
                                                    <label>Email</label>
                                                    <input type="email" class="form-control" name="email" placeholder="Name" value="<%= user.getEmail() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-4">
                                                <div class="form-group form-group-default">
                                                    <label>Birth Date</label>
                                                    <input type="text" class="form-control" id="datepicker" name="datepicker" value="<%= user.getDob() %>" placeholder="Birth Date">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group form-group-default">
                                                    <label>Gender</label>
                                                    <select class="form-control" id="gender">
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group form-group-default">
                                                    <label>Phone</label>
                                                    <input type="text" class="form-control" value="<%= user.getPhone() %>" name="phone" placeholder="Phone">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <div class="form-group form-group-default">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control" value="<%= user.getAddress() %>" name="address" placeholder="Address">
                                                </div>
                                            </div>
                                        </div>
                                        <!--									<div class="row mt-3 mb-1">
                                                                                                                        <div class="col-md-12">
                                                                                                                                <div class="form-group form-group-default">
                                                                                                                                        <label>About Me</label>
                                                                                                                                        <textarea class="form-control" name="about" placeholder="About Me" rows="3">A man who hates loneliness</textarea>
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>-->
                                        <div class="text-right mt-3 mb-3">
                                            <button class="btn btn-success">Save</button>
                                            <button class="btn btn-danger">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-profile card-secondary">
                                    <div class="card-header" style="background-image: url('assets/img/blogpost.jpg')">
                                        <div class="profile-picture">
                                            <div class="avatar avatar-xl">
                                                <img src="assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="user-profile text-center">
                                            <div class="name">Hizrian, 19</div>
                                            <div class="job">Frontend Developer</div>
                                            <div class="desc">A man who hates loneliness</div>

                                            <div class="view-profile">
                                                <a href="#" class="btn btn-secondary btn-block">View Full Profile</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row user-stats text-center">
                                            <div class="col">
                                                <div class="number">125</div>
                                                <div class="title">Post</div>
                                            </div>
                                            <div class="col">
                                                <div class="number">25K</div>
                                                <div class="title">Followers</div>
                                            </div>
                                            <div class="col">
                                                <div class="number">134</div>
                                                <div class="title">Following</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>





            <!-- End Custom template -->
        </div>
    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery UI -->
    <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Moment JS -->
    <script src="assets/js/plugin/moment/moment.min.js"></script>

    <!-- Chart JS -->
    <script src="assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- Bootstrap Toggle -->
    <script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
    <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

    <!-- Google Maps Plugin -->
    <script src="assets/js/plugin/gmaps/gmaps.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Azzara JS -->
    <script src="assets/js/ready.min.js"></script>

    <!-- Azzara DEMO methods, don't include it in your project! -->
    <script src="assets/js/setting-demo.js"></script>
    <script src="assets/js/demo.js"></script>
</body>

</html>
</html>
