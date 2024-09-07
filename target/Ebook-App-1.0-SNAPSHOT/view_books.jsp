<%-- 
    Document   : view_books
    Created on : 23 Jul, 2024, 12:31:03 PM
    Author     : Abc1
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View details</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
         <%@include file="all_component/navbar.jsp" %>
         
         <%
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        BookDtls b = dao.getBookById(bid);

        %>

         
         
      <div class="container p-3">
    <div class="row">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="img/<%=b.getPhotoName()%>" style="height: 150px; width: 150px;"><br>
            <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
            <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
        </div>
        
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%=b.getBookName()%></h2>
            
            
            <%
                if ("Old".equals(b.getBookCategory())) {
                %>

                <h5 class="text-primary"> Contact To Seller</h5>
                <i class="far fa-envelope"></i> EMail:
                <%=b.getEmail()%></h5>

                <%}%>

            
            
            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-money-bill-wave fa-2x"></i>
                    <p>Cash on delivery</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                     <p>Return Available</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                     <p>Free Shipping</p>
                </div>
            </div>
            
                
                
                
           <%
                if ("Old".equals(b.getBookCategory())) {
                %>
                    <div class="text-center p-3">
                        <a href="indexx.jsp" class="btn btn-success">
                            <i class="fas fa-cart-plus"></i> Continue Shopping
                        </a>
                        <a href="" class="btn btn-danger">
                            <i class="fas fa-rupee-sign"></i> 200
                        </a>
                    </div>
                <%
                } else {
                %>
                    <div class="text-center p-3">
                        <a href="" class="btn btn-primary">
                            <i class="fas fa-cart-plus"></i> Add Cart
                        </a>
                        <a href="" class="btn btn-danger">
                            <i class="fas fa-rupee-sign"></i> 200
                        </a>
                    </div>
                <%
                }
                %>

            
        </div>
    </div>
</div>

    </body>
</html>
