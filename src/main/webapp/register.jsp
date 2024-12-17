<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            background-color: #1a1a1a; /* Light black background */
            margin: 0;
            color: #fff; /* White text for better readability */
        }

        .main {
            padding: 30px;
            width: 90%; /* Full width for responsiveness */
            max-width: 450px; /* Reduced maximum width */
            box-sizing: border-box;
            text-align: center;
        }

        .main h2 {
            color: white;
            margin-bottom: 20px;
            font-size: 28px; /* Increased font size */
            font-weight: 600;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            width: 100%; /* Full width for responsiveness */
        }

        .form-group {
            flex: 1; /* Equal space for all inputs */
            margin-right: 10px; /* Space between inputs */
        }

        .form-group:last-child {
            margin-right: 0; /* Remove margin from last child */
        }

        label {
            display: block;
            color: white;
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        select {
            width: 100%; /* Full width for uniformity */
            height: 40px; /* Increased height for better accessibility */
            padding: 5px; /* Padding for input fields */
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="tel"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        button[type="submit"] {
            width: 60%;
            height: 40px; /* Increased button height */
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid red;
            border-radius: 5px;
            background-color: rgba(255, 0, 0, 0.1); /* Slightly transparent red */
            text-align: center;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
        }

        p {
            margin-top: 20px;
            font-size: 14px;
            color: white;
        }

        @media (max-width: 600px) {
            .main {
                padding: 20px;
            }

            .main h2 {
                font-size: 24px; /* Decreased title font size on smaller screens */
            }

            input[type="text"],
            input[type="email"],
            input[type="password"],
            input[type="tel"],
            select,
            button[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="main">
        <h2>REGISTER HERE</h2>
        <%
            String error_message = (String) request.getAttribute("error_message");
            if (error_message != null) {
        %>
            <div class="error-message"><%= error_message %></div>
        <%
            }
        %>
        <form action="Form" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="first">First Name:</label>
                    <input type="text" name="first" required />
                </div>
                <div class="form-group">
                    <label for="last">Last Name:</label>
                    <input type="text" name="last" required />
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" required />
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required />
                </div>
                <div class="form-group">
                    <label for="mobile">Contact:</label>
                    <input type="tel" name="mobile" maxlength="10" required />
                </div>
            </div>

            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <button type="submit">Submit</button>
        </form>

        <p>Already registered? <a href="login.jsp">Login here</a></p>
        <p class="go"><a href="welcome">Welcome To app</a></p>
    </div>
</body>
</html>
