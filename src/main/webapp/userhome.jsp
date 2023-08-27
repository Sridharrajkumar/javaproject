<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<% 
         String email=(String)request.getAttribute("email");
         String name="";
         String lastname="";
         String base64dp="";
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
        	PreparedStatement pstmt=conn.prepareStatement("select * from signup where username=?");
        	pstmt.setString(1,email);
        	ResultSet rs=pstmt.executeQuery();
        	if(rs.next())
        	{
        		byte [] dp=rs.getBytes("photo");
        		base64dp=Base64.getEncoder().encodeToString(dp);
        		name=rs.getString("firstname");
        		lastname=rs.getString("lastname");
        	}
        }
        catch(Exception e)
        {
        	out.println(e);
        }

%>
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
         <!-- navigation bar started  -->
				<nav style="display: flex; justify-content: space-between; padding:10px 20px; align-items: center; width: 100%; background:black; font-size: 18px;">
					 <h1 style="color:red"><i class="fas fa-pepper-hot"></i>Spicy</h1>
				    <div style="display: flex; gap:20px; align-items: center; "> 
				       <form action="searchproduct.jsp" method="post" class="searchform">
			              <input type="text" name="searchedname" placeholder="Enter Product Name" spellcheck="false" class="search" >
			              <button class="searchbtn"><i class="glyphicon glyphicon-search"></i></button>
			          </form>
					    <img src="data:image/jpeg;base64,<%=base64dp%>" class="img-circle" alt="Cinque Terre" width="50" height="50">
					    <div>
						    <a href="displaycard.jsp" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">Card</a>
						    <a id="dark-mode-toggle" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">DarkMode</a>
						    <a href="logout" style="border:0; background-color:black; color:red; border-radius: 14px; padding: 10px 10px; font-size: 18px; font-weight: bold; cursor:pointer; text-decoration:none;">LogOut</a>
				        </div>
				    </div>
				</nav>
        <!-- navigation bar ended  -->
                 <h3 style="font-weight:bold">Welcome <%=name %> <%=lastname %></h3>
                 
        <!-- carousel starts-->
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
			            <img src="https://source.unsplash.com/1600x1000/?burger" alt="" style="width:100%; height:500px"/>
			          </div>
			          <div class="item">
			            <img src="https://source.unsplash.com/1600x1000/?pizza" alt="" style="width:100%; height:500px"/>
			          </div>
			          <div class="item">
			            <img src="https://source.unsplash.com/1600x1000/?lunch" style="width:100%; height:500px"/>
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
        
      <!-- carousel ends-->
      <!-- product start -->
			            <h2 style="font-weight:bold">PRODUCTS</h2>
			            
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
			    	              <img src="data:image/jpeg;base64,<%=base64img%>" alt="<%=p2%>" class="productimg" />
			    	              <h3 class="productname"><%=p2%></h3>
			    	              <h6 class="productdesc"><%=p4 %></h6>
			    	              <h4 class="productCost">&#8377;<%=p3 %></h4>
			    	              <a href="addToCart.jsp?productId=<%=p1%>" class="productaddcard" style="text-decoration:none; ">Add Card</a>
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
      <!-- product end -->
     <!-- chat start -->
		    <div>
		       <button class="open-button" onclick="openForm()">Chat</button>
		
				<div class="chat-popup" id="myForm">
				  <form action="/" class="form-container">
				    <h1>Chat</h1>
				
				    <label for="msg"><b>Message</b></label>
				    <textarea placeholder="Type message.." name="msg" required></textarea>
				
				    <button type="submit" class="btn">Send</button>
				    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
				  </form>
				</div>
		     </div>
     <!-- chat end -->
    <!-- contact start -->
		      <section class="contactsection">
			     <div id="contactdetails">
			       <a href="https://www.facebook.com/profile.php?id=100004291533239" class="fa fa-facebook"  style="text-decoration:none;"></a>
			        <a href="https://t.me/+t21VZ1-EE3EwMWNl" class="fa fa-telegram" style="text-decoration:none;"></a>
			        <a href="https://instagram.com/mr.s__r__i?igshid=MjEwN2IyYWYwYw==" class="fa fa-instagram" style="text-decoration:none;"></a>
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
      <!-- contact end -->
  
   <script>
	  const toggleButton = document.getElementById('dark-mode-toggle');
	  const body = document.body;
	
	  toggleButton.addEventListener('click', () => {
	    body.classList.toggle('dark-mode');
	  });
	  
	  function openForm() {
		  document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
		  document.getElementById("myForm").style.display = "none";
		}
		
		
  </script>
              
  </body>
</html>