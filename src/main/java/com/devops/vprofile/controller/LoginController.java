package com.devops.vprofile.controller;

import com.devops.vprofile.model.User;
import com.devops.vprofile.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

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
            "/login.jsp"
    ).forward(request, response);

}


@Override
protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    String email =
            request.getParameter("email");

    String password =
            request.getParameter("password");


    User user =
            userService.loginUser(
                    email,
                    password
            );


    if (user != null) {

        HttpSession session =
                request.getSession();

        session.setAttribute(
                "user",
                user
        );

        response.sendRedirect(
                request.getContextPath()
                + "/dashboard"
        );

    } else {

        request.setAttribute(
                "error",
                "Invalid email or password"
        );

        request.getRequestDispatcher(
                "/login.jsp"
        ).forward(
                request,
                response
        );
    }
}

}
