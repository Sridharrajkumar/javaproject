<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>

<%
        String Pid=request.getParameter("id");

        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/finalproject","root","root");
            PreparedStatement pstmt=conn.prepareStatement("delete from card where id=?");
            pstmt.setString(1,Pid);
            int count=pstmt.executeUpdate();
            response.sendRedirect("displaycard.jsp");
        }
        catch(Exception e)
        {
        	out.println(e);
        }


%>