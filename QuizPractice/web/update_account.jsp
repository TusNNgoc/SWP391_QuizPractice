<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Account</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <h2>Update Account</h2>
            <c:set var="c" value="${requestScope.user}"/>
                   <form action="update" method="get" >
                       <input type="hidden" id="user_id" name="user_id" value="${c.user_id}">

                       <div class="form-group">
                           <label for="fullname">Full Name:</label>
                           <input type="text" id="fullname" name="fullname" value="${c.fullname}" required>
                       </div>
                       <div class="form-group">
                           <label for="username">Username:</label>
                           <input type="text" id="username" name="username" value="${c.username}" required>
                       </div>
                       <div class="form-group">
                           <label for="password">Password:</label>
                           <input type="password" id="password" name="password" value="${c.password}" required>
                       </div>
                       <div class="form-group">
                           <label for="email">Email:</label>
                           <input type="email" id="email" name="email" value="${c.email}" required>
                       </div>
                       <div class="form-group">
                           <label for="role">Role:</label>
                           <input type="text" id="country" name="country" value="${c.role_id}">

                       </div>
                       <div class="form-group">
                           <label for="country">Country:</label>
                           <input type="text" id="country" name="country" value="${c.country}">
                       </div>
                       <div class="form-group">
                           <label for="address">Address:</label>
                           <input type="text" id="address" name="address" value="${c.address}">
                       </div>
                       <div class="form-group">
                           <label for="gender">Gender:</label>
                           <input type="text" id="dob" name="dob" value="${c.gender}">

                       </div>
                       <div class="form-group">
                           <label for="dob">Date of Birth:</label>
                           <input type="date" id="dob" name="dob" value="${c.dob}">
                       </div>
                       <div class="form-group">
                           <label for="phone">Phone:</label>
                           <input type="text" id="phone" name="phone" value="${c.phone}">
                       </div>
                       <button type="submit">Update Account</button>
                   </form>
            </div>
        </body>


    </html>

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
