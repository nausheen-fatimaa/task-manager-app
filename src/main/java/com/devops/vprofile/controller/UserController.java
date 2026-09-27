package com.devops.vprofile.controller;

import com.devops.vprofile.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class UserController extends HttpServlet {

private UserService userService;

@Override
public void init() {

    userService = new UserService();

}


@Override
protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    request.getRequestDispatcher(
            "/register.jsp"
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

    String name =
            request.getParameter("name");

    String email =
            request.getParameter("email");

    String password =
            request.getParameter("password");


    boolean registered =
            userService.registerUser(
                    name,
                    email,
                    password
            );


    if (registered) {

        response.sendRedirect(
                request.getContextPath()
                + "/login?registered=true"
        );

    } else {

        request.setAttribute(
                "error",
                "Registration failed. Email may already exist."
        );

        request.getRequestDispatcher(
                "/register.jsp"
        ).forward(
                request,
                response
        );
    }
}

}
