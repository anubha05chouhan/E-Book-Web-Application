<%-- 
    Document   : all_new_book
    Created on : 23 Jul, 2024, 11:27:32 AM
    Author     : Abc1
--%>

<%@page import="com.entity.User"%>
<%-- 
    Document   : all_new_book
    Created on : 23 Jul, 2024, 11:27:32 AM
    Author     : Abc1
--%>

<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Books</title>
        <%@include file="all_component/allCss.jsp" %>
        
        <style type="text/css">
        .crd-ho:hover {
            background-color: #fcf7f7;
        }

        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -150px;
            background: #333;
            padding: 10px;
            color: white;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }
        </style>
                     
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
    var addCartContent = "${addCart}";
    if (addCartContent) {
        showToast(addCartContent);
    }
});

function showToast(content) {
    $('#toast').addClass("display");
    $('#toast').html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

        </script>
    </head>
    <body>
        <%
        User u = (User)session.getAttribute("userobj");
        %>
       <c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>
    <c:remove var="addCart" scope="session"/>
</c:if>

       
        <%@include file="all_component/navbar.jsp" %>
         
        <div class="container-fluid">
            <div class="row p-3">
                <%
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list = dao.getAllNewBook();
                for (BookDtls b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumbiin">
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

                                
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                            </div>
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



<%--
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Books</title>
         <%@include file="all_component/allCss.jsp" %>
         
         <style type="text/css">
.crd-ho:hover {
    background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>


    </head>
    <body>


<c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>
            <script type="text/javascript">
                $(document).ready(function() {
                    showToast("${addCart}");
                });

                function showToast(content) {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000);
                }
            </script>
        </c:if>
        
        
        
         <%@include file="all_component/navbar.jsp" %>
         
          <div class="container-fluid">
        <div class="row p-3">
            <%
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getAllNewBook();
        for (BookDtls b : list) {
        %>
         <div class="col-md-3">
        <div class="card crd-ho">
        <div class="card-body text-center">
          <img alt="" src="img/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumbiin">
          <p><%=b.getBookName()%></p>
          <p><%=b.getAuthor()%> </p>
          <p>Categories: <%=b.getBookCategory()%></p>
          <div class="row">
            <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
            <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
          </div>
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


//////////////////////////////


 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                console.log("Document is ready");
                var addCartContent = "${addCart}";
                if (addCartContent) {
                    console.log("addCart content: " + addCartContent);
                    showToast(addCartContent);
                }
            });

            function showToast(content) {
                console.log("Showing toast with content: " + content);
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000);
            }
        </script>
    </head>
    <body>
        <%
User u = (User)session.getAttribute("userobj");
%>
        
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>
             <c:remove var="addCart"  />
        </c:if>
        
//////////////////////////////



/////////////////
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var addCartContent = "${addCart}";
                if (addCartContent) {
                    showToast(addCartContent);
                }
            });

            function showToast(content) {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000);
            }
        </script>
    </head>
    <body>
         <%
User u = (User)session.getAttribute("userobj");
%>
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>
            <c:remove var="addCart" scope="session"/>
        </c:if>
             

/////////////////

--%>
