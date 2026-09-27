<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.devops.vprofile.model.User" %>

<%

User user =
        (User) session.getAttribute("user");

if (user == null) {

    response.sendRedirect(
            request.getContextPath() + "/login"
    );

    return;
}


%>

<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Dashboard - DevOps Task Manager</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">


</head>

<body>

<div class="navbar">


<div class="logo">
    DevOps Task Manager
</div>

<div class="nav-links">

    <span class="welcome">
        Hello, <%= user.getName() %>
    </span>

    <a href="${pageContext.request.contextPath}/logout">
        Logout
    </a>

</div>

</div>

<div class="dashboard-container">

<div class="dashboard-header">

    <div>

        <h1>
            Dashboard
        </h1>

        <p>
            Welcome back, <%= user.getName() %>!
        </p>

    </div>


    <a href="${pageContext.request.contextPath}/tasks"
       class="primary-button">

        Manage Tasks

    </a>

    <a href="${pageContext.request.contextPath}/journey"
       class="primary-button">
        🚀 DevOps Journey
    </a>

</div>


<div class="dashboard-cards">


    <div class="dashboard-card">

        <div class="card-icon">
            📋
        </div>

        <h3>
            My Tasks
        </h3>

        <p>
            Create and manage your tasks.
        </p>

        <a href="${pageContext.request.contextPath}/tasks">
            View Tasks →
        </a>

    </div>


    <div class="dashboard-card">

        <div class="card-icon">
            👤
        </div>

        <h3>
            My Profile
        </h3>

        <p>
            Name: <%= user.getName() %>
        </p>

        <p>
            Email: <%= user.getEmail() %>
        </p>

    </div>


    <div class="dashboard-card">

        <div class="card-icon">
            🚀
        </div>

        <h3>
            DevOps Project
        </h3>

        <p>
            Multi-tier application architecture
            running on separate servers.
        </p>

    </div>


</div>


</div>

</body>

</html>
