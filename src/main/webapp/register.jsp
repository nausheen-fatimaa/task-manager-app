<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Register - DevOps Task Manager</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">


</head>

<body class="auth-page">

<div class="auth-container">


<div class="auth-card">

    <h1>Create Account</h1>

    <p class="auth-subtitle">
        Start managing your tasks
    </p>


    <% if (request.getAttribute("error") != null) { %>

        <div class="error-message">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <form action="${pageContext.request.contextPath}/register"
          method="post">


        <div class="form-group">

            <label>Name</label>

            <input type="text"
                   name="name"
                   placeholder="Enter your name"
                   required>

        </div>


        <div class="form-group">

            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>


        <div class="form-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   minlength="6"
                   required>

        </div>


        <button type="submit"
                class="primary-button full-width">

            Create Account

        </button>

    </form>


    <p class="auth-footer">

        Already have an account?

        <a href="${pageContext.request.contextPath}/login">
            Login
        </a>

    </p>


    <p class="back-link">

        <a href="${pageContext.request.contextPath}/">
            ← Back to Home
        </a>

    </p>

</div>


</div>

</body>

</html>
