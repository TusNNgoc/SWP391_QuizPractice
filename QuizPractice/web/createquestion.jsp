

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

                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-6">
                                        <form action="quizcrud" class="form" method="POST">
                                            <div class="form-group">
                                                <label for="question">Question</label>
                                                <input type="text" class="form-control" id="question" name="question" value="${questiontext}" required/>
                                            </div>

                                            <c:if test="${gettype == null}">
                                                <div class="form-group">
                                                    <label for="typelist">Type</label>
                                                    <select class="form-control" id="typelist" name="typelist">
                                                        <c:forEach var="type" items="${typeList}">
                                                            <option value="${type.type_id}" selected>${type.type_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <input type="hidden" name="action" value="addquestion"/>
                                            </c:if>

                                            <c:if test="${gettype != null}">
                                                <c:if test="${gettype == '1'}">
                                                    <div class="form-group">
                                                        <label for="rightanswer">Right Answer</label>
                                                        <input type="text" class="form-control" id="rightanswer" name="rightanswer" required/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="wronganswer1">Wrong Answer 1</label>
                                                        <input type="text" class="form-control" id="wronganswer1" name="wronganswer1" required/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="wronganswer2">Wrong Answer 2</label>
                                                        <input type="text" class="form-control" id="wronganswer2" name="wronganswer2" required/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="wronganswer3">Wrong Answer 3</label>
                                                        <input type="text" class="form-control" id="wronganswer3" name="wronganswer3" required/>
                                                    </div>

                                                    <input type="hidden" name="questionid" value="${questionid}"/>
                                                    <input type="hidden" name="action" value="addanswer"/>
                                                </c:if>
                                            </c:if>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-light">Tạo</button>
                                                <a href="signin?action=Quiz" class="btn btn-light ml-2" style="text-decoration: none;">Hủy</a>
                                            </div>
                                            <input type="hidden" name="quizid" value="${quizid}"/>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

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
