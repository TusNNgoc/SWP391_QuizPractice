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
        <link href="assets/css/newSignup.css" type="text/css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        
         
    
    </head>
    <body>

        <input type="hidden" id="status" value="<%=request.getAttribute("status")%>"/>

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
                <input type="text" id="username" name="username" class="form" required placeholder="Insert your name"  pattern="^\S+$" 
                       title="Username cannot contain spaces"><br><!--name--->
                <label id="email-label">Email</label>
                <input type="email" id="email" name="email" class="form" required placeholder="Insert your email"><br><!---email-->

                <label >Password</label>
                <input type="password" id="pass" name="pass" class="form" placeholder="Password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$"
                       title=" Password must contain at least one digit, one uppercase letter, one lowercase letter, and be at least 6 characters long" required><br><!---number-->




                <label >Confirm Password</label>
                <input type="password" id="re_pass" name="re_pass" class="form" placeholder="Re-Password"  required><br><!---number-->



                <label>Address</label>
                <input type="text" id="address" name="address" class="form" required placeholder="Insert your address"><br><!---address-->

                <label>Date of Birth</label>
                <input type="date" id="dob" name="dob" class="form" required><br><!---dob-->

                <label>Gender</label>
                <select name="gender" id="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select><br><!---gender-->

                <label>Phone</label>
                <input type="tel" id="phone" name="phone" class="form" required placeholder="Insert your phone number" pattern="^[0-9]{9,12}$" 
                       title="Please enter a valid phone number"><br><!---phone-->

                <select name="country" id="country">
                    <c:forEach items="${mapCountries}" var="country">
                        <option value="${country.key}">${country.value}</option>
                    </c:forEach>
                </select>

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


                <input type="submit" id="submit" name="submit" value="Signup">
            </form><!---survey-form--->
        </div><!--container_2--->
  <script>
        
            var status = document.getElementById("status").value;
            if (status === "password don't match") {
                Swal.fire({
                    title: "Error",
                    text: "Password do not match. Please try again",
                    icon: "error"
                });
            }
        
    </script>

    </body>



</html>
