<%-- 
    Document   : edit_profile
    Created on : 25 Jul, 2024, 2:39:28 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="backgroung-color:#f7f7f7">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Edit Profile</h5>

                            <c:if test="${not empty failedMsg }">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session" />

                            </c:if>

                            <c:if test="${not empty succMsg }">
                                <h5 class="text-center text-success">${succMsg}</h5>
                                <c:remove var="succMsg" scope="session" />

                            </c:if>

                            <form action="update_profile" method="post">

                                <input type="hidden" value="${userobj.id}" name="id">

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
                                    <input type="text" name="fname" class="form-control" id="exampleInputEmail1" value="${userobj.name}"
                                           aria-describedby="emailHelp" required="required">
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" value="${userobj.email}"
                                           aria-describedby="emailHelp" required="required">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Phone No.</label>
                                    <input type="number" name="phno" class="form-control" id="exampleInputEmail1" value="${userobj.phno}"

                                           aria-describedby="emailHelp" required="required">
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required="required">
                                </div>

                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
