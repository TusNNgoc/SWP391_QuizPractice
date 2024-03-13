<%-- 
    Document   : admin_account
    Created on : Mar 3, 2024, 12:37:40 AM
    Author     : anhph
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

                            <div class="wrapper">
                                <div class="content" style="">

                                    <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                                        <div class="container">
                                            <div class="quantity">
                                                <label>Hiện 
                                                    <form>
                                                        <select id="quantitySelect" name="length" onchange="changeQuantity(this)" aria-controls="sampleTable" class="form-control form-control-sm">
                                                            <option value="5" <c:if test="${quantity == 5}">selected</c:if>>5</option>
                                                            <option value="10" <c:if test="${quantity == 10}">selected</c:if>>10</option>
                                                            <option value="25" <c:if test="${quantity == 25}">selected</c:if>>25</option>
                                                            <option value="50" <c:if test="${quantity == 50}">selected</c:if>>50</option>
                                                            </select> danh mục
                                                        </form>
                                                    </label>
                                                    <script>
                                                        function changeQuantity(selectElement) {
                                                            var selectedValue = selectElement.value;

                                                            // Create a form element
                                                            var form = document.createElement('form');
                                                            form.method = 'get';
                                                            form.action = 'role'; // Set the URL of your servlet

                                                            // Create an input element to hold the selected value
                                                            var input = document.createElement('input');
                                                            input.type = 'hidden'; // Hidden input field
                                                            input.name = 'quantity'; // Name should match the parameter name in your servlet
                                                            input.value = selectedValue;
                                                            // Create an input element for the name
                                                            var nameInput = document.createElement('input');
                                                            nameInput.type = 'hidden';
                                                            nameInput.name = 'name'; // Set the name to 'name'
                                                            nameInput.value = '${name}'; // Set the value to the desired name
                                                            // Create an input element for the carID

                                                            form.appendChild(input);
                                                            form.appendChild(nameInput);
                                                            document.body.appendChild(form);

                                                            // Submit the form
                                                            form.submit();
                                                        }
                                                </script>  
                                            </div>
                                            <div class="search">
                                                <form action="role" method="get" >
                                                    <div class="search-box" >
                                                        <label>
                                                            <div class="d-flex align-items-center">
                                                                <div>Tìm kiếm:</div>          
                                                            </div>
                                                            <input type="search" value="${name}" name="name" class="form-control form-control-sm ml-2" placeholder="Nhập từ khóa cần tìm" aria-controls="sampleTable" style="margin-left: 0px !important">
                                                        </label>
                                                        <input type="hidden" name="index" value="1" />
                                                        <input type="hidden" name="quantity" value="${quantity}" />
                                                        <button type="submit" class="btn btn-outline-danger btn-sm" style="margin-bottom: 3px">Search</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addRoleModal">
                                            Add
                                        </button>

                                        <table class="table table-hover table-bordered" id="sampleTable">
                                            <thead>
                                                <tr>
                                                    <th width="80px">Role id</th>
                                                    <th >Role name</th>
                                                    <th width="274px">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="role" items="${data}">
                                                    <tr>
                                                        <th>${role.role_id}</th>
                                                        <td>${role.role_name}
                                                            <div class="container-fluid">
                                                                <div class="collapse" id="collapse${role.role_id}">
                                                                    <div class = row>
                                                                        <div class="col-lg-2">
                                                                            ID
                                                                        </div>
                                                                        <div class="col-lg-3">
                                                                            Fullname
                                                                        </div>
                                                                        <div class="col-lg-3">
                                                                            Username
                                                                        </div>
                                                                        <div class="col-lg-4">
                                                                            Email
                                                                        </div>
                                                                    </div>

                                                                    <c:forEach begin="0" end="${size}" var="user" items="${userlist}">
                                                                        <!-- Loop body -->
                                                                        <c:if test="${role.role_id == user.role.role_id}">
                                                                            <div class="row">
                                                                                <div class="col-lg-2">
                                                                                    ${user.user_id}
                                                                                </div>
                                                                                <div class="col-lg-3">
                                                                                    ${user.fullname}
                                                                                </div>
                                                                                <div class="col-lg-3">
                                                                                    ${user.username}
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    ${user.email}
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                    </c:forEach>

                                                                </div>
                                                            </div>
                                                        </td>
                                                        <!-- Button trigger modal -->
                                                        <th>
                                                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse${role.role_id}" aria-expanded="false" aria-controls="collapse${role.role_id}">
                                                                Users
                                                            </button>
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal${role.role_id}">
                                                                Update
                                                            </button>

                                                            <a type="button" class="btn btn-primary" href="role?action=deleterole&roleid=${role.role_id}">Delete</a>
                                                        </th>
                                                    </tr>
                                                    <!-- Update Modal -->
                                                <div class="modal fade" id="updateModal${role.role_id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${role.role_id}" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="updateModalLabel${role.role_id}">Update Role</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <!-- Add form fields for updating role -->
                                                                <form action="role" method="POST">
                                                                    <div class="form-group">
                                                                        <label for="roleId">Role ID</label>
                                                                        <input type="text" class="form-control" id="roleId" name="roleid" value="${role.role_id}" readonly>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="roleName">Role Name</label>
                                                                        <input type="text" class="form-control" id="roleName" name="rolename" value="${role.role_name}">
                                                                    </div>
                                                                    <input type="hidden" name="action" value="updaterole"/>
                                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="dataTables_paginate">
                                            <c:choose>

                                                <c:when test = "${count>0}">
                                                    Hiện ${(index-1)*quantity+1} đến 
                                                    ${((index*quantity+1)>count) ? count : index*quantity}
                                                    của ${count} danh mục
                                                </c:when>

                                                <c:otherwise>
                                                    Không tìm thấy!
                                                </c:otherwise>
                                            </c:choose>
                                            <ul class="pagination justify-content-center">

                                                <li class="paginate_button page-item previous <c:if test="${index == 1}">disabled</c:if>" id="sampleTable_previous">
                                                    <a href="role?index=${index -1}&name=${name}&quantity=${quantity}" class="page-link">Lùi</a>
                                                </li>

                                                <c:forEach begin="1" end="${endPage}" var="i">

                                                    <li class="paginate_button page-item ${index == i ? 'active' : ''}">
                                                        <a href="role?index=${i}&name=${name}&quantity=${quantity}" class="page-link">${i}</a>
                                                    </li>

                                                </c:forEach>

                                                <li class="paginate_button page-item next <c:if test="${index == endPage}">disabled</c:if>" id="sampleTable_next">
                                                    <a href="role?index=${index +1}&name=${name}&quantity=${quantity}" class="page-link">Tiếp</a>
                                                </li>

                                            </ul>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="addRoleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="addRoleModalLabel">Add Role</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>

                                                    <!-- Your form inputs go here -->
                                                    <form action="role" method="GET">
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="rolename">Role Name</label>
                                                                <input type="text" class="form-control" id="roleName" placeholder="Enter role name" name="rolename">
                                                            </div>
                                                        </div>
                                                        <!-- Add more form inputs as needed -->
                                                        <input type="hidden" name="action" value="addrole"/>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add</button>
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>                        
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    .container {
        display: flex; /* Use flexbox layout */
        justify-content: space-between; /* Distribute space between items */
        margin: 0px;
        padding: 0px;
        max-width: 1080px !important;
    }

    .quantity, .search {
        width: 48%; /* Set width of each div */
        margin: 0px;
    }
    .quantity {
        text-align: left;
    }
    .search {
        text-align: right;
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
