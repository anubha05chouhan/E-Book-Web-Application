<%-- 
    Document   : home
    Created on : 13 Jul, 2024, 10:55:35 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="allCss.jsp" %>
        <style type="text/css">
        a{

        text-decoration: none;
        color: black;
        }
        a:hover {                
            text-decoration: none;             
            color: black;
        }

</style>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
        </c:if>

        
        <div class="container">
        <div class="row p-5">
            <div class="col-md-3"> 
                <a href="add_books.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                    <h4>Add Books</h4>
                    ---------------------
                    </div>            
                </div>
                    </a>

            </div>  
            
            
            <div class="col-md-3"> 
                <a href="all_books.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fa-solid fa-book-open-reader fa-3x text-danger"></i></i><br>
                    <h4>All Books</h4>
                    ---------------------
                    </div>            
                </div>
                    </a>

            </div>  
            
            
            <div class="col-md-3">
                <a href="orders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fa-solid fa-box fa-3x text-warning"></i><br>
                    <h4>Orders</h4>
                    ---------------------
                    </div>            
                </div>
                    </a>

            </div>  
            
            
            <div class="col-md-3">
                <a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <div class="card">
                    <div class="card-body text-center">
                    <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
                    <h4>Logout</h4>
                    ---------------------
                    </div>            
                </div>
                    </a>

            </div>  
        </div>
        </div>
        <div style="margin-top: 176px;">
            
            
            <!-- logout modal -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
            <div class="modal-body">
            <div class="text-center">
                <h4>Do You want to logout?</h4>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="${pageContext.request.contextPath}/logout" type="button" class="btn btn-primary">Logout</a>
            </div>
        </div>
        <div class="modal-footer"></div>

    </div>
  </div>
</div>


<!--end logout modal -->


<%@include file="footer.jsp" %></div>
    </body>
</html>
