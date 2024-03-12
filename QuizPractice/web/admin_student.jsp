<%-- 
    Document   : admin_account
    Created on : Mar 3, 2024, 12:37:40 AM
    Author     : anhph
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.UsersDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-........" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/styles.min.css">

    </head>
    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">



            <!--            -------------------------------------------------------------------------->


            <!-------------------------------------------------------------------------------------------->
            <!-- Sidebar Start -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div>
                    <div class="brand-logo d-flex align-items-center justify-content-between">
                        <a href="./admin_home.jsp" class="text-nowrap logo-img">
                            <img src="assets/img/logos/quizlogo.png" width="180" alt="" />
                        </a>
                        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                            <i class="ti ti-x fs-8"></i>
                        </div>
                    </div>
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                        <ul id="sidebarnav">
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Home</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="admin_home.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-layout-dashboard"></i>
                                    </span>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Manager</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-check" width="24"
                                         height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" />
                                    <path d="M6 21v-2a4 4 0 0 1 4 -4h4" />
                                    <path d="M15 19l2 2l4 -4" />
                                    </svg>
                                    <span class="hide-menu">Account</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./ui-alerts" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-zoom-question" width="24"
                                         height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                    <path d="M21 21l-6 -6" />
                                    <path d="M10 13l0 .01" />
                                    <path d="M10 10a1.5 1.5 0 1 0 -1.14 -2.474" />
                                    </svg>
                                    <span class="hide-menu">List Quiz</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./ui-card.html" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-school" width="24"
                                         height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M22 9l-10 -4l-10 4l10 4l10 -4v6" />
                                    <path d="M6 10.6v5.4a6 3 0 0 0 12 0v-5.4" />
                                    </svg>
                                    <span class="hide-menu">Subject</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chart-infographic"
                                         width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M7 7m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
                                    <path d="M7 3v4h4" />
                                    <path d="M9 17l0 4" />
                                    <path d="M17 14l0 7" />
                                    <path d="M13 13l0 8" />
                                    <path d="M21 12l0 9" />
                                    </svg>
                                    <span class="hide-menu">Estadísticas</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-typography"></i>
                                    </span>
                                    <span class="hide-menu">Typography</span>
                                </a>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">AUTH</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./authentication-login.html" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-login"></i>
                                    </span>
                                    <span class="hide-menu">Login</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-user-plus"></i>
                                    </span>
                                    <span class="hide-menu">Register</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-mood-happy"></i>
                                    </span>
                                    <span class="hide-menu">Icons</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-aperture"></i>
                                    </span>
                                    <span class="hide-menu">Sample Page</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <!--  Header Start -->
                <header class="header">
                    <div class="logo">
                    </div>
                    <ul class="navigation">
                        <li><a href="welcome_page.jsp">Home</a></li>
                        <li><a href="About.jsp">About</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </header>
                <!--  Header End -->
                <div>
                    <div class="container-fluid">
                        <div class="card">













                            <!--                            //------------------------------------------------------------------------------------>

                            <div class="wrapper">
                                <div class="content" style="">


                                    <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                                        <div class="search-filter-container">
                                            <form action="search.jsp" method="GET" class="search-form">
                                                <input type="text" name="query" placeholder="Search..." class="search-input">
                                                <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                                            </form>

                                            <select name="filter" class="filter-select">
                                                <option value="all">All</option>
                                                <option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                            </select>
                                        </div>
                                        <h1 style="text-align: center;
                                            font-size: 28px;
                                            margin-bottom: 20px;
                                            color: #333; /* Màu chữ */
                                            text-transform: uppercase; /* Chuyển đổi chữ thành in hoa */
                                            font-weight: bold; /* Chữ đậm */">Account List</h1>                                        <div class="row">
                                            <table class="table table-bordered table-hover table-striped">
                                                <thead class="thead-dark">
                                                    <tr class="text-center col-md-12">
                                                        <th class="col-1">ID</th>
                                                        <th class="col-3">Full Name</th>
                                                        <th class="col-1">Pass</th>
                                                        <th class="col-2">Username</th>
                                                        <th class="col-1">Status</th>
                                                        <th class="col-1">Role</th>
                                                        <th class="col-2">Nation</th>
                                                        <th class="col-1">Address</th>
                                                        <th class="col-2">Gender</th>
                                                        <th class="col-1">Date of birth</th>
                                                        <th class="col-2">Email</th>
                                                        <th class="col-1">Phone</th>
                                                        <th class="col-2">Edit</th>
                                                        <th class="col-1">Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% 
                                                    int i = 1;
                                                    ArrayList<User> allaccounts = UsersDAO.getAccount();
                                                    for(User u : allaccounts) {
                                                        if (u.getRole() == 2) { // Check if the role is equal to 1
                                                    %>
                                                    <tr>
                                                        <td><%=i++%></td>
                                                        <td><%=u.getFullname() %></td>
                                                        <td><%=u.getPassword() %></td>
                                                        <td><%=u.getUsername() %></td>
                                                        <td><%=u.isAccountActived() %></td>
                                                        <td><%=u.getRole() %></td>
                                                        <td><%=u.getCountry() %></td>
                                                        <td><%=u.getAddress() %></td>
                                                        <td><%=u.getGender() %></td>
                                                        <td><%=u.getDob() %></td>
                                                        <td><%=u.getEmail() %></td>
                                                        <td><%=u.getPhone() %></td>
                                                        <td> 
                                                            <a href="update?user_id=<%=u.getUser_id()%>" class="update-btn">
                                                                <i class="fas fa-edit"></i> Update
                                                            </a>
                                                        </td>

                                                        <td>     <a href="delete_account.jsp?user_id=<%=u.getUser_id()%>" class="delete-btn">
                                                                <i class="fas fa-trash-alt"></i> Delete
                                                            </a></td>
                                                    </tr>
                                                    <% 
                                                        }
                                                    }
                                                    %>


                                                </tbody>
                                            </table>

                                        </div>
                                        <div >
                                            <button type="button" class="btn btn-outline-success">
                                                <div><h3> <a href="admin_add.jsp" style="margin-top: 5px;
                                                             margin-right: 20px;
                                                             margin-bottom: 15px;
                                                             margin-left: 10px;">  Add Account  </a></h3></div>
                                            </button>
                                        </div>
                                        <div>

                                        </div>
                                    </div>




                                    <div >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--                                            //------------------------------------------------------------------------------------------------>




                </div>
            </div>
        </div>
    </div>

