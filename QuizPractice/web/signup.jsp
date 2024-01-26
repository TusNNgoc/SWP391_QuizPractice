<!-- signup.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Sign Up</title>
    <link rel="stylesheet" href="assets/css/Sigup_Signin.css">
</head>
<body>
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>"/>
    <h2>Create Account</h2>
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
                <!-- Add additional input fields as needed -->
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
    </div>
    <!-- Script JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        var status = document.getElementById("status").value;
        if (status === "invalid username") {
            Swal.fire({
                title: "Error",
                text: "The username needs to be filled",
                icon: "error"
            });
        }
        if (status === "invalid email") {
            Swal.fire({
                title: "Error",
                text: "The email needs to be filled",
                icon: "error"
            });
        }
        if (status === "invalid pass") {
            Swal.fire({
                title: "Error",
                text: "The password needs to be filled",
                icon: "error"
            });
        }
        if (status === "invalid repass") {
            Swal.fire({
                title: "Error",
                text: "The re-password needs to be filled",
                icon: "error"
            });
        }
    </script>
</body>
</html>
