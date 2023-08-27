<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

    
<%
String productId=request.getParameter("id");
try
{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
    PreparedStatement pstmt=conn.prepareStatement("delete from products where id=?");
    pstmt.setString(1,productId);
    int rs=pstmt.executeUpdate();
    response.sendRedirect("adminhome.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>