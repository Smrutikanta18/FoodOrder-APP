<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.UsersData" %>

<%
    UsersData users = (UsersData) request.getSession().getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
       /* Profile page custom CSS */
       body {
           background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
           font-family: 'Poppins', sans-serif;
           padding: 20px;
           color: #333;
           line-height: 1.6;
       }

       .profile-container {
           margin: 0 auto;
           max-width: 550px;
           padding: 30px;
           border-radius: 20px;
           min-height: 60vh;
           display: flex;
           flex-direction: column;
           justify-content: space-between;
           transition: all 0.4s ease;
       }

       .profile-header {
           text-align: center;
           margin-bottom: 20px;
       }

       .profile-img {
           width: 140px;
           height: 140px;
           border-radius: 50%;
           object-fit: cover;
           border: 5px solid #007bff;
           margin-bottom: 15px;
           transition: transform 0.4s ease;
       }

       .profile-img:hover {
           transform: scale(1.1);
       }

       .profile-header h2 {
           margin-bottom: 5px;
           font-size: 2.4em;
           font-weight: 700;
           color: #343a40;
       }

       .profile-header p {
           font-size: 1.2em;
           color: #666;
           margin-top: 5px;
       }

       .profile-info {
           display: flex;
           justify-content: space-between;
           margin-bottom: 20px;
       }

       .profile-info label {
           font-weight: 600;
           font-size: 1.1em;
           color: #007bff;
           text-transform: uppercase;
           letter-spacing: 1px;
       }

       .profile-info p {
           font-size: 1.2em;
           color: #333;
           padding-left: 5px;
       }
       .sp{
        font-size: 1em;
        color: #333;
        font-weight: normal;
        text-transform:capitalize;
        }

       /* Buttons Styling */
       .profile-actions {
           text-align: center;
           margin-top: 30px;
       }

       .profile-actions .btn {
           margin: 5px;
           padding: 12px 25px;
           border-radius: 25px;
           font-size: 1.1em;
           font-weight: 500;
           letter-spacing: 0.5px;
           transition: background-color 0.4s ease, transform 0.3s ease;
           box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
       }

       .profile-actions .btn:hover {
           transform: translateY(-5px);
           box-shadow: 0 6px 14px rgba(0, 123, 255, 0.3);
       }

       .btn-primary {
           background: linear-gradient(45deg, #007bff, #0056b3);
           border: none;
           color: white;
       }

       .btn-primary:hover {
           background: linear-gradient(45deg, #0056b3, #004494);
       }

       .btn-warning {
           background: linear-gradient(45deg, #ffc107, #e0a800);
           border: none;
           color: white;
       }

       .btn-warning:hover {
           background: linear-gradient(45deg, #e0a800, #c69500);
       }

       .btn-success {
           background: linear-gradient(45deg, #28a745, #218838);
           border: none;
           color: white;
       }

       .btn-success:hover {
           background: linear-gradient(45deg, #218838, #196f31);
       }

       /* Back button styling */
       .back-btn {
           text-align: center;
           margin-top: 20px;
       }

       .back-btn a {
           text-decoration: none;
           font-size: 1.2em;
           color: #007bff;
           display: inline-flex;
           align-items: center;
           transition: color 0.3s ease;
       }

       .back-btn a i {
           margin-right: 8px;
           transition: transform 0.3s ease;
       }

       .back-btn a:hover {
           color: #0056b3;
       }

       .back-btn a:hover i {
           transform: translateX(-5px);
       }

       /* Responsive Adjustments */
       @media (max-width: 768px) {
           .profile-container {
               padding: 20px;
           }

           .profile-img {
               width: 110px;
               height: 110px;
           }

           .profile-header h2 {
               font-size: 2em;
           }

           .profile-header p {
               font-size: 1.1em;
           }

           .profile-info {
               flex-direction: column;
           }

           .profile-actions .btn {
               width: 100%;
               margin-bottom: 10px;
           }
       }
 </style>
</head>
<body>

<div class="container">
    <div class="profile-container">
        <div class="profile-header">
            <img src="http://localhost:8080/untitled/images/userProfile.png" class="profile-img" alt="Profile Image">
            <h2><%= users != null ? users.getFirstName() : "Guest" %> <%= users != null ? users.getLastName() : "" %></h2>
            <p><%= users != null ? users.getEmail() : "No email available" %></p>
        </div>

        <div class="profile-info">
            <div>
                <label>Phone Number:</label>
                <p><%= users != null ? users.getNumber() : "Not provided" %></p>
            </div>
            <div>
                <label>Email:</label>
                <p><%= users != null ? users.getEmail() : "Not provided" %></p>
            </div>
        </div>

        <div class="profile-info">
            <label>Gender: <span class="sp"><%= users != null ? users.getGender() : "Not provided" %></span></label>
        </div>

        <div class="profile-actions">
            <a href="editUserProfile.jsp?id=<%= users.getId()%>" class="btn btn-primary">Edit Profile</a>
            <a href="changePass.jsp?id=<%= users.getId()%>" class="btn btn-warning">Change Password</a>
            <a href="orders" class="btn btn-success">See Your Orders</a>
        </div>

        <div class="back-btn">
            <a href="welcome"><i class="fas fa-arrow-left"></i> Go Back</a>
        </div>
    </div>
</div>

<!-- Bootstrap and Font Awesome JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
