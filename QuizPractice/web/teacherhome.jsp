<%-- 
    Document   : index
    Created on : Feb 25, 2024, 8:30:02 PM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Users" %>
<%@ page import="entity.Courses" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Azzara Bootstrap 4 Admin Dashboard</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/icon.ico" type="image/x-icon" />

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


    </head>

    <body>

        <%
//Users user = (Users) session.getAttribute("user");
//List<Courses> courses = (List<Courses>) session.getAttribute("courses");
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
                                                <h4>${ user.getFullname()}></h4>
                                                <p class="text-muted">${ user.getEmail()}></p><a href="teacher_profile.jsp"
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
                                <p class="intro-text"> Xin chào ${ user.getFullname() }</p>
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
                                        ${ user.getFullname() }
                                        <span class="user-level">Teacher</span>
                                        <span class="caret"></span>
                                    </span>
                                </a>
                                <div class="clearfix"></div>

                                <div class="collapse in" id="collapseExample">
                                    <ul class="nav">
                                        <li>
                                            <a href="teacher_profile.jsp">
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

            <div class="main-panel">
                <div class="content">
                    <div class="page-inner">
                        <div class="page-header">
                            <h4 class="page-title">Dashboard</h4>
                            <div class="btn-group btn-group-page-header ml-auto">
                                <button type="button" class="btn btn-light btn-round btn-page-header-dropdown dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-ellipsis-h"></i>

                                </button>

                                <div class="dropdown-menu">
                                    <div class="arrow"></div>

                                    <c:forEach items="${courses}" var="course">

                                        <a class="dropdown-item" href="CourseDetailsServlet?course=${course}">${course.name}</a>

                                    </c:forEach>
