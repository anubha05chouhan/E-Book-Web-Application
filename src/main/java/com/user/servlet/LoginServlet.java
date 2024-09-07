/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

/**
 *
 * @author Abc1
 */
import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            userDAOImpl dao = new userDAOImpl(DBConnect.getConn());

            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect("admin/home.jsp");

            } else {

                User us = dao.login(email, password);
                if (us != null) {

                    session.setAttribute("userobj", us);
                    resp.sendRedirect("indexx.jsp");

                } else {
                    session.setAttribute("failedMsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
