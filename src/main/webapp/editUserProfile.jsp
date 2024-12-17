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
    <title>Edit User Profile</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Edit Profile page custom CSS */
        body {
            background-color: #f7f7f7;
            font-family: 'Arial', sans-serif;
        }

        .edit-container {
            max-width: 500px;
            background-color: #f7f7f7;
        }

        .edit-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .edit-header h2 {
            font-size: 2em;
            font-weight: bold;
            color: #343a40;
        }

        .back-btn {
            margin-top: 15px;
            display: flex;
            justify-content: flex-start;
        }

        .back-btn a {
            text-decoration: none;
            font-size: 1.2em;
            color: #007bff;
        }

        .back-btn a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="edit-container">
        <div class="back-btn">
            <a href="userProfile?id=<%= users.getId()%>"><i class="fas fa-arrow-left"></i> Go Back</a>
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
        <div class="edit-header">
            <h2>Edit Profile</h2>
        </div>

        <form action="editUserData" method="POST">
            <input type="hidden" name="id" value="<%= users != null ? users.getId() : "" %>">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="<%= users != null ? users.getFirstName() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="<%= users != null ? users.getLastName() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= users != null ? users.getEmail() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" class="form-control" id="phoneNumber" name="number" value="<%= users != null ? users.getNumber() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male" <%= users != null && "Male".equals(users.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= users != null && "Female".equals(users.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= users != null && "Other".equals(users.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>
            <div class="form-actions text-center">
                <button type="submit" class="btn btn-primary">Update Profile</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap and Font Awesome JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
