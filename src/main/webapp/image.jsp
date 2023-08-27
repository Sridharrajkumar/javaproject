

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>
 
 
<html>
<head>
   <title>spices</title>
  <link rel="stylesheet" href="image.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<nav style="display: flex; justify-content: space-between; padding:10px 20px; align-items: center; width: 100%; background:black; font-size: 18px;">
		 <h1 style="color:red"><i class="fas fa-pepper-hot"></i>Spicy</h1>
	    <div style="display: flex; gap:20px; align-items: center; "> 
	       <form action="search.jsp" method="post" class="searchform">
              <input type="text" name="searchedname" placeholder="Enter Product Name" spellcheck="false" class="search" >
              <button class="searchbtn"><i class="glyphicon glyphicon-search"></i></button>
          </form>
		    <img src="success.jsp?username=<%=request.getParameter("mail")%>" class="img-circle" alt="Cinque Terre" width="40" height="40">
		    <div>
			    <a href="" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Card</a>
			    <a id="dark-mode-toggle" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Dark Mode</a>
			    <a href="./LogOutServlet" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">LogOut</a>
	        </div>
	    </div>
	</nav>


<% 
out.println("<h3>Welcome ...........</h3>");
%>
<%
try
{
	System.out.println("hello");
	String name=request.getParameter("mail");
	String password=request.getParameter("password");
	ResultSet rs;
    PreparedStatement pstmt;
	System.out.println(name);
	System.out.println("hi");
	String query="select * from signup where username=? and password=?";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
    pstmt=conn.prepareStatement(query);
    pstmt.setString(1,name);
    pstmt.setString(2,password);
    rs=pstmt.executeQuery();
    

    
    while(rs.next())
    {
    	String n1=rs.getString("username");
    	String n3=rs.getString("password");
    	String n2=rs.getString("firstname");
 
    	if(name.equalsIgnoreCase(n1) && password.equalsIgnoreCase(n3))
    	{
    		out.println("<h2>"+n2+"</h2>");
    	}
    	else
    	{
    		  RequestDispatcher rd=request.getRequestDispatcher("unau.jsp");
    	       rd.forward(request, response);
    	}
    	
    }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
    <div style="width:100%">
     <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators"> 
             <li data-target="#myCarousel" data-slide-to="0" class="active"/>
             <li data-target="#myCarousel" data-slide-to="1"/>
             <li data-target="#myCarousel" data-slide-to="2"/>
             <li data-target="#myCarousel" data-slide-to="3"/>
        </ol>
        
        <div class="carousel-inner">
          <div class="item active" >
            <img src="https://source.unsplash.com/1600x1000/?burger" alt="" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?coffee" alt="" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?lunch" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?salad" alt="" style="width:100%; height:500px" />
          </div>
        </div>
        
     
     
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
   </div>
   
   <h3>PRODUCTS</h3>
         

  <div class="productContainer">

<%
       try
       {
    	   Class.forName("com.mysql.cj.jdbc.Driver");
    	   Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
    	   PreparedStatement pstmt1=conn1.prepareStatement("select * from products");
    	   ResultSet rs1=pstmt1.executeQuery();
    	   while(rs1.next())
    	   {
    		    String p1=rs1.getString("id");
    	    	String p2=rs1.getString("name");
    	    	String p3=rs1.getString("cost");
    	    	String p4=rs1.getString("description");
    	    	byte [] pho=rs1.getBytes("image");
    	    	String base64img=Base64.getEncoder().encodeToString(pho);
    	    	
    	 %>  
    	     <div>
    	        <div class="productcard" >
    	              <img src="data:image/jpeg;base64,<%=base64img%>" alt="biryani" class="productimg" />
    	              <h3 class="productname"><%=p2%></h3>
    	              <h6 class="productdesc"><%=p4 %></h6>
    	              <h4 class="productCost"><%=p3 %></h4>
    	              <a href="">+card</a>
    	        </div>
    	     </div>
    	              
    	 
    	 <%
    	    	
    	    }    	   
    	   
    	   
       }
        catch(Exception e)
       {
    	   e.printStackTrace();
       }

%> 
  </div>
  
  <script>
	  const toggleButton = document.getElementById('dark-mode-toggle');
	  const body = document.body;
	
	  toggleButton.addEventListener('click', () => {
	    body.classList.toggle('dark-mode');
	  });
  </script>

 </body>
 </html>
 
 