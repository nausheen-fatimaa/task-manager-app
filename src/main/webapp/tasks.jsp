<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.devops.vprofile.model.Task" %>

<%


List<Task> tasks =
        (List<Task>) request.getAttribute("tasks");

%>

<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>My Tasks - DevOps Task Manager</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">


</head>

<body>

<div class="navbar">


<div class="logo">
    DevOps Task Manager
</div>

<div class="nav-links">

    <a href="${pageContext.request.contextPath}/dashboard">
        Dashboard
    </a>

    <a href="${pageContext.request.contextPath}/logout">
        Logout
    </a>

</div>


</div>

<div class="tasks-container">


<div class="tasks-header">

    <div>

        <h1>
            My Tasks
        </h1>

        <p>
            Manage your work and track your progress.
        </p>

    </div>

</div>


<div class="add-task-card">

    <h2>
        Add New Task
    </h2>


    <form action="${pageContext.request.contextPath}/tasks"
          method="post">

        <input type="hidden"
               name="action"
               value="create">


        <div class="form-group">

            <label>
                Task Title
            </label>

            <input type="text"
                   name="title"
                   placeholder="Enter task title"
                   required>

        </div>


        <div class="form-group">

            <label>
                Description
            </label>

            <textarea name="description"
                      placeholder="Enter task description"></textarea>

        </div>


        <button type="submit"
                class="primary-button">

            + Add Task

        </button>

    </form>

</div>


<div class="task-list">


    <h2>
        Your Tasks
    </h2>


    <% if (tasks == null || tasks.isEmpty()) { %>

        <div class="empty-state">

            <p>
                You don't have any tasks yet.
            </p>

        </div>

    <% } else { %>


        <% for (Task task : tasks) { %>


            <div class="task-card">


                <div class="task-content">

                    <h3>
                        <%= task.getTitle() %>
                    </h3>

                    <p>
                        <%= task.getDescription() %>
                    </p>

                    <span class="status
                        <%= "COMPLETED".equals(task.getStatus())
                            ? "completed"
                            : "pending" %>">

                        <%= task.getStatus() %>

                    </span>

                </div>


                <div class="task-actions">


                    <% if ("COMPLETED".equals(task.getStatus())) { %>

                        <form action="${pageContext.request.contextPath}/tasks"
                              method="post">

                            <input type="hidden"
                                   name="action"
                                   value="reopen">

                            <input type="hidden"
                                   name="taskId"
                                   value="<%= task.getId() %>">

                            <button type="submit"
                                    class="secondary-button">

                                Reopen

                            </button>

                        </form>

                    <% } else { %>

                        <form action="${pageContext.request.contextPath}/tasks"
                              method="post">

                            <input type="hidden"
                                   name="action"
                                   value="complete">

                            <input type="hidden"
                                   name="taskId"
                                   value="<%= task.getId() %>">

                            <button type="submit"
                                    class="success-button">

                                Complete

                            </button>

                        </form>

                    <% } %>


                    <form action="${pageContext.request.contextPath}/tasks"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="delete">

                        <input type="hidden"
                               name="taskId"
                               value="<%= task.getId() %>">

                        <button type="submit"
                                class="danger-button">

                            Delete

                        </button>

                    </form>


                </div>

            </div>


        <% } %>

    <% } %>

</div>


</div>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>

</html>
