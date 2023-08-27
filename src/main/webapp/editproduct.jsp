<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>


<%
    String productid=request.getParameter("id");
    String productname="";
    String productdescription="";
    String productprice="";
    byte[] productimg=null;
    try
    {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
    	PreparedStatement pstmt=conn.prepareStatement("select * from products where id=?");
    	pstmt.setString(1,productid);
    	ResultSet rs=pstmt.executeQuery();
    	while(rs.next())
    	{
    		productname=rs.getString("name"); 
    		productdescription=rs.getString("description");
    		productprice=rs.getString("cost");
    		productimg=rs.getBytes("image");
    	}
    	
    }
    catch(Exception e)
    {
    	out.println(e);
    }

  %>
  
   <html>
        <head>
              <title>Update Product</title>
              <link rel="stylesheet" href="addproduct.css">
        </head>
        <body>
            <div class="productdetail">
	            <h1 class="productheading">Update Product Details</h1>
	             <form action="editproduct" method="post" >
	                  <input type="text" name="productId" placeholder="Enter ProductId" value="<%=productid%>" readonly/>
	                  <input type="text" name="productName" placeholder="Enter Product Name" value="<%=productname%>" required>
	                  <input type="text" name="productDesc" placeholder="Enter Product Description"  value="<%=productdescription%>" required>
	                  <input type="text" name="productPrice" placeholder="Enter Product Cost" value="<%=productprice%>" required>
	                  <input type="file" name="productImg" value="<%=productimg%>" required>
	                  <input type="submit" value="Update Product" >
	             </form>
	        </div>
        </body>
        
        
   </html>
   
   