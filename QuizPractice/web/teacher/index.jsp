<%-- 
    Document   : index
    Created on : Oct 19, 2021, 11:22:48 PM
    Author     : Khuong Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


        <!-- Boosttrap-->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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
                <li><a class="app-menu__item" href="signin?action=Quiz"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý Quiz</span></a></li>
                <li><a class="app-menu__item" href="signin?action=question"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý Question</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý Answer</span></a></li>

                <li><a class="app-menu__item" href="profile" target="_blank"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Edit Profile</span></a></li>
                <!--                <li><a class="app-menu__item" href="https://docs.google.com/spreadsheets/d/1elWy0LYj9ngbmywMGwy8Noe_K7WmyisQ6aHOK6RnXZI" target="_blank"><i class='app-menu__icon bx bx-task'></i><span
                                            class="app-menu__label">Kiểm tra phản hồi</span></a></li>-->
            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>

                        </ul>
                        
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12">
                    <div class="row">
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng khóa học</h4>
                                    <p><b><a href="#" id="coursesLink">${coursesCount} khóa học</a></b></p>
                                    <p class="info-tong">Tổng số khóa học hiện có.</p>
                                </div>

                                <div>


                                    <!-- JavaScript và các tài nguyên khác -->
                                </div>
                            </div>


                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng học sinh</h4>
                                    <p><b>${studentCount} học sinh</b></p>
                                    <p class="info-tong">Tổng số học sinh.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng đơn hàng</h4>
                                    <p><b>${requestScope.bill} đơn hàng</b></p>
                                    <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>Sắp hết hàng</h4>
                                    <p><b>${requestScope.low} sản phẩm</b></p>
                                    <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Khóa học</h3>
                                <input type="text" id="myInputTable" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                                <div>
                                    <table id="myTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Course Name</th>
                                                <th>Description</th>
                                                <th> Status </th>
                                                <th>Action</th>



                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${courses}" var="c">
                                                <tr>
                                                    <td>${c.course_id}</td>
                                                    <td>${c.course_name}</td>
                                                    <td>${c.course_content}</td>

                                                    <td>           
                                                        <c:choose>
                                                            <c:when test="${c.isActive eq '1'}">
                                                                <span class="badge badge-success">Active</span>
                                                            </c:when>                                                       
                                                            <c:otherwise>
                                                                <span class="badge badge-danger">Inactive</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

