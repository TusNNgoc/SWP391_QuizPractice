<%-- 
    Document   : answer
    Created on : Mar 6, 2024, 11:48:01 AM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách Câu Trả Lời</title>
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
            <h2 class="text-center mb-4">Danh sách Câu Trả Lời</h2>

            <div class="mb-3">
                <button type="button" class="btn btn-success" onclick="redirectToAddAnswer()" data-toggle="modal" data-target="#addAnswerModal">
                    <i class="fas fa-plus"></i> Thêm Câu Trả Lời
                </button>
            </div>

            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Answer Id</th>
                        <th scope="col">Nội dung</th>
                        <th scope="col">True/False</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${answerList}" var="answer">
                        <tr>
                            <td>${answer.getAnswer_id()}</td>
                            <td>${answer.answer_text}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${answer.is_correct eq '1'}">
                                        <i class="fas fa-check text-success"></i> 
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-times text-danger"></i> 
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editAnswerModal">
                                    <i class="fas fa-edit"></i> Sửa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Add Answer Modal -->
        <div class="modal fade" id="addAnswerModal" tabindex="-1" role="dialog" aria-labelledby="addAnswerModalLabel"
             aria-hidden="true">
            <!-- Your add answer modal content goes here -->
        </div>

        <!-- Edit Answer Modal -->
        <div class="modal fade" id="editAnswerModal" tabindex="-1" role="dialog" aria-labelledby="editAnswerModalLabel"
             aria-hidden="true">
            <!-- Your edit answer modal content goes here -->
        </div>

        <!-- Bootstrap JS và Popper.js -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
                   function redirectToAddAnswer() {
                       // Redirect to the desired URL when the button is clicked
                       window.location.href = 'teacher/addAnswer.jsp'; // Replace with the actual URL
                   }
        </script>
    </body>

</html>
