
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.UsersDAO" %>
<%@ page import="dao.QuizDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Quiz" %>

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
                            <div class="sb-sidenav-menu-heading">Core</div>
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
                        <h1 class="mt-4">Manager QUIZ</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="admin_home.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Accounts</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
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
                                            <th class="col-3">Quiz Name</th>
                                            <th class="col-1">Question</th>
                                            <th class="col-2">Level</th>
                                            <th class="col-2">Edit</th>
                                            <th class="col-1">Delete</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <% int index = 1; %>
                                        <c:forEach var="question" items="${questions}">
                                            <tr>
                                                <td><%= index++ %></td>
                                                <td>${question.quiz_id.quiz_name}</td>
                                                <td>${question.question_text}</td>
                                                <td>${question.dificulty_id == 1 ? 'Hard' : (question.dificulty_id == 2 ? 'Medium' : 'Easy')}</td>
                                                <td> 
                                                    <a href="updatequestion?question_id=${question.question_id}" class="update-btn">
                                                        <i class="fas fa-edit"></i> Update
                                                    </a>
                                                </td>
                                                <td> 
                                                    <a href="delete_question.jsp?question_id=${question.question_id}" class="delete-btn">
                                                        <i class="fas fa-trash-alt"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>





                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">

                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
    </body>
</html>


