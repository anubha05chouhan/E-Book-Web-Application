<%-- 
    Document   : sell_book
    Created on : 25 Jul, 2024, 2:25:39 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Book Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="backgroung-color:#f7f7f7">

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp" />
        </c:if>


        <%@include file="all_component/navbar.jsp" %>

        <div class="container mt-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Sell Old Books</h5>

                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>


                            <form action="add_old_book" method="post"
                                  enctype="multipart/form-data">

                                <input type="hidden" value="${userobj.email}" name="user">


                                <div class="form-group">    
                                    <label for="exampleInputEmail1">Book Name*</label> 
                                    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label> <input
                                        name="author" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input
                                        name="price"
                                        type="number"
                                        class="form-control"
                                        id="exampleInputPassword1"
                                        >
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input
                                        name="bimg"
                                        type="file"
                                        class="form-control-file"
                                        id="exampleFormControlFile1"
                                        />
                                </div>

                                <button type="submit" class="btn btn-primary mt-2">Sell</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
