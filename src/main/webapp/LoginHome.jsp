<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

   <nav class="navbar navbar-inverse">
      <div class="container" >
         <ul class="nav navbar-nav navbar-right">
           
           <li><img src="success.jsp?username=<%=request.getParameter("username") %>" class="img-circle" alt="profilepic" width="40" height="40"/></li>
         </ul>
      </div>
   </nav>

</body>

<%
out.println("<h1>WElcome Back...........</h1>");
%>

<%=request.getParameter("username") %>
<%=request.getParameter("password") %>
</html>