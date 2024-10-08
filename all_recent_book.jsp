<%-- 
    Document   : all_recent_book
    Created on : 23 Jul, 2024, 11:27:17 AM
    Author     : Abc1
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Recent Books</title>
         <%@include file="all_component/allCss.jsp" %>
          <style type="text/css">
  
  
  .crd-ho:hover{
      background-color: #CECEBF;
  }
</style>
    </head>
    <body>
         <%@include file="all_component/navbar.jsp" %>
         <div class="container-fluid">
        <div class="row p-3">
          
                 <%
      BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list2 = dao2.getAllRecentBook();
      for(BookDtls b : list2)
      {
      %>
      
      <div class="col-md-3 ">
      <div class="card crd-ho mt-2">
        <div class="card-body text-center">
          <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumbiin">
          <p><%=b.getBookName()%></p>
          <p><%=b.getAuthor()%> </p>
          
          <%
            if(b.getBookCategory().equals("Old"))
            {
            %>
            <p>Categories: <%=b.getBookCategory()%></p>
            <div class="row">
                
                </a> <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                <a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %></a>
            </div>
            <%}else{%>
            
            <p>Categories: <%=b.getBookCategory()%></p>
          <div class="row">
            <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
            <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
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
      </div>

    </body>
</html>
