<%-- 
    Document   : user_address
    Created on : 25 Jul, 2024, 2:47:05 PM
    Author     : Abc1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="backgroung-color:#f7f7f7">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success p-1">Add Address</h4>
                            <form>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Address">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputLandmark" class="form-label">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" placeholder="Landmark">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="inputCity" class="form-label">City</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="City">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="inputCity" class="form-label">State</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="State">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="inputCity" class="form-label">Pin Code</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="Zip">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning text-white">Add Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
