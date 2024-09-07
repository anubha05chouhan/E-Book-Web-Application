<%-- 
    Document   : register
    Created on : 12 Jul, 2024, 3:38:54 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Register</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Registration Page</h4>

                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session"/>


                            </c:if>

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>

                            </c:if>



                            <form action="register" method="post">

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
                                    <input type="text" name="fname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Phone No.</label>
                                    <input type="number" name="phno" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required="required">
                                </div>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                                    <label class="form-check-label"  for="exampleCheck1">Agree Terms & Condition</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
