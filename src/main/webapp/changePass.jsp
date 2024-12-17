<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.UsersData" %>

<%
    UsersData users = (UsersData) request.getSession().getAttribute("users");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">


        <style>
            /* Global Styles */
            body {
                background-color: #f0f2f5;
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Container Styles */
            .change-password-container {
                margin: 0px ;
                max-width: 350px;
                max-height: 580px;
                background-color: #fff;
                padding: 30px;
                border-radius: 15px;
                transition: all 0.3s ease-in-out;
            }



            /* Header Styles */
            .change-password-header h2 {
                font-size: 2.2rem;
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
                letter-spacing: 1px;
                text-transform: uppercase;
                position: relative;
            }

            .change-password-header h2::after {
                content: "";
                display: block;
                width: 60px;
                height: 3px;
                background-color: #007bff;
                margin: 10px auto 0;
            }

            /* Button Styles */
            .btn-primary {
                background-color: #007bff;
                border: none;
                font-size: 1.1rem;
                padding: 10px 30px;
                border-radius: 25px;
                transition: all 0.3s ease;
                display: inline-block;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

            .back-btn a {
                font-size: 1.1rem;
                color: #007bff;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                margin-bottom: 20px;
                font-weight: 500;
                transition: color 0.3s ease;
            }

            .back-btn a:hover {
                color: #0056b3;
            }

            .back-btn i {
                margin-right: 8px;
            }

            /* Form Styles */
            .form-group label {
                font-size: 1rem;
                color: #555;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .form-control {
                border-radius: 8px;
                padding: 10px 15px;
                font-size: 1rem;
                border: 1px solid #ddd;
                transition: border 0.3s ease, box-shadow 0.3s ease;
            }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            }

            .form-actions {
                margin-top: 20px;
            }

            /* Alert Styles */
            .alert {
                font-size: 0.95rem;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            /* Error Message Styles */
            .error-message {
                color: #d9534f;
                display: none;
                font-size: 0.875rem;
                margin-top: 10px;
            }

            /* Mobile Styles */
            @media (max-width: 576px) {
                .change-password-container {
                    padding: 20px;
                }

                .change-password-header h2 {
                    font-size: 1.8rem;
                }

                .btn-primary {
                    font-size: 1rem;
                    padding: 8px 25px;
                }

                .back-btn a {
                    font-size: 1rem;
                }
            }
        </style>

</head>
<body>

<div class="container">
    <div class="change-password-container">
        <div class="back-btn">
            <a href="userProfile.jsp?id=<%= users != null ? users.getId() : "" %>"><i class="fas fa-arrow-left"></i> Go Back</a>
        </div>
 <%

                                                 // Retrieve and remove success message from the session
                                                 String successMessage = (String) request.getSession().getAttribute("successMessage");
                                                 if (successMessage != null) {
                                                     request.getSession().removeAttribute("successMessage");
                                             %>
                                                 <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                     <%= successMessage %>
                                                     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                 </div>
                                                 <script>
                                                     setTimeout(function() {
                                                         document.querySelector('.alert-success').classList.remove('show');
                                                     }, 2000); // Hide message after 2 seconds
                                                 </script>
                                             <%
                                                 }
                                             %>

                                             <%
                                                 // Retrieve and remove error message from the session
                                                 String errorMessage = (String) request.getSession().getAttribute("errorMessage");
                                                 if (errorMessage != null) {
                                                     request.getSession().removeAttribute("errorMessage");
                                             %>
                                                 <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                     <%= errorMessage %>
                                                     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                 </div>
                                                 <script>
                                                     setTimeout(function() {
                                                         document.querySelector('.alert-danger').classList.remove('show');
                                                     }, 2000); // Hide message after 2 seconds
                                                 </script>
                                             <%
                                                 }
                                             %>
        <div class="change-password-header">
            <h2>Change Password</h2>
        </div>

        <form id="changePasswordForm" action="userChangePassword" method="POST">
        <input type="hidden" name="id" value="<%= users != null ? users.getId() : "" %>">

            <div class="form-group">
                <label for="userEmail">Your Email</label>
                <input type="email" class="form-control" id="userEmail" name="userEmail" required>
            </div>
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmNewPassword">Confirm New Password</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
                <div id="errorMessage" class="error-message">Passwords do not match!</div>
            </div>
            <div class="form-actions text-center">
                <button type="submit" class="btn btn-primary">Change</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap and Font Awesome JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
    document.getElementById('changePasswordForm').addEventListener('submit', function (event) {
        var newPassword = document.getElementById('newPassword').value;
        var confirmNewPassword = document.getElementById('confirmNewPassword').value;
        var errorMessage = document.getElementById('errorMessage');

        if (newPassword !== confirmNewPassword) {
            event.preventDefault(); // Prevent form submission
            errorMessage.style.display = 'block'; // Show error message
        } else {
            errorMessage.style.display = 'none'; // Hide error message
        }
    });
</script>

</body>
</html>
