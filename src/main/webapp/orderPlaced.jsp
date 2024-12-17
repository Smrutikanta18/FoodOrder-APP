<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .success-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .success-circle {
            width: 80px;
            height: 80px;
            background-color: #28a745; /* Green color */
            border-radius: 50%;
            position: relative;
            margin: 0 auto; /* Center horizontally */
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            font-size: 20px;
            color: white;
            font-weight: bold;
        }

        .checkmark {
            position: absolute;
            width: 20px;
            height: 40px;
            border: solid white;
            border-width: 0 6px 6px 0;
            transform: rotate(45deg);
            top: 20px; /* Center vertically */
            left: 30px; /* Center horizontally */
        }

        .message {
            margin-top: 40px;
            font-size: 24px;
            color: #333;
            font-weight: bold;
        }

        .sub-message {
            margin-top: 10px;
            font-size: 18px;
            color: #666;
        }
    </style>
</head>
<body>

<div class="success-container">
    <div class="success-circle">
        <div class="checkmark"></div>
    </div>

    <div class="message">Payment Successful!</div>
    <div class="sub-message">Your order has been placed successfully.</div>
    <a style="color: blue;" href="welcome" > Go to home page</a>

</div>

</body>
</html>
