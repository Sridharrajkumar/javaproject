<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<html>
   <head>
         <style>
              *{
                  background:black;
                  color:white;
               }
              .productholder
              {
                   display:flex;
                   gap:10px;
                   justify-content:center;
                   align-items:center;
                   
              }
              .productcard
              {
                  padding:10px;
                  width:300px;
                  display:flex;
                  flex-direction:column;
                  text-align:center;
                  border:2px solid red;
                  border-radius:10px;
                
              }
              
              .productimg
              {
                    border-radius:10px;
                    width:98%;
                    border:2px solid red;
              }
              
              .productprice
              {
                   margin-top:-10px;
                   color:red;
              }
              .heading
              {
                    text-align:center;
              }
         </style>
   </head>
   <body>
      <h1 class="heading">Card List</h1>
        <div class="productholder">
   

			   <%
			       String ProductName="";
			       String ProductPrice="";
			       String Productimg="";
			       Map<String, Integer> productQuantityMap = new HashMap<>();
			       
			       try
			       {
			    	   Class.forName("com.mysql.cj.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
				       PreparedStatement pstmt=conn.prepareStatement("select * from card");
				       ResultSet rs=pstmt.executeQuery();
				       while(rs.next())
				       {
					         ProductName=rs.getString("name");
					         ProductPrice=rs.getString("cost");
					         String ProductId=rs.getString("id");
					         byte[] img=rs.getBytes("image");
					         Productimg=Base64.getEncoder().encodeToString(img);
					         
					         
			  %>
			                   <div class="productcard">
									       <img src="data:image/jpeg;base64,<%=Productimg %>" class="productimg">
									       <h3 class="productname"><%=ProductName %></h3> 
									       <h4 class="productprice">&#8377; <%=ProductPrice %>/-</h4>
									       <a href="DeleteCard.jsp?id=<%=ProductId%>" style="text-decoration:none; background-color:white; color:black;padding:10px;">Delete</a>
									       
			       
			                    </div>
			  <% 
				       }
			       }
			       catch(Exception e)
			       {
			    	   out.println(e);
			       }
			             
			   %>
			   
			 
			   
			</div> 
     </body>
   
</html>