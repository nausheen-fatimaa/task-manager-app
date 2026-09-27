<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Login - DevOps Task Manager</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

</head>

<body class="auth-page">

<div class="auth-container">


<div class="auth-card">

    <h1>Welcome Back</h1>

    <p class="auth-subtitle">
        Login to your account
    </p>


    <% if (request.getAttribute("error") != null) { %>

        <div class="error-message">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <% if ("true".equals(request.getParameter("registered"))) { %>

        <div class="success-message">

            Registration successful.
            Please login.

        </div>

    <% } %>


    <form action="${pageContext.request.contextPath}/login"
          method="post">


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
                   placeholder="Enter your password"
                   required>

        </div>


        <button type="submit"
                class="primary-button full-width">

            Login

        </button>

    </form>


    <p class="auth-footer">

        Don't have an account?

        <a href="${pageContext.request.contextPath}/register">
            Create one
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
