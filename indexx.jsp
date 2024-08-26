<%-- 
    Document   : indexx.jsp
    Created on : 12 Jul, 2024, 11:33:05 AM
    Author     : Abc1
--%>

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook : Index</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .back-img {
                background: url("img/b.jpg");
                height: 50vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            .crd-ho:hover{
                background-color: #CECEBF;
            }
        </style>

    </head>
    <body style="backgroung-color:#f7f7f7">

        <%
            User u = (User) session.getAttribute("userobj");
        %>


        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img">
            <h2 class="text-center text-danger">EBook Management System</h2>
        </div>


        <div class="container "  >
            <h3 class="text-center">Recent Book</h3>



            <div class="row">

                <%
                    BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list2 = dao2.getRecentBooks();
                    for (BookDtls b : list2) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbiin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%> </p>

                            <%
                                if (b.getBookCategory().equals("Old")) {
                            %>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">




                            </a> <a href="view_books.jsp?bid=<%=b.getBookId()%>"
                                    class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice()%></a>
                    </div>
                    <%} else {%>

                    <p>Categories: <%=b.getBookCategory()%></p>
                    <div class="row">



                        <%
                            if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <%
                        } else {
                        %>
                        <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <%
                            }
                        %>





                        <a href="view_books.jsp?bid=<%=b.getBookId()%>"" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>

                    <%}%>




                </div>
            </div>
        </div>

        <%
            }
        %>




    </div>

    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn-danger btn-sm text-white" style="text-decoration: none">View</a>
    </div>
</div>

<hr>











<div class="container "  >
    <h3 class="text-center">New Book</h3>
    <div class="row">


        <%
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list = dao.getNewBook();
            for (BookDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbiin">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%> </p>
                    <p>Categories: <%=b.getBookCategory()%></p>
                    <div class="row">



                        <%
                            if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <%
                        } else {
                        %>
                        <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <%
                            }
                        %>




                        <a href="view_books.jsp?bid=<%=b.getBookId()%>"
                           class="btn btn-success btn-sm ml-1">View Details</a>

                        <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

    <div class="text-center mt-1">
        <a href="all_new_book.jsp" class="btn-danger btn-sm text-white" style="text-decoration: none">View</a>
    </div>
</div>

<hr>











<div class="container "  >
    <h3 class="text-center">Old Book</h3>
    <div class="row">
        <%
            BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list3 = dao3.getOldBooks();
            for (BookDtls b : list3) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbiin">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%> </p>
                    <p>Categories: <%=b.getBookCategory()%></p>
                    <div class="row">

                        <a href="view_books.jsp?bid=<%=b.getBookId()%>"
                           class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>





    </div>

    <div class="text-center mt-1">
        <a href="all_old_book.jsp" class="btn-danger btn-sm text-white" style="text-decoration: none">View</a>
    </div>
</div>

<%@include file="all_component/footer.jsp" %>

</body>
</html>




<!--
       <div class="col-md-3">
      <div class="card crd-ho">
        <div class="card-body text-center">
          <img alt="" src="book/java.jpg" style="width: 150px; height: 200px" class="img-thumbiin">
          <p>Java Programming</p>
          <p>Balguruswamy </p>
          <p>Categories: New</p>
          <div class="row">
            <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
            <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
            <a href="" class="btn btn-danger btn-sm ml-1">299</a>
          </div>
        </div>
      </div>
    </div>
      
       <div class="col-md-3">
      <div class="card crd-ho">
        <div class="card-body text-center">
          <img alt="" src="book/java.jpg" style="width: 150px; height: 200px" class="img-thumbiin">
          <p>Java Programming</p>
          <p>Balguruswamy </p>
          <p>Categories: New</p>
          <div class="row">
            <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
            <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
            <a href="" class="btn btn-danger btn-sm ml-1">299</a>
          </div>
        </div>
      </div>
    </div>
      
       <div class="col-md-3">
      <div class="card crd-ho">
        <div class="card-body text-center">
          <img alt="" src="book/java.jpg" style="width: 150px; height: 200px" class="img-thumbiin">
          <p>Java Programming</p>
          <p>Balguruswamy </p>
          <p>Categories: New</p>
          <div class="row">
            <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
            <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
            <a href="" class="btn btn-danger btn-sm ml-1">299</a>
          </div>
        </div>
      </div>
    </div>
  </div> -->