</body>
<style>
    /* Các đoạn mã CSS khác đã được bỏ qua */

    /* Phần search và filter */
    .search-filter-container {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-form {
        margin-right: 10px;
    }

    .search-input {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .search-button {
        padding: 8px 12px;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .search-button:hover {
        background-color: #0056b3;
    }

    .filter-select {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Header CSS */
    .header {
        background-color: rgb(26, 205, 246); /* Màu nền của header (một lớp mờ đen) */
        color: #fff; /* Màu chữ */
        padding: 20px; /* Khoảng cách từ nội dung đến mép của header */
        text-align: center; /* Căn giữa nội dung header */
        position: relative;
    }

    .logo {
        font-size: 24px; /* Kích thước của logo */
        font-weight: bold; /* Chữ đậm */
    }

    .navigation {
        list-style-type: none; /* Loại bỏ dấu đầu dòng của danh sách */
        margin-top: 20px; /* Khoảng cách từ danh sách đến logo */
        display: flex; /* Hiển thị các mục menu trên cùng một hàng */
        justify-content: center; /* Căn giữa các mục menu */
    }

    .navigation li {
        margin-right: 20px; /* Khoảng cách giữa các mục menu */
    }

    .navigation li:last-child {
        margin-right: 0; /* Loại bỏ khoảng cách của mục menu cuối cùng */
    }

    .navigation li a {
        text-decoration: none; /* Loại bỏ gạch chân */
        color: #fff; /* Màu chữ của menu */
        font-size: 18px; /* Kích thước chữ của menu */
        transition: color 0.3s ease; /* Hiệu ứng màu chữ */
    }

    .navigation li a:hover {
        color: #ff0; /* Màu chữ khi rê chuột vào menu */
    }

    /* Animation for Logo */
    .logo img {
        width: 100px; /* Kích thước hình ảnh logo */
        height: auto; /* Chiều cao tự động điều chỉnh */
        position: absolute; /* Đặt hình ảnh logo tại vị trí tuyệt đối */
        top: 50%; /* Đặt hình ảnh logo ở giữa theo chiều dọc */
        left: 50%; /* Đặt hình ảnh logo ở giữa theo chiều ngang */
        transform: translate(-50%, -50%); /* Dịch chuyển hình ảnh logo đi 50% chiều ngang và chiều dọc */
        transition: all 0.3s ease; /* Hiệu ứng dịch chuyển */
    }

    .header:hover .logo img {
        transform: translate(-50%, -50%) scale(1.1); /* Phóng to hình ảnh logo khi rê chuột vào header */
    }
</style>
</html>
