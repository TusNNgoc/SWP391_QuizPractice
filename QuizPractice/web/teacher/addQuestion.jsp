<%-- 
    Document   : addQuestion
    Created on : Mar 6, 2024, 9:34:23 AM
    Author     : -Pc-
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm Câu Hỏi</title>
        <!-- Add your CSS styles here -->
        <link rel="stylesheet" type="text/css" href="path/to/your/styles.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Add your additional stylesheets or frameworks here -->
        <style>
            body {
                background-color: #f8f9fa;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 60%; /* Thay đổi chiều rộng theo ý muốn của bạn */
                max-width: 800px; /* Thêm giới hạn chiều rộng tối đa nếu cần */
                height: 80%; /* Thay đổi chiều cao theo ý muốn của bạn */
                max-height: 600px; /* Thêm giới hạn chiều cao tối đa nếu cần */
            }

            h2 {
                text-align: center;
                color: #007bff;
            }
            form {
                max-width: 600px; /* Thêm giới hạn chiều rộng tối đa của form */
                margin: auto; /* Đưa form về giữa */
            }

            .form-group {
                margin-bottom: 30px; /* Tăng khoảng cách giữa các trường */
            }

            label {
                display: block; /* Hiển thị label ở dòng mới */
                margin-bottom: 10px; /* Tăng khoảng cách giữa label và input */
                font-weight: bold; /* In đậm chữ cho label */
                color: #343a40; /* Màu chữ cho label */
            }

            input,
            select {
                width: 100%; /* Chiếm toàn bộ chiều rộng của form-group */
                padding: 15px; /* Tăng padding để làm cho input và select lớn hơn */
                margin-bottom: 15px; /* Tăng khoảng cách giữa các input và select */
                box-sizing: border-box; /* Kích thước toàn bộ chiều rộng và chiều cao bao gồm padding và border */
                background-color: #f8f9fa; /* Màu nền của input và select */
                border: 1px solid #ced4da; /* Màu viền của input và select */
            }

            button {
                width: 100%; /* Chiếm toàn bộ chiều rộng của form-group */
                padding: 15px;
                box-sizing: border-box;
                background-color: #007bff; /* Màu nền của nút */
                color: #ffffff; /* Màu chữ của nút */
            }


            button:hover {
                background-color: #0056b3; /* Màu nền của nút khi hover */
            }
            .btn-secondary {
                background-color: #6c757d; /* Màu nền của nút hủy bỏ */
                color: #ffffff; /* Màu chữ của nút hủy bỏ */
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-secondary:hover {
                background-color: #5a6268; /* Màu nền của nút hủy bỏ khi hover */
            }
        </style>

    </head>

    <body>
        <div class="container">
            <h2>Thêm Câu Hỏi</h2>
            <form action="/QuizPractice/question?action=insert" method="post" >
<!--                <div class="form-group">
                    <label for="questionId">Mã Câu Hỏi:</label>
                    <input type="text" class="form-control" id="questionId" name="question_id" required>
                </div>-->

                <div class="form-group">
                    <label for="questionText">Nội Dung Câu Hỏi:</label>
                    <input type="text" class="form-control" id="questionText" name="question_text" required>
                </div>

                <div class="form-group">
                    <label for="quizId">Kiểu câu hỏi:</label>
                    <select name="quiz_id" class="form-control" required>
                        <!-- Replace with your dynamic options -->
                        <option value="quiz1">Multiplechoice</option>
                        
                    </select>
                </div>

                <!-- Add more fields as needed -->

                <button type="submit" class="btn btn-primary">Tạo mới</button>
<!--                <a class="btn btn-secondary" href="#">Hủy bỏ</a>-->
            </form>
        </div>

        <!-- Essential javascripts for application to work -->
        <script src="path/to/your/jquery.min.js"></script>
        <script src="path/to/your/popper.min.js"></script>
        <script src="path/to/your/bootstrap.min.js"></script>
        <!-- The javascript plugin to display page loading on top -->
        <script src="path/to/your/pace.min.js"></script>
        <!-- Add your additional scripts here -->
    </body>

</html>


