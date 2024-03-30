<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.StoreResult" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<!--      <link  rel="stylesheet" href="css/Quiz_result.css">-->
    <title>Quiz Result</title>
</head>
<body>
    <style>
        /* Quiz Result page styling */

/* Body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.container-fluid {
    max-width: 80%;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1, h5 {
    text-align: center;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

thead {
    background-color: #343a40;
    color: #fff;
}

/* Button styling */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
}

/* Highlighting correct and incorrect answers */
tr.correct td {
    background-color: #d4edda; /* Light green for correct answers */
}

tr.incorrect td {
    background-color: #f8d7da; /* Light red for incorrect answers */
}
/* Centering elements */
.center {
    text-align: center;
    margin-top: 20px; /* Add margin for better spacing */
}

    </style>
<div class="container-fluid p-2 mt-3">
    <center><u><h1>Quiz Result</h1></u></center><br>
    <h5>Score: <%= session.getAttribute("score") %>/10</h5>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">QNo.</th>
            <th scope="col">Question</th>
            <th scope="col">Option A</th>
            <th scope="col">Option B</th>
            <th scope="col">Option C</th>
            <th scope="col">Option D</th>
            <th scope="col">Your Answer</th>
            <th scope="col">Answer</th>
        </tr>
        </thead>
        <tbody>
        <%
        // Lặp qua mảng question của StoreResult để hiển thị thông tin của từng câu hỏi
        for (int i = 0; i < StoreResult.qno; i++) {
            %>
            <tr>
                <th scope="row"><%= i + 1 %></th>
                <td><%= StoreResult.question[i] %></td>
                <td><%= StoreResult.A[i] %></td>
                <td><%= StoreResult.B[i] %></td>
                <td><%= StoreResult.C[i] %></td>
                <td><%= StoreResult.D[i] %></td>
                <td><%= StoreResult.useranswer[i] %></td>
                <td><%= StoreResult.answer[i] %></td>
            </tr>
            <%
        }
        %>
        </tbody>
    </table>
    <div>
        <form action="Maths_Exam.jsp" method="post">
            <input type="submit" class="btn btn-primary" value="Retake Quiz">
        </form>
        <form action="Quiz.jsp" method="post">
            <input type="submit" class="btn btn-danger" value="Exit">
        </form>
    </div>
</div>
</body>
</html>
