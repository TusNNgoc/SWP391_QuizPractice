<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Create quiz</title>
        <link rel="stylesheet" href="./assets/scss/Createquiz.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <!-- partial:index.partial.html -->
    <body>
        <h1 style="text-align: center">Create new quiz</h1>
        <div class="container">
            <div class="cta-form">
                <h2>Let's make a quiz!!</h2> 
                <p>Notice that your quiz can be viewed by others users.</p>
            </div>
            <form action="quizcrud" class="form" method="POST">

                <select class="form__input" id="subject" name="coursename">
                    <c:forEach var="course" items="${courseList}">
                        <option placeholder="" class="form__input" id="subject" name="courseid" value="${course.course_id}">${course.course_name}</option>
                    </c:forEach>
                </select>
                <!--<input type="number" placeholder="" class="form__input" id="subject" name="coursename"/>-->
                <label for="subject" class="form__label">Course name</label>

                <input type="text" placeholder="" class="form__input" id="name" name="quizname" required/>
                <label for="name" class="form__label">Quiz Name</label>   

                <div class="text-center">
                    <button type="submit" class="btn btn-light" style="margin-right: -60%">Tạo</button>
                    <a href="/autopart" class="btn btn-light float-right" style="text-decoration: none;" role="button" aria-pressed="true"><span style="text-decoration: none;">Hủy</span></a>
                </div>
                <!-- send input action to servlet to know what action need -->
                <input type="hidden" name="action" value="add"/>
            </form>
        </div>

    </body>
    <!-- partial -->
    <script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
    <script src='https://unpkg.com/gsap@3/dist/ScrollTrigger.min.js'></script>
</body>
</html>
