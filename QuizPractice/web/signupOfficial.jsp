<%-- 
    Document   : newSignUp
    Created on : Jan 28, 2024, 6:01:07 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Form</title>
            <link href="assets/css/newSignup.css" type="text/css" rel="stylesheet">
        </head>
        <body>
            <div id="container_1">

                <h1 id="title">
                    Quiz Registration
                </h1><!--title-->
                <p id="description">
                    Enter the required data in the boxes.
                </p><!--description--->

            </div><!---container_1--->
            <div id="container_2">

                <form action="signup" method="post">
                    <label id="name-label">Username</label>
                    <input type="text" id="username" name="username" class="form" required placeholder="Insert your name"><br><!--name--->
                    <label id="email-label">Email</label>
                    <input type="email" id="email" name="email" class="form" required placeholder="Insert your email"><br><!---email-->

                    <label >Password</label>
                    <input type="password" id="pass" name="pass" class="form" placeholder="Password"  required><br><!---number-->
                    <label >Confirm Password</label>
                    <input type="password" id="re_pass" name="re_pass" class="form" placeholder="Re-Password"  required><br><!---number-->
                    <select name="country" id="country">
                        <c:forEach items="${mapCountries}" var="country">
                            <option value="${country.key}">${country.value}</option>
                        </c:forEach>
                    </select>
                    <!--    <label id="carrer">Carrer</label>
                        <select id="dropdown" name="role" required>
                          <option disabled selected value>
                            Select your carrer
                          </option>
                          <option value="ISC">
                            Computer Systems Engineering
                          </option>
                          <option value="IMA">
                            Automotive mechatronics engineering
                          </option>
                          <option value="II">
                            Industrial Engineering
                          </option>
                          <option value="IGE">
                            Business Management Engineering
                          </option>
                        </select>dropdown--->
                    <p>Role</p>
                    <label>
                        <input type="radio" name="role" value="2" checked>Student
                    </label>
                    <label>
                        <input type="radio" name="role" value="1">Teacher
                    </label>

                    <!--                    <p>What is your preferred mode of study?</p>
                                        <label>
                                            <input type="checkbox" name="mode" value="Online">Online
                                        </label>
                                        <label>
                                            <input type="checkbox" name="mode" value="Hybrid">Hybrid
                                        </label>
                                        <label>
                                            <input type="checkbox" name="mode" value="On site">On site
                                        </label>
                                        <p>Any comments or suggestions?</p>
                                        <textarea
                                            id="comments"
                                            name="comment"
                                            placeholder="Enter your comment here..."
                                            ></textarea>-comment-->


                    <input type="submit" id="submit" name="submit" value="Submit">
                </form><!---survey-form--->
            </div><!--container_2--->


        </body>
    </html>

</body>
</html>
