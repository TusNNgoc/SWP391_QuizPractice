<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <form class="login-form" id="loginForm" action="LoginServlet" method="post">
            <h2>Login</h2>
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Login</button>
            <div class="bottom-text">
            </div>
        </form>
    </div>

    <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Ng?n ch?n vi?c submit form m?c ??nh

            // L?y giá tr? c?a username và password t? form
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            // Ki?m tra username và password
            if (username === "admin" && password === "admin123") {
                // N?u ??ng nh?p thành công, chuy?n h??ng ??n trang index.jsp
                window.location.href = "admin_home.jsp";
            } else {
                // N?u ??ng nh?p không thành công, thông báo và cho ng??i dùng nh?p l?i
                alert("Login Again");
            }
        });
    </script>
</body>
<style>
    /* CSS styles go here */
</style>
</html>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-form {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-form h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-color: #4caf50;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .bottom-text {
            text-align: center;
        }

        .bottom-text a {
            color: #4caf50;
            text-decoration: none;
        }

        .bottom-text a:hover {
            text-decoration: underline;
        }

    </style>
    
    
</html>
