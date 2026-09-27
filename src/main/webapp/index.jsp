<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>DevOps Task Manager</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<div class="navbar">


<div class="logo">
    DevOps Task Manager
</div>

<div class="nav-links">

    <a href="${pageContext.request.contextPath}/login">
        Login
    </a>

    <a href="${pageContext.request.contextPath}/register"
       class="nav-button">
        Register
    </a>

</div>


</div>

<div class="hero">


<div class="hero-content">

    <h1>
        Manage Your Tasks
        <br>
        <span>Build. Deploy. Achieve.</span>
    </h1>

    <p>
        A simple multi-tier task management application
        built using Java, Tomcat, MySQL and Vagrant.
    </p>

    <div class="hero-buttons">

        <a href="${pageContext.request.contextPath}/login"
           class="primary-button">
            Login
        </a>

        <a href="${pageContext.request.contextPath}/register"
           class="secondary-button">
            Create Account
        </a>

    </div>

</div>

</div>

<div class="features">


<div class="feature-card">

    <h3>📋 Manage Tasks</h3>

    <p>
        Create, track and manage your tasks
        from one simple dashboard.
    </p>

</div>


<div class="feature-card">

    <h3>🔐 Secure Login</h3>

    <p>
        User authentication with encrypted
        password storage.
    </p>

</div>


<div class="feature-card">

    <h3>☁️ Multi-Tier Architecture</h3>

    <p>
        Separate web, application and
        database layers.
    </p>

</div>


</div>

<footer>


<p>
    © 2026 DevOps Task Manager
</p>


</footer>

</body>

</html>
