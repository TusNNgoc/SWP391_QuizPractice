<%-- 
    Document   : addStudent
    Created on : Mar 13, 2024, 2:47:38 AM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Sweetalert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        <title>Add Student</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #f8f9fa;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 300px;
                text-align: center;
            }

            h2 {
                color: #007bff;
            }

            label {
                display: block;
                text-align: left;
                margin: 10px 0 5px;
                color: #495057;
            }

            input, select {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ced4da;
                border-radius: 4px;
                outline: none;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .check-button {
                background-color: #17a2b8;
                color: #fff;
                cursor: pointer;
                padding: 10px;
                border: none;
                border-radius: 4px;
                margin-left: 5px;
                margin-top: 8px;
                transition: background-color 0.3s;
            }

            .check-button:hover {
                background-color: #138496;
            }
        </style>
    </head>
    <body>
        <input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>"/>
        <form action="addstdcourse?action=add" method="post" id="addStudentForm">

            <h2>Thêm Học Sinh</h2>
            <label for="username">Student:</label>
            <div class="input-group">

                <input type="text" id="username" name="username" class="form-control" placeholder="Nhập username" required value="<%= (request.getAttribute("us") != null) ? request.getAttribute("us") : "" %>" >



                <div class="input-group-append">
                    <button type="button" class="btn btn-primary check-button" onclick="checkAndSubmit()">Kiểm tra</button>
                </div>
            </div>

            <label for="course_name">Course:</label>
            <select id="course_name" name="course_name" required>
                <c:forEach items="${listCourse}" var="c">
                    <option value="${c.course_name}">${c.course_name} </option>
                </c:forEach>

            </select>

            <input type="submit" value="Thêm Học Sinh">
        </form>

        <script>
            function checkAndSubmit() {
                // Thực hiện kiểm tra nếu cần thiết

                // Thay đổi action của form
                document.getElementById('addStudentForm').action = 'addstdcourse?action=check';

                // Gọi hàm submit() để gửi dữ liệu đến servlet
                document.getElementById('addStudentForm').submit();
            }
        </script>

        <script>

            var msg = document.getElementById("msg").value;
            if (msg === "invalid username") {
                Swal.fire({
                    title: "Error",
                    text: "Invalid username",
                    icon: "error"
                });
            }
            if (msg === "valid username") {
                Swal.fire({
                    title: "Success",
                    text: "Valid username",
                    icon: "success"
                });
            }

        </script>
    </body>
</html>
