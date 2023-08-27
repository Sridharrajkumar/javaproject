

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
	
	<link rel="stylesheet"  href="home.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>
	     Spicy
	</title>
</head>
<body>
   <nav class="headnav">
       <h1 style="color:red"><i class="fas fa-pepper-hot"></i>Spicy</h1>
       <div style="display:flex; align-item:center;"> 
          <a href="https://www.google.com/maps/place/BB+Rd,+Chinnaiyan+Colony,+Perambur,+Chennai,+Tamil+Nadu+600039/@13.1137536,80.2455552,14z/data=!4m6!3m5!1s0x3a5265bdb910aa09:0x319ce5d23792bb38!8m2!3d13.1120845!4d80.2525888!16s%2Fg%2F1tqtw9gr?entry=ttu" class="navbtn">Location</a>
          <a href="signup.jsp" class="navbtn">SignUp</a>
          <a href="login.jsp" class="navbtn">LogIn</a>
          <a href="admin.jsp" class="navbtn">Admin</a>
          <a id="dark-mode-toggle" class="navbtn">Dark Mode</a>
       </div>
   </nav>
   <div class="container-fluid">
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
            <img src="https://media.istockphoto.com/id/157526986/photo/roast-chicken-on-the-bbq.webp?b=1&s=170667a&w=0&k=20&c=MsESSea4KL1iVqtVW9ucjuyhM_epPIxGxMwJnwWjuCg=" alt="" style="width:100%; height:500px" />
          </div>
          <div class="item">
            <img src="https://source.unsplash.com/1600x1000/?dinner" style="width:100%; height:500px" />
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
          <h2 class="testimonal">Testimonals</h2>
          
		   <div id="mytestimonal" class="carousel slide testsize" data-ride="carousel">
		  
		       <div class="carousel-inner">
		           <div class="item active testcaro">
		                <div class="img-box"><img src="https://img.wegreenkw.com/sites/3/2022/11/Samantha.webp" alt="sam" ></div>
						<p class="testimonialspara">Spicy elevates crab fry to an art form! Their recipe made cooking this seafood delight a breeze, with clear instructions and exquisite flavors that delighted my taste buds. A big thumbs up to Spesies for turning my kitchen into a crab fry haven!</p>
						<p class="overview"><b>Samanth Ruth Prabhu</b>, Indian Actress</p>
		           </div>
		           <div class="item testcaro">
		                <div class="img-box"><img src="https://upload.wikimedia.org/wikipedia/commons/a/ad/Mahesh_Babu_at_Selvandhan_Audio_Launch.jpg"  alt="sam"></div>
						<p class="testimonialspara">Spicy redefines paneer butter masala! Their recipe simplifies the cooking process while delivering a rich and authentic taste. Thanks to Spesies, I can now create restaurant-quality paneer butter masala in my own kitchen.</p>
						<p class="overview"><b>Ghattamaneni Mahesh</b>, Indian Actor</p>
		           </div>
		           <div class="item testcaro">
		                <div class="img-box"><img src="https://w0.peakpx.com/wallpaper/336/725/HD-wallpaper-pspk-pawan-kalyan-in-bheemla-nayak-movie-black-shirt-and-lungi-pawan-kalyan-movie-black-shirt-lungi.jpg"  alt="sam"></div>
						<p class="testimonialspara">Spicy is a dosa lover's paradise! Their website's diverse dosa recipes, accompanied by clear instructions, have redefined my cooking experience. Thanks to Spesies, I now savor the authentic taste of South India right in my home."</p>
						<p class="overview"><b>Konidela Pawan</b>, Indian Actor</p>
		           </div>
		           <div class="item testcaro">
		              <div class="img-box">  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/N.T.Rama_Rao_Jr._at_the_RRR_Press_Meet_in_Chennai.jpg/220px-N.T.Rama_Rao_Jr._at_the_RRR_Press_Meet_in_Chennai.jpg"  alt="sam"></div>
						<p class="testimonialspara">Spicy has perfected the art of chicken biryani! Following their recipe, my kitchen bloomed with enticing aromas and rich flavors. The detailed guidance made the cooking experience a breeze, and the final dish was a true masterpiece. Thanks, Spesies, for bringing the magic of biryani into my home!</p>
						<p class="overview"><b>Nanddamuri Tarak</b>, Indian Actor</p>
		           </div>
		           <div class="item testcaro">
		                <div class="img-box"><img src="https://i.pinimg.com/474x/9c/cf/2c/9ccf2cd0cbcd68b11112ea2c3180cfc5.jpg"  alt="sam"></div>
						<p class="testimonialspara">Spicy delivers mutton biryani perfection! Their recipe made crafting this iconic dish a joy, with each step demystified and flavors that transport me to a culinary haven. A heartfelt thank you for making my kitchen the abode of exceptional mutton biryani.</p>
						<p class="overview"><b>Konidela Chiru</b>, Indian Actor</p>
						
		           </div>
		           
		            <a class="left carousel-control" href="#mytestimonal" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left"></span>
					    <span class="sr-only">Previous</span>
					 </a>
					  <a class="right carousel-control" href="#mytestimonal" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right"></span>
					    <span class="sr-only">Next</span>
					  </a>
		          
		       </div>
		   </div>
		       
		       
             <h2 class="testimonal">Contact</h2>
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
   
 </html>