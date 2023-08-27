

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="image.jsp" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="image/jpg" %>
<%
try
{
	//System.out.println("hello");
	String name=request.getParameter("username");
	String password=request.getParameter("pass");
	System.out.println(name);
	byte[] img=null;
	ServletOutputStream sos=null;
	String query="select photo from signup where username=? and  password=?";
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
    PreparedStatement pstmt=conn.prepareStatement(query);
    pstmt.setString(1,name);
    pstmt.setString(2,password);
    ResultSet rs=pstmt.executeQuery();
    while(rs.next())
    {
    	img=rs.getBytes("photo");
    }
    response.setContentLength(img.length);
    response.getOutputStream().write(img);
    response.getOutputStream().flush();
}
catch(Exception e)
{
   
}

%>

