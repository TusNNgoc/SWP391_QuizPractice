<%-- 
    Document   : ForgetPassword
    Created on : Jan 22, 2024, 2:47:42 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Reset Password</title>
        <link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">
        <link href="classic.css" rel="stylesheet">
    </head>

    <body>
        <main class="main d-flex w-100">
            <div class="container d-flex flex-column">
                <div class="row h-100">
                    <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                        <div class="d-table-cell align-middle">
                            <div class="card">
                                <div class="card-body">
                                    <div class="m-sm-4">
                                        <div class="text-center">
                                            <img src="./assets/img/Quizz.jpg" alt="avatar"
                                                 class="img-fluid rounded-circle" width="132" height="132">
                                        </div><br>
                                        <div style="text-align: center"><h1>Reset your password</h1></div><br>
                                        <form id="login-form" action="resetpassword"  method="POST"> 
                                            <div class="form-group">
                                                <label class="form-label required">Enter your email</label>
                                                <input class="form-control form-control-lg" type="text"
                                                       placeholder="Email" 
                                                       name="email" id="login-validation-password-input" required>
                                            </div>
                                            <c:if test="${error != null}">
                                                <span class="text-danger">${error}</span>
                                            </c:if>
                                            <input type="hidden" name="action" value="check">
                                            <div class="row">
                                                <div class="text-center mt-3 col-lg-6">
                                                    <button type="submit" class="btn btn-lg btn-primary">Get code</button>
                                                </div>
                                                <div class="text-center mt-3 col-lg-6">
                                                    <button type="button" class="btn btn-lg btn-primary"
                                                            href="/home">
                                                        Return
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>
