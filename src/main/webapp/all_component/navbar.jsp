<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-3 bg-light">
  <div class="row">
    <div class="col-md-3 text-success">
      <h3> <i class="fa-solid fa-book"></i> Ebooks</h3>
    </div>
    <div class="col-md-6">
        <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
        <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Search" aria-label="Search">
        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
      
      
                <c:if test="${not empty userobj}">
                <div class="col-md-3">
                    <a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>

                    <a href="login.jsp" class="btn btn-success">
                        <i class="fas fa-user-plus"></i> ${userobj.name}
                    </a>
                    <a href="logout" class="btn btn-primary text-white">
                        <i class="fas fa-sign-in-alt"></i> Logout
                    </a>
                </div>
            </c:if>

            <c:if test="${empty userobj}">
                <div class="col-md-3">
                    <a href="login.jsp" class="btn btn-success">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                    <a href="register.jsp" class="btn btn-primary text-white">
                        <i class="fas fa-user-plus"></i> Register
                    </a>
                </div>
            </c:if>

  
  
  </div>  
</div>




<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="indexx.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
       
        <a href="setting.jsp" class="btn btn-light" type="submit"><i class="fa-solid fa-sliders"></i> Setting</a>
        <button class="btn btn-light" style="margin-left: 10px;" type="submit"><i class="fa-solid fa-address-book"></i> Contact Us</button>
      </form>
    </div>
  </div>
</nav>