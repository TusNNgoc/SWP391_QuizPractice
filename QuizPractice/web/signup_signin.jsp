<%-- 
Document   : Signup_Signin
Created on : Jan 21, 2024, 5:25:44 PM
Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Quiz</title>
        <link rel="stylesheet" href="assets/css/Sigup_Signin.css">

    </head>
    <body>
     
        <input type="hidden" id="status" value="<%=request.getAttribute("status")%>"/>
        
        <h2>Sign in/up Form</h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form role="form" action="signup" method="post">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your email for registration</span>



                    <input type="text" id="username" name="username" placeholder="User Name"  autofocus="" required />
                    <input type="email" id="email" name="email" placeholder="Email" />
                    <input type="text" id="fullname" name="fullname" placeholder="Fullname" />
                    <input type="password" id="pass" name="pass" placeholder="Password" required/>
                    <!--                    <input type="password" id="re-pass" name="re_pass" placeholder="Re-Password" required/>-->

                    <label>
                        <span style="display: inline-block">
                            <input type="radio" name="role" value="1" /> Teacher
                        </span>
                        <span style="display: inline-block">
                            <input type="radio" name="role" value="2" /> Student
                        </span>
                    </label>

                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input type="email" placeholder="Email" autofocus />
                    <input type="password" placeholder="Password" />
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!<!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        //SWEETALERT LIBRARY TO SHOW MODAL
//        var status = "<%=session.getAttribute("status")%>";
        var status = document.getElementById("status").value;
        if (status === "invalid username") {
            Swal.fire({
                title: "Error",
                text: "The username need to be filled",
                icon: "error"
            });
        }
        if (status === "invalid email") {
            Swal.fire({
                title: "Error",
                text: "The email need to be filled",
                icon: "error"
            });

        }

        if (status === "invalid pass") {
            Swal.fire({
                title: "Error",
                text: "The password need to be filled",
                icon: "error"
            });

        }

        if (status === "invalid repass") {
            Swal.fire({
                title: "Error",
                text: "The re-password need to be filled",
                icon: "error"
            });

        }
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add('right-panel-active');
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove('right-panel-active');
        });
    </script>
</html>
