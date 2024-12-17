<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>

<%
UsersData users=(UsersData)request.getSession().getAttribute("users");
if(users != null){
response.sendRedirect("welcome");
}
%>
<html>
<style>
body {
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: sans-serif;
    line-height: 1.5;
    min-height: 100vh;
    background: grey;
    flex-direction: column;
    margin: 0;
}

.main {
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    padding: 10px 20px;
    transition: transform 0.2s;
    width: 100vw;
    height: 100vh;
    box-sizing: border-box;
    text-align: center;
    background-image: url('http://localhost:8080/untitled/images/img.png');
    background-size: cover;
    background-position: center;
}

h1, h3, p {
    color: white;
}

label {
    display: block;
    width: 77%;
    margin-top: 10px;
    margin-bottom: 5px;
    text-align: center;
    color: white;
    font-weight: bold;
}

input {
    display: block;
    width: 30%;
    margin-bottom: 15px;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin: 0 auto;
}

button {
    padding: 15px;
    border-radius: 10px;
    margin-top: 15px;
    margin-bottom: 15px;
    margin-left: 1000px;
    margin-right: 1000px;
    border: none;
    color: white;
    cursor: pointer;
    background-color: Blue;
    width: 100%;
    font-size: 16px;
}


.wrap {
    display: flex;
    justify-content: center;
    align-items: center;
}

a {
    color: red;
}
</style>

<body>
    <div class="main">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div style="color: red; margin-bottom: 20px;"><%= errorMessage %></div>
        <%
            }
        %>

        <h1>LOGIN HERE</h1>
        <h3>Enter your login data here to login</h3>
        <form action="login" method="get">
            <label for="first">Username:</label>
            <input type="text" name="email" placeholder="Enter your Username/email" required>

            <label for="password">Password:</label>
            <input type="password" name="password" placeholder="Enter your Password" required>

            <div class="wrap">
                <button type="submit">Submit</button>
            </div>
        </form>

        <p>Not registered?
            <a href="register.jsp" style="text-decoration: none;">
                Create an account
            </a>
        </p>
        <p>
                    <a href="welcome" style="text-decoration: none;">
                         Go to app
                    </a>
                </p>
    </div>
</body>
</html>