<!--                                                    <td><span class="badge bg-success">${b.payment}</span></td>                                  -->
                                                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#courseModal_${c.course_id}" onclick="redirectToServlet('${c.course_id}')">
                                                            <i class="fa fa-eye"></i> 
                                                        </button>

                                                        <!-- EditCourseModal BUTTON-->
                                                        <button type="button" class="btn btn-warning"
                                                                data-toggle="modal"
                                                                data-target="#EditCourseModal"
                                                                onclick="openEditModal('${c.course_id}', '${c.course_name}', '${c.course_content}', '${c.isActive eq '1' ? 1 : 0}')">
                                                            <i class="fa fa-edit"></i> 
                                                        </button
                                                    </td> 


         <!--                                                <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="course?action=showdetail&course_id=${c.course_id}"><i class="fa"></i>Chi tiết khóa học</a></td>-->
                                                    <td> <div>
                                                            <a href="javascript:demoFromHTML()" class="button">Download sources</a>
                                                            <div id="content">
                                                                <h1 style="display: none;">
                                                                    This is document about java.... update
                                                                </h1>
                                                            </div>
                                                        </div></td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                    
                                    <!-- SCRIPT CHO NÚT VIEW -->
                                    <script>
                                        function redirectToServlet(courseId) {
                                            // Chuyển hướng đến servlet với courseId
                                            window.location.href = 'quiz?courseId=' + courseId;
                                        }
                                    </script>
                                </div>


                                <style>/* Thêm đoạn CSS cho thanh trượt */
                                    .form-group {
                                        margin-bottom: 20px;
                                    }

                                    #statusSlider {
                                        width: 100%;
                                    }

                                    #statusText {
                                        display: block;
                                        margin-top: 10px;
                                        font-weight: bold;

                                    }
                                    #statusSlider {
                                        width: 15%; /* Điều chỉnh độ rộng theo ý muốn */
                                    }

                                    #statusText {
                                        display: block;
                                        margin-top: 10px;
                                        font-weight: bold;
                                    }
                                </style>

                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddCourseModal">
                                    Add Course
                                </button>

                                <!-- AddCourseModal -->
                                <div class="modal fade" id="AddCourseModal" tabindex="-1" role="dialog" aria-labelledby="AddCourseModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="AddCourseModalLabel">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form class="needs-validation" novalidate action="course?action=add" method="post">
                                                    <!-- Trường 1 - Course Name -->
                                                    <div class="form-group">
                                                        <label for="inputCourseName">Course Name </label>
                                                        <input type="text" class="form-control" id="inputCourseName" aria-describedby="emailHelp" placeholder="Enter course name" name="course_name" required>
                                                        <div class="invalid-feedback">
                                                            Please enter a course name
                                                        </div>

                                                    </div>

                                                    <!-- Trường 2 - Description -->
                                                    <div class="form-group">
                                                        <label for="inputDescription">Description</label>
                                                        <input type="text" class="form-control" id="inputDescription" placeholder="Nhập description" name="course_content" required>
                                                        <div class="invalid-feedback">
                                                            Please enter a description
                                                        </div>
                                                    </div>



                                                    <!-- Trường 4 - Slide Trượt (Active/Inactive) -->
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <input type="range" class="form-control-range" id="statusSlider" min="0" max="1" step="1" value="1">
                                                        <span id="statusText">Active</span>
                                                    </div>
                                                    <input type="hidden" id="status" name="status" value="1">

                                                    <script>
                                                        document.getElementById('statusSlider').addEventListener('input', function () {
                                                            var statusText = document.getElementById('statusText');
                                                            var statusSlider = document.getElementById('statusSlider');
                                                            var hiddenStatus = document.getElementById('status');

                                                            // Nếu giá trị thanh trượt là 1, hiển thị Active, ngược lại hiển thị Inactive
                                                            if (statusSlider.value == 1) {
                                                                statusText.textContent = 'Active';
                                                            } else {
                                                                statusText.textContent = 'Inactive';
                                                            }

                                                            // Gán giá trị của thanh trượt vào hidden input
                                                            hiddenStatus.value = statusSlider.value;
                                                        });

                                                    </script>
                                                    <!-- END OF SLIDE BUTTON -->



                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>





                                <!-- AddCourseModal -->
                                <div class="modal fade" id="AddCourseModal" tabindex="-1" role="dialog" aria-labelledby="AddCourseModalLabel" aria-hidden="true">
                                    <!-- Mã HTML cho modal AddCourseModal -->
                                </div>

                                <!-- EditCourseModal -->
                                <div class="modal fade" id="EditCourseModal" tabindex="-1" role="dialog" aria-labelledby="EditCourseModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="EditCourseModalLabel">Edit Course</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form class="needs-validation" novalidate action="course?action=edit" method="post">
                                                    <!-- Trường 1 - Course Name -->
                                                    <div class="form-group">
                                                        <label for="inputCourseName">Course Naádasme </label>
                                                        <input type="text" class="form-control" id="inputEditCourseName" aria-describedby="emailHelp" placeholder="Enter course name" name="course_name" required>
                                                        <div class="invalid-feedback">
                                                            Please enter a course name
                                                        </div>
                                                    </div>

                                                    <!-- Trường 2 - Description -->
                                                    <div class="form-group">
                                                        <label for="inputDescription">Description</label>
                                                        <input type="text" class="form-control" id="inputEditDescription" placeholder="Enter description" name="course_content" required>
                                                        <div class="invalid-feedback">
                                                            Please enter a description
                                                        </div>
                                                    </div>

                                                    <!-- Trường 4 - Slide Trượt (Active/Inactive) -->
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <input type="range" class="form-control-range" id="statusSliderEdit" min="0" max="1" step="1" value="1">
                                                        <span id="statusTextEdit">Active</span>
                                                    </div>
                                                    <input type="hidden" id="statusEdit" name="status" value="1">

                                                    <input type="hidden" id="hiddenCourseId" name="course_id">

                                                    <!-- Nút Submit -->
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <script>

                                    function openEditModal(courseId, courseName, courseContent, status) {
                                        var form = $('#editCourseForm');
                                        form.attr('action', 'course?action=update');
                                        console.log(courseName, courseContent, status);
                                        // Đặt giá trị cho các trường của form
                                        form.find('#inputEditCourseName').val(courseName);
                                        form.find('#inputEditDescription').val(courseContent);
                                        form.find('#statusSliderEdit').val(status).change();

                                        // Đặt giá trị cho course_id trong input ẩn
                                        $('#hiddenCourseId').val(courseId);

                                        var statusTextEdit = $('#statusTextEdit');
                                        statusTextEdit.text(status == 1 ? 'Hoạt động' : 'Không hoạt động');
                                    }
                                </script>








                                <!-- / div trống-->
                            </div>
                        </div>
                        <!-- / col-12 -->
                    </div>
                </div>
            </div>

            <!-- comment -->
            <script>
                function myFunction() {
                    var input, filter, table, tr, td, i, txtValue;
                    input = document.getElementById("myInputTable");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("myTable");
                    tr = table.getElementsByTagName("tr");
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[1];
                        if (td) {
                            txtValue = td.textContent || td.innerText;
                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>          




            <div class="text-center" style="font-size: 13px">
                <p><b>Copyright
                        <script type="text/javascript">
                            document.write(new Date().getFullYear());
                        </script> Phần mềm quản lý.
                    </b></p>
            </div>
        </main>
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/popper.min.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/main.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!--===============================================================================================-->
        <!--===============================================================================================-->



        <script type="text/javascript">
                            var isCoursesVisible = false; // Biến để lưu trạng thái hiện/ẩn của danh sách

                            document.getElementById('toggleCoursesBtn').addEventListener('click', function () {
                                var coursesList = document.getElementById('coursesList');

                                if (isCoursesVisible) {
                                    // Nếu danh sách đang hiển thị, ẩn đi
                                    coursesList.style.display = 'none';
                                    isCoursesVisible = false;
                                } else {
                                    // Nếu danh sách đang ẩn, hiển thị lên
                                    coursesList.style.display = 'block';
                                    isCoursesVisible = true;
                                }
                            });
        </script>


        <script type="text/javascript">
            var data = {
                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                datasets: [{
                        label: "Dữ liệu đầu tiên",
                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                        strokeColor: "rgb(255, 212, 59)",
                        pointColor: "rgb(255, 212, 59)",
                        pointStrokeColor: "rgb(255, 212, 59)",
                        pointHighlightFill: "rgb(255, 212, 59)",
                        pointHighlightStroke: "rgb(255, 212, 59)",
                        data: [20, 59, 90, 51, 56, 100]
                    },
                    {
                        label: "Dữ liệu kế tiếp",
                        fillColor: "rgba(9, 109, 239, 0.651)  ",
                        pointColor: "rgb(9, 109, 239)",
                        strokeColor: "rgb(9, 109, 239)",
                        pointStrokeColor: "rgb(9, 109, 239)",
                        pointHighlightFill: "rgb(9, 109, 239)",
                        pointHighlightStroke: "rgb(9, 109, 239)",
                        data: [48, 48, 49, 39, 86, 10]
                    }
                ]
            };
            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
            var lineChart = new Chart(ctxl).Line(data);

            var ctxb = $("#barChartDemo").get(0).getContext("2d");
            var barChart = new Chart(ctxb).Bar(data);
        </script>
        <script type="text/javascript">
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
                m = checkTime(m);
                nowTime = h + ":" + m + "";
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
        </script>
    </body>

</html>