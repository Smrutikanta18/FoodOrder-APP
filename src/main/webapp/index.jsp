<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #74A388;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .welcome-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .welcome-container h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        .welcome-container button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: blue;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .welcome-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<form action="register.jsp">
    <div class="welcome-container">
        <h1>Welcome to the Application!</h1>
        <button >Go for Registration</button>
    </div>
    </form>
</body>
</html>
