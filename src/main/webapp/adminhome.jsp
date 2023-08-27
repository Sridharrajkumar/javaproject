<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<html>
<head>
   <title>spices</title>
  <link rel="stylesheet" href="userhome.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<nav style="display: flex; justify-content: space-between; padding:10px 20px; align-items: center; width: 100%; background:black; font-size: 18px;">
		 <h1 style="color:red"><i class="fas fa-pepper-hot"></i>Spicy</h1>
		 <div>
			 <a href="addproduct.jsp"  style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Add Products</a>
			 <a href="#contactdetails"  style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Contact</a>
			 <a href="visitor.jsp"  style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Visitors</a>
		 </div>
		  <form action="searchproductadmin.jsp" method="post" class="searchform">
			   <input type="text" name="searchedname" placeholder="Enter Product Name" spellcheck="false" class="search" >
			   <button class="searchbtn"><i class="glyphicon glyphicon-search"></i></button>
		 </form>
	    <div style="display: flex; gap:20px; align-items: center; "> 
		    <a id="dark-mode-toggle" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">DarkMode</a>
		    <a href="logout" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">LogOut</a>
	    </div>
	</nav>
	
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
            <img src="https://source.unsplash.com/1600x1000/?pizza" alt="" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?vegan" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?lunch" alt="" style="width:100%; height:500px" />
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
    	     
    	        <div class="productcard" style="flex-grow: 0;">
    	              <img src="data:image/jpeg;base64,<%=base64img%>" alt=<%=p2%> class="productimg"/>
    	              <h3 class="productname"><%=p2%></h3>
    	              <h6 class="productdesc"><%=p4 %></h6>
    	              <h4 class="productCost">&#8377;<%=p3 %></h4>
    	              <div class="editdelete">
	    	              <a href="editproduct.jsp?id=<%=p1%>" style="text-decoration:none; background-color:black; padding:10px 24px; color:red; border-radius:10px" >Edit</a>
	    	              <a href="deleteproducts.jsp?id=<%=p1%>" style="text-decoration:none; background-color:black; padding:10px 24px; color:red; border-radius:10px">Delete</a>
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
       
        <section class="contactsection">
	     <div id="contactdetails">
	       <a href="https://www.facebook.com/profile.php?id=100004291533239" class="fa fa-facebook"></a>
	        <a href="https://t.me/+t21VZ1-EE3EwMWNl" class="fa fa-telegram"></a>
	        <a href="https://instagram.com/mr.s__r__i?igshid=MjEwN2IyYWYwYw==" class="fa fa-instagram"></a>
	     </div>
	      <div id="feedback-form">
	         <h2>Provide Feedback</h2>
	         <form action="feedback.jsp">
	            <label for="name">Your Name:</label>
	            <input type="text" id="name" name="name" required>
	
	            <label for="email">Your Email:</label>
	            <input type="text" id="email" name="email" required><br>
	
	            <label for="message">Feedback:</label>
	            <textarea id="message" name="message" rows="4" required></textarea>
	
	            <button type="submit">Submit Feedback</button>
	         </form>
	      </div>
      </section>
      
       
       <script>
			  const toggleButton = document.getElementById('dark-mode-toggle');
			  const body = document.body;
			
			  toggleButton.addEventListener('click', () => {
			    body.classList.toggle('dark-mode');
			  });
      </script>

 </body>
 </html>