/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DB.DBConnect;
import com.DAO.userDAOImpl;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abc1
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            System.out.println(name + " " + check);

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            HttpSession session = req.getSession();

            if (check != null) {
                userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
                boolean f2 = dao.checkUser(email);
                if (f2) {
                    boolean f = dao.UserRegister(us);

                    if (f) {
                        session.setAttribute("succMsg", "Registration Successful.");
                    } else {
                        session.setAttribute("failedMsg", "Something went wrong during registration.");
                    }
                } else {
                    session.setAttribute("failedMsg", "User Already Exist Try Another Email ID.");
                }
            } else {
                session.setAttribute("failedMsg", "Please check the box.");
            }

            resp.sendRedirect("register.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

/*


 if(check!=null)
             {
             userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
            boolean f = dao.UserRegister(us);
            if (f) {
                //System.out.println("User Register Success..");
                session.setAttribute("succMsg", "Registration Successfully..");
                resp.sendRedirect("register.jsp");

            } else {
                //System.out.println("Something wrong on");
                session.setAttribute("failedMsg", "Something wrong on..");
                resp.sendRedirect("register.jsp");

            }
             }
             else
             {
                 //System.out.println("Please check the box ");
                 session.setAttribute("failedMsg", "Please check the box..");
                  resp.sendRedirect("register.jsp");

             }

 */
