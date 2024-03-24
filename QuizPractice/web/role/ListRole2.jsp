
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.UsersDAO" %>
<%@ page import="dao.UsersDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="assets/css/daboa.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin_home.jsp">Quiz</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Admin</div>
                            <a class="nav-link" href="admin_home.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Manager</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Manager Account
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="account_student.jsp">Manager Student</a>
                                    <a class="nav-link" href="account_teacher.jsp">Manager Teacher</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="role">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Manager Role
                            </a>


                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manager Accounts</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="admin_home.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Accounts</li>
                        </ol>
<!--                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>-->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Role DataTable 
                            </div>
                            <div class="card-body">
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
                                                                <div class="modal fade" id="updateModal${role.role_id}" tabindex="-1" aria-labelledby="updateModalLabel${role.role_id}" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="updateModalLabel${role.role_id}">Update Role</h5>
                                                                                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <!-- Add form fields for updating role -->
                                                                                <form action="role" method="POST">
                                                                                    <div class="mb-3">
                                                                                        <label for="roleId" class="form-label">Role ID</label>
                                                                                        <input type="text" class="form-control" id="roleId" name="roleid" value="${role.role_id}" readonly>
                                                                                    </div>
                                                                                    <div class="mb-3">
                                                                                        <label for="roleName" class="form-label">Role Name</label>
                                                                                        <input type="text" class="form-control" id="roleName" name="rolename" value="${role.role_name}" required>
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
                                                        <div class="modal fade" id="addRoleModal" tabindex="-1" aria-labelledby="addRoleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="addRoleModalLabel">Add Role</h5>
                                                                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <form action="role" method="GET">
                                                                        <div class="modal-body">
                                                                            <div class="mb-3">
                                                                                <label for="rolename" class="form-label">Role Name</label>
                                                                                <input type="text" class="form-control" id="roleName" placeholder="Enter role name" name="rolename" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="action" value="addrole"/>
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
                                </div>                               

                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    <style>
            .container {
        display: flex; /* Use flexbox layout */
        justify-content: space-between; /* Distribute space between items */
        margin: 0px;
        padding: 0px;
        max-width: 3060px !important;
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
    </style>
</html>
