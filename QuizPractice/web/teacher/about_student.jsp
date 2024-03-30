<%-- 
    Document   : about_student
    Created on : Mar 12, 2024, 11:38:46 AM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Student</title>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        
        
        <style type="text/css">
            body{
                color: #6F8BA4;
                margin-top:20px;
            }
            .section {
                padding: 100px 0;
                position: relative;
            }
            .gray-bg {
                background-color: #f5f5f5;
            }
            img {
                max-width: 100%;
            }
            img {
                vertical-align: middle;
                border-style: none;
            }
            /* About Me 
            ---------------------*/
            .about-text h3 {
                font-size: 45px;
                font-weight: 700;
                margin: 0 0 6px;
            }
            @media (max-width: 767px) {
                .about-text h3 {
                    font-size: 35px;
                }
            }
            .about-text h6 {
                font-weight: 600;
                margin-bottom: 15px;
            }
            @media (max-width: 767px) {
                .about-text h6 {
                    font-size: 18px;
                }
            }
            .about-text p {
                font-size: 18px;
                max-width: 450px;
            }
            .about-text p mark {
                font-weight: 600;
                color: #20247b;
            }

            .about-list {
                padding-top: 10px;
            }
            .about-list .media {
                padding: 5px 0;
            }
            .about-list label {
                color: #20247b;
                font-weight: 600;
                width: 88px;
                margin: 0;
                position: relative;
            }
            .about-list label:after {
                content: "";
                position: absolute;
                top: 0;
                bottom: 0;
                right: 11px;
                width: 1px;
                height: 12px;
                background: #20247b;
                -moz-transform: rotate(15deg);
                -o-transform: rotate(15deg);
                -ms-transform: rotate(15deg);
                -webkit-transform: rotate(15deg);
                transform: rotate(15deg);
                margin: auto;
                opacity: 0.5;
            }
            .about-list p {
                margin: 0;
                font-size: 15px;
            }

            @media (max-width: 991px) {
                .about-avatar {
                    margin-top: 30px;
                }
            }

            .about-section .counter {
                padding: 22px 20px;
                background: #ffffff;
                border-radius: 10px;
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            }
            .about-section .counter .count-data {
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .about-section .counter .count {
                font-weight: 700;
                color: #20247b;
                margin: 0 0 5px;
            }
            .about-section .counter p {
                font-weight: 600;
                margin: 0;
            }
            mark {
                background-image: linear-gradient(rgba(252, 83, 86, 0.6), rgba(252, 83, 86, 0.6));
                background-size: 100% 3px;
                background-repeat: no-repeat;
                background-position: 0 bottom;
                background-color: transparent;
                padding: 0;
                color: currentColor;
            }
            .theme-color {
                color: #fc5356;
            }
            .dark-color {
                color: #20247b;
            }

            .theme-color.lead{
                text-transform: uppercase;
            }
            /*female, male icon*/
            .male-icon {
                color: blue; /* Màu xanh */
            }

            .female-icon {
                color: #ff69b4; /* Màu hồng */
            }

            /* CSS cho nút "Back" */
            .back-button {
                position: fixed;
                top: 20px; /* Khoảng cách từ trên xuống */
                right: 20px; /* Khoảng cách từ phải sang */
                background-color: #007bff; /* Màu nền của nút */
                color: white; /* Màu chữ của nút */
                padding: 10px 20px; /* Kích thước của nút */
                border-radius: 5px; /* Bo tròn góc của nút */
                text-decoration: none; /* Loại bỏ gạch chân cho văn bản trong nút */
                font-weight: bold; /* Đậm chữ của nút */
                z-index: 9999; /* Layer cao nhất */
            }

        </style>
    </head>
    <body>
        <section class="section about-section gray-bg" id="about">

            <%
    // Lấy giá trị của biến course_name từ session
    String courseName = (String) session.getAttribute("course_name");
            %>

            <div class="container">
                <div class="row align-items-center flex-row-reverse">
                    <div class="col-lg-6">
                        <div class="about-text go-to">
                            <a href="managestudent?course_name=<%= URLEncoder.encode(courseName.trim(), "UTF-8") %>" class="back-button">
                                Back
                            </a>
                            <h3 class="dark-color">About ${student.fullname}
                                <c:choose>
                                    <c:when test="${student.gender eq 'male'}">
                                        <span class="male-icon">&#9794;</span>
                                    </c:when>
                                    <c:when test="${student.gender eq 'female'}">
                                        <span class="female-icon">&#9792;</span>
                                    </c:when>

                                </c:choose> 
                            </h3>
                            <h6 class="theme-color lead">${student.role.role_name}</h6>
                            <!--                            <p>I <mark>design and develop</mark> services for customers of all sizes, specializing in creating stylish, modern websites, web services and online stores. My passion is to design digital user experiences through the bold interface and meaningful interactions.</p>-->
                            <p>${student.description} </p>
                            <div class="row about-list">
                                <div class="col-md-6">
                                    <div class="media">
                                        <label>Fullname</label>
                                        <p>${student.fullname}</p>

                                    </div>

                                    <div class="media">
                                        <label>Residence</label>
                                        <p>${student.country}</p>
                                    </div>
                                    <div class="media">
                                        <label>Address</label>
                                        <p>${student.address}</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="media">
                                        <label>E-mail</label>
                                        <p><a  class="__cf_email__" data-cfemail="650c0b030a25010a08040c0b4b060a08">${student.email}</a></p>
                                    </div>
                                    <div class="media">
                                        <label>Phone</label>
                                        <p>${student.phone}</p>
                                    </div>
                                    <div class="media">
                                        <label>Dob</label>
                                        <p>${student.dob}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-avatar">
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" title alt>
                        </div>
                    </div>
                </div>
                <div class="counter">
                    <div class="row">
                        <c:forEach items="${listCourse}" var="c">
                            <div class="col-6 col-lg-3">
                                <div class="count-data text-center">
                                    <h6 class="count h2" data-to="500" data-speed="500">500</h6>
                                    <p class="m-0px font-w-600">${c.course_name}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <!--                        <div class="col-6 col-lg-3">
                                                    <div class="count-data text-center">
                                                        <h6 class="count h2" data-to="500" data-speed="500">500</h6>
                                                        <p class="m-0px font-w-600">Happy Clients</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-lg-3">
                                                    <div class="count-data text-center">
                                                        <h6 class="count h2" data-to="150" data-speed="150">150</h6>
                                                        <p class="m-0px font-w-600">Project Completed</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-lg-3">
                                                    <div class="count-data text-center">
                                                        <h6 class="count h2" data-to="850" data-speed="850">850</h6>
                                                        <p class="m-0px font-w-600">Photo Capture</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-lg-3">
                                                    <div class="count-data text-center">
                                                        <h6 class="count h2" data-to="190" data-speed="190">190</h6>
                                                        <p class="m-0px font-w-600">Telephonic Talk</p>
                                                    </div>
                                                </div>-->
                    </div>
                </div>
            </div>
        </section>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
