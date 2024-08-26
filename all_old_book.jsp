<%-- 
    Document   : all_new_book
    Created on : 23 Jul, 2024, 11:27:32 AM
    Author     : Abc1
--%>

<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Books</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row p-3">
                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list = dao.getAllOldBook();
                    for (BookDtls b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumbiin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%> </p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                       <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </body>
</html>
