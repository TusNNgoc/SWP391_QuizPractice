<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Create question</title>
        <link rel="stylesheet" href="./assets/scss/Createquiz.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <!-- partial:index.partial.html -->
    <body>
        <h1 style="text-align: center">Add questions</h1>
        <div class="container">
            <div class="cta-form">
                <h2>Add question to your quiz!!</h2> 
                <p>Notice that your quiz can be viewed by others users.</p>
            </div>
            <form action="quizcrud" class="form" method="POST">

                <input type="text" placeholder="" class="form__input" id="name" name="question" required/>
                <label for="name" class="form__label">Question</label>

                <select class="form__input" id="subject" name="coursename">
                    <c:forEach var="type" items="${typeList}">
                        <option placeholder="Type" class="form__input" id="subject" name="typeid" value="${type.type_id}">${type.type_name}</option>
                    </c:forEach>
                </select>
                <!--<input type="number" placeholder="" class="form__input" id="subject" name="quizid" required/>-->
                <label for="subject" class="form__label">Type</label>
                <c:if test="${error != null}">
                    <span class="text-danger">${error}</span><br>
                </c:if>
                <div class="text-center">
                    <button type="submit" class="btn btn-light" style="margin-right: -60%">Tạo</button>
                    <a href="/autopart" class="btn btn-light float-right" style="text-decoration: none;" role="button" aria-pressed="true"><span style="text-decoration: none;">Hủy</span></a>
                </div>
                <!-- send input action to servlet to know what action need -->
                <input type="hidden" name="action" value="addquestion"/>
            </form>
        </div>

    </body>
    <!-- partial -->
    <script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
    <script src='https://unpkg.com/gsap@3/dist/ScrollTrigger.min.js'></script>
</body>
</html>
