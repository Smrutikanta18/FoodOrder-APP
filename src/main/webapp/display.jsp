<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submitted Data</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e3e7ed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 25px;
            font-size: 26px;
            letter-spacing: 1px;
        }

        .data-box {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            color: #555;
        }

        .data-box strong {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 6px;
            background-color: #f1f1f1;
            transition: background-color 0.3s ease, color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
        }

        .back-link:hover {
            background-color: #007bff;
            color: #fff;
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Submitted Data</h1>
        <div class="data-box">
            <strong>Email:</strong> ${email}
        </div>
        <div class="data-box">
            <strong>Password:</strong> ${password}
        </div>
        <a href="index.jsp" class="back-link">Go back</a>
    </div>
</body>
</html>
