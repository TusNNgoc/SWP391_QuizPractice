<%-- 
    Document   : addAnswer
    Created on : Mar 6, 2024, 12:19:46 PM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm Câu Trả Lời Mới</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    </head>

    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Thêm Câu Trả Lời Mới</h2>

            <form action="/QuizPractice/addAnswer" method="get" id="addAnswerForm">
                <div class="form-group">
                    <label for="answerText">Nội dung câu trả lời:</label>
                    <textarea class="form-control" rows="3" id="answerText" name="answerText" required></textarea>
                </div>
                <div class="form-check">
                    <input type="hidden" name="isCorrect" value="false">
                    <input type="checkbox" class="form-check-input" id="isCorrect" name="isCorrect">
                    <label class="form-check-label" for="isCorrect">Câu trả lời đúng</label>
                </div>
                <button type="submit" class="btn btn-primary mt-3" >Thêm Câu Trả Lời</button>
            </form>
        </div>

        <!-- Bootstrap JS và Popper.js -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!--        <script>
                    function redirectToAnswerList() {
                        // Redirect to the desired URL when the button is clicked
                        window.location.href = '/QuizPractice/addAnswer'; // Thay thế bằng URL thực tế
                    }
        </script>-->
    </body>

</html>
