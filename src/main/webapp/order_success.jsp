<%-- 
    Document   : order_sucsess
    Created on : 31 Aug, 2024, 3:06:54 AM
    Author     : Abc1

<%
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>


<%
            }
        %>
        <div style="margin-top: 85px;">
            <%@include file="all_component/footer.jsp"%>
        </div>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order_Success Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="all_component/navbar.jsp" %>
        
        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Successfully</h2>
            <h5>With in 7 Days Your Product will be Delivered In your Adress</h5>
            <a href="indexx.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
        


    </body>
</html>
