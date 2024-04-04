<%-- 
Document   : admin_account
Created on : Mar 20, 2024, 12:38:38 AM
Author     : anhph
--%>

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
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="assets/css/daboa.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="">QUIZ</a>
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

                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">


                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link" href="role">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Manager Role
                            </a>
                            <a class="nav-link" href="Listquiz">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Manager Quiz
                            </a>


                            <a class="nav-link" href="admin_question">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Manager Question
                            </a>
                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Admin Home</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Manager Account</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Student</div>
                                    <center>
                                        <h2>
                                            <%= UsersDAO.getTotalUsersWithRole2() %>
                                        </h2>
                                    </center>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="account_student.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Teacher</div>
                                    <center>
                                        <h2>
                                            <%= UsersDAO.getTotalUsersWithRole1() %>
                                        </h2>
                                    </center>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="account_teacher.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Users</div>
                                    <center>
                                        <h2>
                                            <%= UsersDAO.getTotalAccounts() %>
                                        </h2>
                                    </center>

                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="account_all.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Account Online</div>
                                    <center>
                                        <h2>
                                            <%= UsersDAO.getTotalActiveUsersWithRole() %>
                                        </h2>
                                    </center>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="account_online.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    DataTable Example
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple" class="table">
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
    // Lấy danh sách tất cả các tài khoản từ UsersDAO.getAccount()
    ArrayList<User> allaccounts = UsersDAO.getAccount();

    // Tiếp tục với phần mã đã có
    int rowsPerPage = 10;
    int pageCount = (int) Math.ceil(allaccounts.size() / (double) rowsPerPage);
    int currentPage = request.getParameter("index") != null ? Integer.parseInt(request.getParameter("index")) : 1;
    int startIndex = (currentPage - 1) * rowsPerPage;
    int endIndex = Math.min(startIndex + rowsPerPage, allaccounts.size());
    List<User> currentUsers = allaccounts.subList(startIndex, endIndex);

    int i = startIndex + 1;
    for(User u : currentUsers) {
                                            %>
                                            <tr>
                                                <td><%=i++%></td>
                                                <td><%=u.getFullname() %></td>
                                                <td><%=u.getPassword() %></td>
                                                <td><%=u.getUsername() %></td>
                                                <td><%=u.isAccountActived() %></td>
                                                <td>
                                                    <% 
                                                        if (u.getRole() == 1) {
                                                            out.print("Teacher");
                                                        } else if (u.getRole() == 2) {
                                                            out.print("Student");
                                                        } else {
                                                            out.print("Unknown"); // Nếu cần, bạn có thể xử lý trường hợp khác ở đây
                                                        }
                                                    %>
                                                </td>
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
                                                <td> 
                                                    <a href="delete_account.jsp?user_id=<%=u.getUser_id()%>" class="delete-btn">
                                                        <i class="fas fa-trash-alt"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                            <% 
                                                }
                                            %>


                                        </tbody>
                                    </table>

                                    <div >
                                        <button type="button" class="btn btn-outline-success">
                                            <div><h3> <a href="admin_add.jsp" style="margin-top: 5px;
                                                         margin-right: 20px;
                                                         margin-bottom: 15px;
                                                         margin-left: 10px;">  Add Account  </a></h3></div>
                                        </button>
                                    </div

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
    </body>
</html>


