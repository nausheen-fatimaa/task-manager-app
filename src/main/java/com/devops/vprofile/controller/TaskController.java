package com.devops.vprofile.controller;

import com.devops.vprofile.model.Task;
import com.devops.vprofile.model.User;
import com.devops.vprofile.service.TaskService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/tasks")
public class TaskController extends HttpServlet {

private TaskService taskService;


@Override
public void init() {

    taskService = new TaskService();

}


@Override
protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);


    if (session == null ||
        session.getAttribute("user") == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/login"
        );

        return;
    }


    User user =
            (User) session.getAttribute("user");


    List<Task> tasks =
            taskService.getUserTasks(
                    user.getId()
            );


    request.setAttribute(
            "tasks",
            tasks
    );


    request.getRequestDispatcher(
            "/tasks.jsp"
    ).forward(
            request,
            response
    );
}


@Override
protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);


    if (session == null ||
        session.getAttribute("user") == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/login"
        );

        return;
    }


    User user =
            (User) session.getAttribute("user");


    String action =
            request.getParameter("action");


    String taskIdParameter =
            request.getParameter("taskId");


    if ("create".equals(action)) {

        String title =
                request.getParameter("title");

        String description =
                request.getParameter("description");


        taskService.createTask(
                user.getId(),
                title,
                description
        );

    }


    else if ("complete".equals(action)) {

        int taskId =
                Integer.parseInt(
                        taskIdParameter
                );

        taskService.completeTask(
                taskId
        );

    }


    else if ("reopen".equals(action)) {

        int taskId =
                Integer.parseInt(
                        taskIdParameter
                );

        taskService.reopenTask(
                taskId
        );

    }


    else if ("delete".equals(action)) {

        int taskId =
                Integer.parseInt(
                        taskIdParameter
                );

        taskService.deleteTask(
                taskId
        );
    }


    response.sendRedirect(
            request.getContextPath()
            + "/tasks"
    );
}


}
