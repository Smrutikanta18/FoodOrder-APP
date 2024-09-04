<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Form</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f9; /* Slightly lighter background for contrast */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    form {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      max-width: 450px;
      width: 100%;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    form:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
    }

    .form-group label {
      font-weight: 600;
      color: #333;
      display: block;
      margin-bottom: 8px;
    }

    .form-group input {
      width: 100%;
      padding: 14px;
      margin-top: 6px;
      margin-bottom: 24px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 16px;
      transition: border-color 0.3s ease;
    }

    .form-group input:focus {
      border-color: #0056b3;
      outline: none;
      box-shadow: 0 0 5px rgba(0, 86, 179, 0.5);
    }
    .form-control{
    margin-right:50px;
    }

    .form-check {
      display: flex;
      align-items: center;
      margin-bottom: 24px;
    }

    .form-check-input {
      margin-right: 12px;
    }

    .form-check-label {
      color: #666;
    }

    button {
      width: 100%;
      padding: 14px;
      border: none;
      border-radius: 8px;
      background-color: #0056b3;
      color: #ffffff;
      font-size: 18px;
      font-weight: 600;
      cursor: pointer;
      box-shadow: 0 6px 15px rgba(0, 86, 179, 0.3);
      transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
    }

    button:hover {
      background-color: #003d7a;
      box-shadow: 0 8px 20px rgba(0, 86, 179, 0.4);
      transform: translateY(-5px);
    }

    small {
      display: block;
      margin-top: -8px;
      margin-bottom: 24px;
      color: #888;
    }
  </style>
</head>
<body>
  <form action="Form" method="post">
   <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
      %>
        <div style="color: red; margin-bottom: 20px;"><%= errorMessage %></div>
      <%
        }
      %>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</body>
</html>
