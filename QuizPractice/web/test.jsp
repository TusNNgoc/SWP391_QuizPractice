<%-- 
    Document   : test
    Created on : Mar 4, 2024, 8:51:10 AM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Quiz</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f8f8;
            }

            #quiz-form {
                display: flex;
                max-width: 800px;
                width: 100%;
                padding: 30px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                border-radius: 8px;
            }

            #left-column {
                flex: 1;
                padding-right: 20px;
            }

            #right-column {
                flex: 2;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                color: #555;
            }

            input[type="text"], textarea {
                width: calc(100% - 16px);
                padding: 12px;
                margin-bottom: 16px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                transition: border-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
            }

            input[type="text"]:focus, textarea:focus {
                border-color: #4caf50;
                background-color: #fff;
            }

            button {
                background-color: #4caf50;
                color: #fff;
                padding: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
                transition: background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #45a049;
            }

            img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .reset-btn {
                background-color: #ccc;
                color: #333;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 14px;
                transition: background-color 0.3s ease-in-out;
            }

            .reset-btn:hover {
                background-color: #999;
            }
        </style>
    </head>
    <body>
        <div id="quiz-form">
            <div id="left-column">
                <label for="quiz-image">Quiz Image URL:</label>
                <input type="text" id="quiz-image" name="quiz-image" placeholder="Enter image URL" value="https://via.placeholder.com/300">
                <img id="preview-image" alt="Quiz Preview" src="https://via.placeholder.com/300">
            </div>

            <div id="right-column">
                <h2>Add Quiz</h2>
                <form id="add-quiz-form">
                    <label for="quiz-name">Quiz Name:</label>
                    <input type="text" id="quiz-name" name="quiz-name" required>

                    <label for="quiz-content">Quiz Content:</label>
                    <textarea id="quiz-content" name="quiz-content" rows="4" required></textarea>

                    <button type="button" onclick="addQuiz()">Add Quiz</button>

                    <button type="button" class="reset-btn" onclick="resetForm()">Reset Form</button>
                </form>
            </div>
        </div>

        <script>
            function addQuiz() {
                var quizNameInput = document.getElementById('quiz-name');
                var quizContentInput = document.getElementById('quiz-content');
                var quizImageInput = document.getElementById('quiz-image');

                var quizName = quizNameInput.value;
                var quizContent = quizContentInput.value;
                var quizImage = quizImageInput.value;

                if (quizName.trim() !== '' && quizContent.trim() !== '') {
                    // Check the image URL format
                    if (/^https?:\/\/\S+\.\S+$/i.test(quizImage)) {
                        document.getElementById('preview-image').src = quizImage;
                    } else {
                        alert('Invalid image URL. Please enter a valid URL.');
                        return;
                    }

                    // Do something with the quiz details (e.g., send to server, display on the page)
                    console.log('Quiz Name: ' + quizName);
                    console.log('Quiz Content: ' + quizContent);
                    console.log('Quiz Image: ' + quizImage);

                    // Clear the input fields
                    quizNameInput.value = '';
                    quizContentInput.value = '';
                    quizImageInput.value = '';

                    // Reset preview image
                    document.getElementById('preview-image').src = '';
                } else {
                    alert('Please fill out both quiz name and quiz content fields.');
                }
            }

            function resetForm() {
                document.getElementById('add-quiz-form').reset();
                document.getElementById('preview-image').src = '';
            }
        </script>
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Quiz</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f8f8;
            }

            #quiz-form {
                display: flex;
                max-width: 800px;
                width: 100%;
                padding: 30px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                border-radius: 8px;
            }

            #left-column {
                flex: 1;
                padding-right: 20px;
            }

            #right-column {
                flex: 2;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                color: #555;
            }

            input[type="text"], textarea {
                width: calc(100% - 16px);
                padding: 12px;
                margin-bottom: 16px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                transition: border-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
            }

            input[type="text"]:focus, textarea:focus {
                border-color: #4caf50;
                background-color: #fff;
            }

            button {
                background-color: #4caf50;
                color: #fff;
                padding: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
                transition: background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #45a049;
            }

            button.success {
                background-color: #45a049;
            }

            button.success:hover {
                background-color: #4caf50;
            }

            img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .reset-btn {
                background-color: #ccc;
                color: #333;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 14px;
                transition: background-color 0.3s ease-in-out;
            }

            .reset-btn:hover {
                background-color: #999;
            }

            .notification {
                display: none;
                padding: 15px;
                background-color: #45a049;
                color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .close-btn {
                float: right;
                font-size: 18px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div id="quiz-form">
            <div id="left-column">
                <label for="quiz-image">Quiz Image URL:</label>
                <input type="text" id="quiz-image" name="quiz-image" placeholder="Enter image URL" value="https://via.placeholder.com/300">
                <img id="preview-image" alt="Quiz Preview" src="https://via.placeholder.com/300">
            </div>

            <div id="right-column">
                <h2>Add Quiz</h2>
                <form id="add-quiz-form">
                    <label for="quiz-name">Quiz Name:</label>
                    <input type="text" id="quiz-name" name="quiz-name" required>

                    <label for="quiz-content">Quiz Content:</label>
                    <textarea id="quiz-content" name="quiz-content" rows="4" required></textarea>

                    <button type="button" onclick="addQuiz()">Add Quiz</button>

                    <button type="button" class="reset-btn" onclick="resetForm()">Reset Form</button>

                    <form action="signin">
                        <button type="submit" id="back-to-home">Back to Home</button>
                    </form>


                </form>
            </div>
        </div>

        <div id="notification" class="notification">
            <span class="close-btn" onclick="closeNotification()">&times;</span>
            Quiz added successfully!
        </div>

        <script>
            function addQuiz() {
                var quizNameInput = document.getElementById('quiz-name');
                var quizContentInput = document.getElementById('quiz-content');
                var quizImageInput = document.getElementById('quiz-image');

                var quizName = quizNameInput.value;
                var quizContent = quizContentInput.value;
                var quizImage = quizImageInput.value;

                if (quizName.trim() !== '' && quizContent.trim() !== '') {
                    // Check the image URL format
                    if (/^https?:\/\/\S+\.\S+$/i.test(quizImage)) {
                        document.getElementById('preview-image').src = quizImage;
                    } else {
                        alert('Invalid image URL. Please enter a valid URL.');
                        return;
                    }

                    // Do something with the quiz details (e.g., send to server, display on the page)
                    console.log('Quiz Name: ' + quizName);
                    console.log('Quiz Content: ' + quizContent);
                    console.log('Quiz Image: ' + quizImage);

                    // Clear the input fields
                    quizNameInput.value = '';
                    quizContentInput.value = '';
                    quizImageInput.value = '';

                    // Reset preview image
                    document.getElementById('preview-image').src = '';

                    // Show success notification
                    showNotification();
                } else {
                    alert('Please fill out both quiz name and quiz content fields.');
                }
            }

            function resetForm() {
                document.getElementById('add-quiz-form').reset();
                document.getElementById('preview-image').src = '';
            }

            function showNotification() {
                var notification = document.getElementById('notification');
                notification.style.display = 'block';

                // Hide the notification after 3 seconds
                setTimeout(function () {
                    notification.style.display = 'none';
                }, 3000);
            }

            function closeNotification() {
                var notification = document.getElementById('notification');
                notification.style.display = 'none';
            }
        </script>
    </body>
</html>






