<%-- 
    Document   : order
    Created on : 25 Jul, 2024, 4:19:02 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Book Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="backgroung-color:#f7f7f7">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-1">
             <h3 class="text-center text-primary">Your Order</h3>
            <table class="table table-striped mt-3">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>Mark</td>
                        <td>Otto</td>
                    </tr>
                    
                </tbody>
            </table>
        </div>

    </body>
</html>
