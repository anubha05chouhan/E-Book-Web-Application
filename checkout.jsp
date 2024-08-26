<%-- 
    Document   : cart
    Created on : 24 Jul, 2024, 2:26:10 PM
    Author     : Abc1
--%>


<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Page</title>
        <%@ include file="all_component/allCss.jsp" %>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f7f7f7;
            }
        </style>
    </head>
    <body>

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>


        <%@ include file="all_component/navbar.jsp" %>

        <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session" />

        </c:if>
        
        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger" role="alert">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session" />

        </c:if> 


        <div class="container">
            <div class="row p-2">
                <!-- Left Column -->
                <div class="col-md-5">
                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Selected Items</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userobj");

                                        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                        List<Cart> cart = dao.getBookByUser(u.getId());

                                        Double totalPrice = 0.00;

                                        for (Cart c : cart) {
                                            totalPrice = c.getTotalPrice();
                                    %>
                                    <tr>
                                        <th scope="row"><%= c.getBookName()%></th>
                                        <td><%= c.getAuthor()%></td>
                                        <td><%= c.getPrice()%></td>
                                        <td>
                                            <a href="remove_book?bid=<%=c.getBid()%>&uid=<%=c.getUserId()%>&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger" >Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalPrice%></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                            <form action="order" method="post">
                                
                                <input type="hidden" value="${userobj.id}" name="id">
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputName" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="inputName" value="${userobj.name}" name="username">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" value="${userobj.email}" name="email" placeholder="Email">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputPhone"  class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" id="inputPhone" value="${userobj.phno}" name="phno"  placeholder="Phone Number">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputAddress"  class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="address" placeholder="Address">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputLandmark" class="form-label">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark"  name="landmark"  placeholder="Landmark">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputCity"  class="form-label">City</label>
                                        <input type="text" class="form-control" id="inputCity"  name="city" placeholder="City">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputState"  class="form-label">State</label>
                                        <input type="text" class="form-control" id="inputState"  name="state" placeholder="State">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputZip"  class="form-label">Pin Code</label>
                                        <input type="text" class="form-control" id="inputZip"  name="pincode" placeholder="Zip">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select class="form-control" name="payment">
                                        <option value="noselect">--Select--</option>
                                        <option value="COD">Cash On Delivery</option>
                                    </select>
                                </div>
                                <div class="text-center p-2">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="indexx.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


