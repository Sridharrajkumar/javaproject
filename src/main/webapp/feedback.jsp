<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
 
 
 <%
         String names=request.getParameter("name");
         String emails=request.getParameter("email");
         String feedbacks=request.getParameter("message");
         
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
         PreparedStatement pstmt=conn.prepareStatement("insert into feedback(name,email,feedback) values(?,?,?)");
         pstmt.setString(1,names);
         pstmt.setString(2,emails);
         pstmt.setString(3,feedbacks);
         int count=pstmt.executeUpdate();
         if(count>0)
         {
        	 response.sendRedirect("home.jsp");
         }

 %>