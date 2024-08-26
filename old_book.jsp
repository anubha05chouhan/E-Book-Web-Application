<%-- 
    Document   : old_book
    Created on : 26 Jul, 2024, 12:28:52 AM
    Author     : Abc1
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User : Old Book Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color:#f7f7f7">
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${not empty succMsg }">
            <div class="alert alert-success text-center">${succMsg}</div>

            <c:remove var="succMsg" scope="session"/>


        </c:if>

        <div class="container p-5">

            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        User u = (User) session.getAttribute("userobj");
                        String email = u.getEmail();

                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                        List<BookDtls> list = dao.getBookByOld(email, "old");

                        for (BookDtls b : list) {
                    %>
                    <tr>
                        <td><%= b.getBookName()%></td>
                        <td><%= b.getAuthor()%></td>
                        <td><%= b.getPrice()%></td>
                        <td><%= b.getBookCategory()%></td>
                        <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%
                        }

                    %>

                </tbody>
            </table>


        </div>




    </body>
</html>
