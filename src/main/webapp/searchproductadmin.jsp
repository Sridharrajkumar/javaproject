<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<%
		String name=request.getParameter("searchedname");
		String productdescription="";
		String productprice="";
		String productimg="";
		String productid="";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement pstmt=conn.prepareStatement("select * from products where name=?");
			pstmt.setString(1,name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				productdescription=rs.getString("description");
				productprice=rs.getString("cost");
				productid=rs.getString("id");
				byte[] img=rs.getBytes("image");
				productimg=Base64.getEncoder().encodeToString(img);
				
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}

%>

<html>
  <head>
        <link rel="stylesheet" href="searchproduct.css" />
  </head>
  <body>
      <div>
          <div class="productcard">
             <img src="data:image/jpeg;base64,<%=productimg%>" alt="<%=name %>" class="productimg"/>
             <h3 class="productname"><%=name %></h3>
             <h6 class="productdesc"><%=productdescription %></h6>
             <h4 class="productCost">&#8377;<%=productprice %></h4>
             <div class="editdelete">
	    	      <a href="editproduct.jsp?id=<%=productid%>" style="text-decoration:none; background-color:white; padding:10px 24px; color:red; border-radius:10px" >Edit</a>
	    	      <a href="deleteproducts.jsp?id=<%=productid%>" style="text-decoration:none; background-color:white; padding:10px 24px; color:red; border-radius:10px">Delete</a>
    	      </div>
          </div>
      </div>
     
  </body>
</html>
