<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Account</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <h2>Update Account</h2>
            <form action="update" method="post"  onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="fullname">ID:</label>
                    <td>
                        <input type="text" id="user_id" name="user_id" value="${st.user_id}" readonly>
                    </td>
                </div>                <div class="form-group">
                    <label for="fullname">Full Name:</label>
                    <td>
                        <input type="text" id="fullname" name="fullname" value="${st.fullname}" required>
                    </td>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${st.username}" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="${st.password}"required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${st.email}" required>
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select id="role" name="role">
                        <option value="1" ${role_id == 1 ? 'selected' : ''}>Teacher</option>
                        <option value="2" ${role_id == 2 ? 'selected' : ''}>Student</option>
                    </select>

                </div>
                <div class="form-group">
                    <label for="country">Country:</label>
                    <input type="text" id="country" name="country" value="${st.country}">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${st.address}">
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    Male <input type="radio" id="male" name="gender" value="male" ${st.gender == 'male' ? 'checked' : ''}>
                    Female <input type="radio" id="female" name="gender" value="female" ${st.gender == 'female' ? 'checked' : ''}>
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dob" value="${st.dob}">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="${st.phone}">
                </div>
                <button type="submit">Update Account</button>
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



