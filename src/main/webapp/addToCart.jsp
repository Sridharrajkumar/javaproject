<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

  <% 
          String productId=request.getParameter("productId");
		  String productname="";
		  String productprice="";
		  byte[] productimg=null;
		  
		  try
		  {
			  
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			  PreparedStatement pstmt1=conn.prepareStatement("select * from products where id=?");
			  pstmt1.setString(1,productId);
			  ResultSet rs1=pstmt1.executeQuery();
			  while(rs1.next())
			  {
				  productname=rs1.getString("name");
				  productprice=rs1.getString("cost");
				  productimg=rs1.getBytes("image");
				  
			  }
			  PreparedStatement pstmt2=conn.prepareStatement("insert into card(id,name,cost,image) values(?,?,?,?)");
			  pstmt2.setString(1,productId);
			  pstmt2.setString(2,productname);
			  pstmt2.setString(3,productprice);
			  pstmt2.setBytes(4,productimg);
			  int count=pstmt2.executeUpdate();
			  if(count>0)
			  {
				  response.sendRedirect("displaycard.jsp");
			  }
			  
			  
		  }
		  catch(Exception e)
		  {
			  out.println(e);
		  }
       
  
  %>