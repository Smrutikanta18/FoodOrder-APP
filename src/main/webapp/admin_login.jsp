<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #6e6d6d;
            font-family: Arial, sans-serif;
        }
        .login-container {
            margin-top: 100px;
            width: 400px;
            padding: 30px;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .form-control {
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 50px;
            padding: 10px 20px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="login-container">
        <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                        <div style="color: red; margin-bottom: 20px;"><%= errorMessage %></div>
                    <%
                        }
                    %>
            <h2>Admin Login</h2>
            <form action="admin_index" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-custom">Login</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