<!--                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>-->
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-4 col-md-4">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-info bubble-shadow-small">
                                                    <i class="far fa-newspaper"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ml-3 ml-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Course</p>
                                                    <h4 class="card-title"></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-success bubble-shadow-small">
                                                    <i class="far fa-chart-bar"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ml-3 ml-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Total Students</p>
                                                    <h4 class="card-title">$ 1,345</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-secondary bubble-shadow-small">
                                                    <i class="far fa-check-circle"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ml-3 ml-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Total Quizs</p>
                                                    <h4 class="card-title">576</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-head-row">
                                            <div class="card-title">User Statistics</div>
                                            <div class="card-tools">
                                                <a href="#" class="btn btn-info btn-border btn-round btn-sm mr-2">
                                                    <span class="btn-label">
                                                        <i class="fa fa-pencil"></i>
                                                    </span>
                                                    Export
                                                </a>
                                                <a href="#" class="btn btn-info btn-border btn-round btn-sm">
                                                    <span class="btn-label">
                                                        <i class="fa fa-print"></i>
                                                    </span>
                                                    Print
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container" style="min-height: 375px">
                                            <canvas id="statisticsChart"></canvas>
                                        </div>
                                        <div id="myChartLegend"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-secondary">
                                    <div class="card-header">
                                        <div class="card-title">Daily Sales</div>
                                        <div class="card-category">March 25 - April 02</div>
                                    </div>
                                    <div class="card-body pb-0">
                                        <div class="mb-4 mt-2">
                                            <h1>$4,578.58</h1>
                                        </div>
                                        <div class="pull-in">
                                            <canvas id="dailySalesChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-info bg-info-gradient">
                                    <div class="card-body">
                                        <h4 class="mb-1 fw-bold">Tasks Progress</h4>
                                        <div id="task-complete" class="chart-circle mt-4 mb-3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-card-no-pd">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-head-row">
                                            <h4 class="card-title">Users Geolocation</h4>
                                            <div class="card-tools">
                                                <button class="btn btn-icon btn-link btn-primary btn-xs"><span
                                                        class="fa fa-angle-down"></span></button>
                                                <button
                                                    class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card"><span
                                                        class="fa fa-sync-alt"></span></button>
                                                <button class="btn btn-icon btn-link btn-primary btn-xs"><span
                                                        class="fa fa-times"></span></button>
                                            </div>
                                        </div>
                                        <p class="card-category">
                                            Map of the distribution of users around the world</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="table-responsive table-hover table-sales">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/id.png"
                                                                             alt="indonesia">
                                                                    </div>
                                                                </td>
                                                                <td>Indonesia</td>
                                                                <td class="text-right">
                                                                    2.320
                                                                </td>
                                                                <td class="text-right">
                                                                    42.18%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/us.png"
                                                                             alt="united states">
                                                                    </div>
                                                                </td>
                                                                <td>USA</td>
                                                                <td class="text-right">
                                                                    240
                                                                </td>
                                                                <td class="text-right">
                                                                    4.36%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/au.png"
                                                                             alt="australia">
                                                                    </div>
                                                                </td>
                                                                <td>Australia</td>
                                                                <td class="text-right">
                                                                    119
                                                                </td>
                                                                <td class="text-right">
                                                                    2.16%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/ru.png" alt="russia">
                                                                    </div>
                                                                </td>
                                                                <td>Russia</td>
                                                                <td class="text-right">
                                                                    1.081
                                                                </td>
                                                                <td class="text-right">
                                                                    19.65%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/cn.png" alt="china">
                                                                    </div>
                                                                </td>
                                                                <td>China</td>
                                                                <td class="text-right">
                                                                    1.100
                                                                </td>
                                                                <td class="text-right">
                                                                    20%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/br.png" alt="brazil">
                                                                    </div>
                                                                </td>
                                                                <td>Brasil</td>
                                                                <td class="text-right">
                                                                    640
                                                                </td>
                                                                <td class="text-right">
                                                                    11.63%
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mapcontainer">
                                                    <div id="map-example" class="vmap"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>        <div class="col-md-4">
                                <div class="card card-secondary">
                                    <div class="card-header">
                                        <div class="card-title">Daily Sales</div>
                                        <div class="card-category">March 25 - April 02</div>
                                    </div>
                                    <div class="card-body pb-0">
                                        <div class="mb-4 mt-2">
                                            <h1>$4,578.58</h1>
                                        </div>
                                        <div class="pull-in">
                                            <canvas id="dailySalesChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-info bg-info-gradient">
                                    <div class="card-body">
                                        <h4 class="mb-1 fw-bold">Tasks Progress</h4>
                                        <div id="task-complete" class="chart-circle mt-4 mb-3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-card-no-pd">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-head-row">
                                            <h4 class="card-title">Users Geolocation</h4>
                                            <div class="card-tools">
                                                <button class="btn btn-icon btn-link btn-primary btn-xs"><span
                                                        class="fa fa-angle-down"></span></button>
                                                <button
                                                    class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card"><span
                                                        class="fa fa-sync-alt"></span></button>
                                                <button class="btn btn-icon btn-link btn-primary btn-xs"><span
                                                        class="fa fa-times"></span></button>
                                            </div>
                                        </div>
                                        <p class="card-category">
                                            Map of the distribution of users around the world</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="table-responsive table-hover table-sales">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/id.png"
                                                                             alt="indonesia">
                                                                    </div>
                                                                </td>
                                                                <td>Indonesia</td>
                                                                <td class="text-right">
                                                                    2.320
                                                                </td>
                                                                <td class="text-right">
                                                                    42.18%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/us.png"
                                                                             alt="united states">
                                                                    </div>
                                                                </td>
                                                                <td>USA</td>
                                                                <td class="text-right">
                                                                    240
                                                                </td>
                                                                <td class="text-right">
                                                                    4.36%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/au.png"
                                                                             alt="australia">
                                                                    </div>
                                                                </td>
                                                                <td>Australia</td>
                                                                <td class="text-right">
                                                                    119
                                                                </td>
                                                                <td class="text-right">
                                                                    2.16%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/ru.png" alt="russia">
                                                                    </div>
                                                                </td>
                                                                <td>Russia</td>
                                                                <td class="text-right">
                                                                    1.081
                                                                </td>
                                                                <td class="text-right">
                                                                    19.65%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/cn.png" alt="china">
                                                                    </div>
                                                                </td>
                                                                <td>China</td>
                                                                <td class="text-right">
                                                                    1.100
                                                                </td>
                                                                <td class="text-right">
                                                                    20%
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="flag">
                                                                        <img src="assets/img/flags/br.png" alt="brazil">
                                                                    </div>
                                                                </td>
                                                                <td>Brasil</td>
                                                                <td class="text-right">
                                                                    640
                                                                </td>
                                                                <td class="text-right">
                                                                    11.63%
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mapcontainer">
                                                    <div id="map-example" class="vmap"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </d
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Top Products</div>
                                    </div>
                                    <div class="card-body pb-0">
                                        <div class="d-flex">
                                            <div class="avatar">
                                                <img src="assets/img/logoproduct.svg" alt="..."
                                                     class="avatar-img rounded-circle">
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h5 class="fw-bold mb-1">CSS</h5>
                                                <small class="text-muted">Cascading Style Sheets</small>
                                            </div>
                                            <div class="d-flex ml-auto align-items-center">
                                                <h3 class="text-info fw-bold">+$17</h3>
                                            </div>
                                        </div>
                                        <div class="separator-dashed"></div>
                                        <div class="d-flex">
                                            <div class="avatar">
                                                <img src="assets/img/logoproduct2.svg" alt="..."
                                                     class="avatar-img rounded-circle">
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h5 class="fw-bold mb-1">J.CO Donuts</h5>
                                                <small class="text-muted">The Best Donuts</small>
                                            </div>
                                            <div class="d-flex ml-auto align-items-center">
                                                <h3 class="text-info fw-bold">+$300</h3>
                                            </div>
                                        </div>
                                        <div class="separator-dashed"></div>
                                        <div class="d-flex">
                                            <div class="avatar">
                                                <img src="assets/img/logoproduct3.svg" alt="..."
                                                     class="avatar-img rounded-circle">
                                            </div>
                                            <div class="flex-1 pt-1 ml-2">
                                                <h5 class="fw-bold mb-1">Ready Pro</h5>
                                                <small class="text-muted">Bootstrap 4 Admin Dashboard</small>
                                            </div>
                                            <div class="d-flex ml-auto align-items-center">
                                                <h3 class="text-info fw-bold">+$350</h3>
                                            </div>
                                        </div>
                                        <div class="separator-dashed"></div>
                                        <div class="pull-in">
                                            <canvas id="topProductsChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title fw-mediumbold">Suggested People</div>
                                        <div class="card-list">
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/jm_denis.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">Jimmy Denis</div>
                                                    <div class="status">Graphic Designer</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/chadengle.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">Chad</div>
                                                    <div class="status">CEO Zeleaf</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/talha.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">Talha</div>
                                                    <div class="status">Front End Designer</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/mlane.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">John Doe</div>
                                                    <div class="status">Back End Developer</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/talha.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">Talha</div>
                                                    <div class="status">Front End Designer</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img src="assets/img/jm_denis.jpg" alt="..."
                                                         class="avatar-img rounded-circle">
                                                </div>
                                                <div class="info-user ml-3">
                                                    <div class="username">Jimmy Denis</div>
                                                    <div class="status">Graphic Designer</div>
                                                </div>
                                                <button class="btn btn-icon btn-primary btn-round btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-primary bg-primary-gradient bubble-shadow">
                                    <div class="card-body">
                                        <h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">Active user right now</h4>
                                        <h1 class="mb-4 fw-bold">17</h1>
                                        <h4 class="mt-3 b-b1 pb-2 mb-5 fw-bold">Page view per minutes</h4>
                                        <div id="activeUsersChart"></div>
                                        <h4 class="mt-5 pb-3 mb-0 fw-bold">Top active pages</h4>
                                        <ul class="list-unstyled">
                                            <li class="d-flex justify-content-between pb-1 pt-1">
                                                <small>/product/readypro/teacherhome.jsp</small> <span>7</span></li>
                                            <li class="d-flex justify-content-between pb-1 pt-1">
                                                <small>/product/azzara/demo.html</small> <span>10</span></li>
                                        </ul>
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

<!--    	 jQuery Vector Maps -->
            <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
            <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script><!--
    
             Google Maps Plugin 
            <script src="assets/js/plugin/gmaps/gmaps.js"></script>-->

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Azzara JS -->
    <script src="/assets/js/ready.min.js"></script>


</body>

</html>
</html>
