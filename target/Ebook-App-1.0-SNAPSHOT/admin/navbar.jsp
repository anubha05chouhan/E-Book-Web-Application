<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-3 bg-light">
  <div class="row">
    <div class="col-md-3 text-success">
      <h3> <i class="fa-solid fa-book"></i> Ebooks</h3>
    </div>
   
    <div class="col-md-3">
                <c:if test="${not empty userobj}">
              <a  class="btn btn-success text-white">
                  <i class="fas fa-user-plus"></i> ${userobj.name}
              </a>
              
              <a  class="btn btn-primary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                  <i class="fas fa-sign-in-alt"></i> Logout
              </a>
          </c:if>

          <c:if test="${empty userobj}">
              <a href="login.jsp" class="btn btn-success">
                  <i class="fas fa-sign-in-alt"></i> Login
              </a>
              <a href="register.jsp" class="btn btn-primary text-white">
                  <i class="fas fa-user-plus"></i> Register
              </a>
          </c:if>

    </div>
  </div>
</div>


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



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        
      </ul>
      <form class="d-flex" role="search">
       
        <button class="btn btn-light" type="submit"><i class="fa-solid fa-sliders"></i> Setting</button>
        <button class="btn btn-light" style="margin-left: 10px;" type="submit"><i class="fa-solid fa-address-book"></i> Contact Us</button>
      </form>
    </div>
  </div>
</nav>

<!-- 
 <div class="col-md-6">
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
-->