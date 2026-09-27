<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.devops.vprofile.model.User" %>

<%
    User user = (User) session.getAttribute("user");

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

    <title>DevOps Journey - DevOps Task Manager</title>

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

        <a href="${pageContext.request.contextPath}/dashboard">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>


<div class="dashboard-container">

    <div class="dashboard-header">

        <div>

            <h1>🚀 My DevOps Journey</h1>

            <p>
                Track everything I learn and implement
                during my DevOps project.
            </p>

        </div>

    </div>


    <!-- Progress -->

    <div class="dashboard-card journey-progress">

        <h2>Overall Progress</h2>

        <div class="progress-bar">

            <div class="progress-fill">
                5%
            </div>

        </div>

        <p>
            5 Days Completed
        </p>

    </div>


    <!-- Day 1 -->

    <div class="journey-card completed">

        <div class="journey-day">
            DAY 1
        </div>

        <h2>Project Setup</h2>

        <p>
            Started the DevOps Task Manager project.
        </p>

        <ul>
            <li>✅ Created project structure</li>
            <li>✅ Configured Java</li>
            <li>✅ Configured Maven</li>
            <li>✅ Created source code</li>
        </ul>

        <span class="status completed-status">
            COMPLETED
        </span>

    </div>


    <!-- Day 2 -->

    <div class="journey-card completed">

        <div class="journey-day">
            DAY 2
        </div>

        <h2>Maven Build</h2>

        <p>
            Built and packaged the Java web application.
        </p>

        <ul>
            <li>✅ mvn clean</li>
            <li>✅ mvn clean package</li>
            <li>✅ Generated WAR file</li>
            <li>✅ BUILD SUCCESS</li>
        </ul>

        <span class="status completed-status">
            COMPLETED
        </span>

    </div>


    <!-- Day 3 -->

    <div class="journey-card completed">

        <div class="journey-day">
            DAY 3
        </div>

        <h2>Tomcat Deployment</h2>

        <p>
            Deployed the WAR application to Apache Tomcat.
        </p>

        <ul>
            <li>✅ Installed Tomcat</li>
            <li>✅ Copied WAR to webapps</li>
            <li>✅ Started Tomcat</li>
            <li>✅ Opened application in browser</li>
        </ul>

        <span class="status completed-status">
            COMPLETED
        </span>

    </div>


    <!-- Day 4 -->

    <div class="journey-card completed">

        <div class="journey-day">
            DAY 4
        </div>

        <h2>MySQL Database</h2>

        <p>
            Configured MySQL and connected the application
            to the vprofile database.
        </p>

        <ul>
            <li>✅ Installed MySQL Server</li>
            <li>✅ Created vprofile database</li>
            <li>✅ Created users table</li>
            <li>✅ Created tasks table</li>
            <li>✅ Configured database connection</li>
        </ul>

        <span class="status completed-status">
            COMPLETED
        </span>

    </div>


    <!-- Day 5 -->

    <div class="journey-card completed">

        <div class="journey-day">
            DAY 5
        </div>

        <h2>Application Testing</h2>

        <p>
            Tested the complete application workflow.
        </p>

        <ul>
            <li>✅ User registration</li>
            <li>✅ Login</li>
            <li>✅ Database connection</li>
            <li>✅ Task management</li>
        </ul>

        <span class="status completed-status">
            COMPLETED
        </span>

    </div>


    <!-- Day 6 -->

    <div class="journey-card">

        <div class="journey-day">
            DAY 6
        </div>

        <h2>Git & GitHub</h2>

        <p>
            Upload the project to GitHub and learn
            version control.
        </p>

        <ul>
            <li>☐ Initialize Git</li>
            <li>☐ Create GitHub repository</li>
            <li>☐ Add project files</li>
            <li>☐ Commit changes</li>
            <li>☐ Push to GitHub</li>
        </ul>

        <span class="status upcoming-status">
            UPCOMING
        </span>

    </div>


    <!-- Day 62 -->

    <div class="journey-card docker-card">

        <div class="journey-day">
            DAY 62
        </div>

        <h2>🐳 Docker Containerization</h2>

        <p>
            Containerize the DevOps Task Manager application.
        </p>

        <ul>
            <li>☐ Install Docker</li>
            <li>☐ Create Dockerfile</li>
            <li>☐ Build Docker image</li>
            <li>☐ Run Docker container</li>
            <li>☐ Test application</li>
            <li>☐ Push image to Docker Hub</li>
        </ul>

        <span class="status upcoming-status">
            UPCOMING
        </span>

    </div>


    <!-- Day 63 -->

    <div class="journey-card">

        <div class="journey-day">
            DAY 63
        </div>

        <h2>🐳 Docker Compose</h2>

        <p>
            Run the application and database using
            Docker Compose.
        </p>

        <ul>
            <li>☐ Create docker-compose.yml</li>
            <li>☐ Configure application container</li>
            <li>☐ Configure MySQL container</li>
            <li>☐ Configure networking</li>
            <li>☐ Test multi-container application</li>
        </ul>

        <span class="status upcoming-status">
            UPCOMING
        </span>

    </div>


    <!-- Day 64 -->

    <div class="journey-card">

        <div class="journey-day">
            DAY 64
        </div>

        <h2>⚙️ CI/CD Pipeline</h2>

        <p>
            Automate build, test and deployment.
        </p>

        <ul>
            <li>☐ GitHub Actions</li>
            <li>☐ Automated Maven build</li>
            <li>☐ Automated testing</li>
            <li>☐ Docker image build</li>
            <li>☐ Push Docker image</li>
        </ul>

        <span class="status upcoming-status">
            UPCOMING
        </span>

    </div>


    <!-- Day 65 -->

    <div class="journey-card">

        <div class="journey-day">
            DAY 65
        </div>

        <h2>☁️ AWS Deployment</h2>

        <p>
            Deploy the application to AWS.
        </p>

        <ul>
            <li>☐ Create EC2 instance</li>
            <li>☐ Install Docker</li>
            <li>☐ Configure security groups</li>
            <li>☐ Deploy application</li>
            <li>☐ Test public access</li>
        </ul>

        <span class="status upcoming-status">
            UPCOMING
        </span>

    </div>

</div>

</body>

</html>