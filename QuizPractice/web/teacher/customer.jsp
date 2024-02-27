

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="teacher/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="dashboard"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="teacher/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${user.getFullname()}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="signin?action=course"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Quản lý Course</span></a></li>
                <li><a class="app-menu__item" href="signin?action=quiz"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý Quiz</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý Question</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách Quiz</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In dữ liệu</a>
                                </div>
                            </div>

                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>Quiz Name</th>
                                        <th>Quiz Content</th>
                                        <th>Belong to Course</th>

                                        <th width="70">Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listQuiz}" var="q">
                                        <tr>
                                            <td>${q.quiz_name}</td>
                                            <td>${q.quiz_content}</td>
                                            <td>${q.course_id.course_name}</td>

                                            <td><button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                                        data-target="#ModalUP${q.quiz_id}"><i class="fas fa-edit"></i></button></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <c:forEach items="${listQuiz}" var="q">
                <div class="modal fade" id="ModalUP${q.quiz_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form method="POST" action="quiz?action=update&quiz_id=${q.quiz_id}">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">  
                                            <h5>Update Information</h5>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="exampleSelect1" class="control-label">Quiz Name</label>

                                            <input type="text" class="form-control" id="quizName" name="quizName" placeholder="Enter Quiz Name">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="exampleSelect1" class="control-label">Quiz Content</label>

                                            <input type="text" class="form-control" id="quizContent" name="quizContent" placeholder="Enter Quiz Content">
                                        </div>
                                    </div>

                                    

                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                </div>
                            </form>
                            <div class="modal-footer"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </main>

        <!-- Essential javascripts for application to work-->
        <script src="teacher/js/jquery-3.2.1.min.js"></script>
        <script src="teacher/js/popper.min.js"></script>
        <script src="teacher/js/bootstrap.min.js"></script>
        <script src="/ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="teacher/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="teacher/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>

            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
//            jQuery(function () {
//                jQuery(".trash").click(function () {
//                    swal({
//                        title: "Cảnh báo",
//
//                        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
//                        buttons: ["Hủy bỏ", "Đồng ý"],
//                    })
//                            .then((willDelete) => {
//                                if (willDelete) {
//                                    swal("Đã xóa thành công.!", {
//
//                                    });
//                                }
//                            });
//                });
//            });
//            jQuery(function () {
//                jQuery(".trash").click(function () {
//                    swal({
//                        title: "Cảnh báo",
//                        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
//                        buttons: ["Hủy bỏ", "Đồng ý"],
//                    }).then((willDelete) => {
//                        if (willDelete) {
//                            swal("Đã xóa thành công.!", {});
//                        }
//                    });
//                });
//            });
            $(document).ready(function () {
                $(".edit").click(function () {
                    var modalId = $(this).data("target");
                    $(modalId).modal("show");
                });

                $(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((willDelete) => {
                        if (willDelete) {
                            swal("Đã xóa thành công.!", {});
                        }
                    });
                });
            });

            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
            //In dữ liệu
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }

        </script>
    </body>

</html>
