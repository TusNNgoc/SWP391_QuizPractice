<%-- 
    Document   : editAnswer
    Created on : Mar 6, 2024, 2:38:00 PM
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Sửa Câu Trả Lời</title>
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
        <h2 class="text-center mb-4">Sửa Câu Trả Lời</h2>

        <form action="EditAnswerServlet" method="post">
            <div class="form-group">
                <label for="answerId">Answer ID:</label>
                <input type="text" class="form-control" id="answerId" name="answerId" readonly>
            </div>
            <div class="form-group">
                <label for="answerText">Nội dung câu trả lời:</label>
                <textarea class="form-control" id="answerText" name="answerText" rows="3"></textarea>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="isCorrect" name="isCorrect">
                <label class="form-check-label" for="isCorrect">Đúng (Checked) / Sai (Unchecked)</label>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </form>
    </div>

    <!-- Bootstrap JS và Popper.js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>

