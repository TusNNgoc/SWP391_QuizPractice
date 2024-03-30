<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Account</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add New Account</title>
            <link rel="stylesheet" href="styles.css">
        </head>
        <body>
            <div class="container">
                <h2>Add New Account</h2>
                <form action="add" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="fullname">Full Name:</label>
                        <input type="text" id="fullname" name="fullname" required>
                    </div>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <select id="role" name="role">
                            <option value="1">Teacher</option>
                            <option value="2">Student</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" id="country" name="country">
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        Male <input type="radio" id="male" name="gender" value="male">
                        Female <input type="radio" id="female" name="gender" value="female">
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" max="<?php echo date('Y-m-d'); ?>">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone">
                    </div>
                    <button type="submit" value="save">Add Account</button>
                </form>
            </div>
        </body>


    </html>
    <script>
        function validateForm() {
            var dobInput = document.getElementById("dob").value;
            var inputDate = new Date(dobInput);
            var currentDate = new Date();

            // Lấy ngày sinh mà người dùng nhập vào
            var dobYear = inputDate.getFullYear();
            var dobMonth = inputDate.getMonth();
            var dobDay = inputDate.getDate();

            // Lấy ngày hiện tại
            var currentYear = currentDate.getFullYear();
            var currentMonth = currentDate.getMonth();
            var currentDay = currentDate.getDate();

            // So sánh ngày sinh với ngày hiện tại
            if (dobYear > currentYear ||
                    (dobYear == currentYear && dobMonth > currentMonth) ||
                    (dobYear == currentYear && dobMonth == currentMonth && dobDay > currentDay)) {
                alert("Date of Birth cannot be later than today!");
                return false;
            }
            return true;
        }

    </script>


    <style>
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select,
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        button:active {
            transform: scale(0.95);
        }

    </style>


