<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.UsersDAO" %>
<%@ page import="dao.FeedbackDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <!-- Feedback Banner -->
            <div class="jumbotron">
                <h1 class="display-4">Feedback for Quiz: ${quizname}</h1>
            </div>

            <!-- Feedback Input Form -->
            <div class="card mb-3">
                <div class="card-header">Leave Feedback</div>
                <div class="card-body">
                    <c:set var="count" value="0" />
                    <c:set var="countv" value="0" />
                    <form action="feedback" method="POST">
                        <c:forEach var="feedback" items="${data}">
                            <c:if test="${feedback.user_id.user_id == userid}">
                                <c:set var="count" value="${count + 1}" />
                            </c:if>
                        </c:forEach>
                        <c:forEach var="feedback" items="${data}">
                            <c:if test="${feedback.user_id.user_id == userid}">  
                                <div class="form-group">
                                    <label for="feedback">Your Feedback:</label>
                                    <textarea class="form-control" id="feedback" rows="3" name="feedbacktext" required="">${feedback.feedback_text}</textarea>
                                </div> 
                            </c:if>
                            <c:if test="${feedback.user_id.user_id != userid}">
                                <c:if test="${count == 0}">
                                    <div class="form-group">
                                        <label for="feedback">Your Feedback:</label>
                                        <textarea class="form-control" id="feedback" rows="3" name="feedbacktext" required=""></textarea> 
                                    </div>
                                </c:if>
                            </c:if>
                            <c:if test="${feedback.user_id.user_id == userid}">
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="quizid" value="${feedback.quiz_id.quiz_id}" />
                                <input type="hidden" name="feedbackid" value="${feedback.feedback_id}" />
                                <button type="submit" class="btn btn-primary">Update Feedback</button>
                                <c:set var="countv" value="${countv + 1}" />
                            </c:if>

                            <c:if test="${feedback.user_id.user_id != userid}">
                                <c:if test="${count == 0}">
                                    <input type="hidden" name="action" value="add" />
                                    <input type="hidden" name="quizid" value="${feedback.quiz_id.quiz_id}" />
                                    <button type="submit" class="btn btn-primary">Submit Feedback</button>
                                </c:if>
                            </c:if>
                            <c:set var="count" value="${count + 1}" />
                        </c:forEach>
                    </form>
                </div>
            </div>

            <!-- List of Feedback -->
            <div class="card">
                <c:if test="${countv != 0}">
                    <div class="card-header">Your Feedback</div>
                </c:if>
                <ul class="list-group list-group-flush">
                    <!-- Sample Feedback Item -->
                    <c:forEach var="feedback" items="${data}">
                        <c:if test="${feedback.user_id.user_id == userid}">
                            <li class="list-group-item">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">${feedback.user_id.username}</h5>
                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${feedback.feedback_id}">
                                        Delete
                                    </button>
                                </div>
                                <p class="mb-1">${feedback.feedback_text}</p>
                            </li>
                        </c:if>
                    </c:forEach>
                    <!-- End Sample Feedback Item -->
                </ul>

                <!-- Delete Modal -->
                <c:forEach var="feedback" items="${data}">
                    <div class="modal fade" id="deleteModal${feedback.feedback_id}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel${feedback.feedback_id}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteModalLabel${feedback.feedback_id}">Delete Feedback</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete this feedback?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <a type="button" class="btn btn-danger" href="feedback?feedbackid=${feedback.feedback_id}&quizid=${feedback.quiz_id.quiz_id}&action=delete">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- End Delete Modal -->

            </div>
            <div class="card">
                <div class="card-header">Other Feedback</div>
                <ul class="list-group list-group-flush">
                    <!-- Sample Feedback Item -->
                    <c:forEach var="feedback" items="${data}">
                        <c:if test="${feedback.user_id.user_id != userid}">
                            <li class="list-group-item">
                                <div class="d-flex justify-content-between">
                                    <h5 class="mb-1">${feedback.user_id.username}</h5>
                                    <small></small>
                                </div>
                                <p class="mb-1">${feedback.feedback_text}</p>
                            </li>
                        </c:if>
                    </c:forEach>
                    <!-- End Sample Feedback Item -->
                </ul>
            </div>

        </div>

        <!-- Bootstrap JS (Optional, if you need JavaScript) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
