<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="signin.css" />
</head>
<body>
     <form  method="get" action="sigup" class="signinform" id="signupForm" >
       <div class="inputs">
        <h1 >Create An Account</h1>
        <input type="text" name="firstname" id="firstname" placeholder="Enter FirstName " required/>
        <input type="text" name="lastname" id="lastname" placeholder="Enter LastName" required/>
       
        <input type="email" name="mail" id="email" placeholder="Enter Email" required/>
       
        <input type="password" name="password" id="password" placeholder="Enter Password" required/>
       
        <input type="password" name="conpassword" id="conpass" placeholder="Confirm Password" required/>
        
        <input type="tel" name="mobile" id="phone" placeholder="Enter MobileNo" required/>
        
        <input type="text" name="address" id="address" placeholder="Enter Address" required/>
   
         Profile Photo: <input type="file" name="photo" id="photo" required/>
         
         <select name="usertype" id="usertype" style="width:100%; height:40px; border-radius:10px; margin: 0px 0px 10px 0px; font-size:18px; color:gray; padding:10px; "required>
		      <option value="" >Select User Type </option>
		      <option value="user">user</option>
		      <option value="admin">admin</option>
         </select>
        
         <input class="savebtn" type="submit" value="Save"/>
       </div>
     </form>
     
     <script>
		    const form = document.getElementById("signupForm");
		    const password = document.getElementById("password");
		    const confirmPassword = document.getElementById("conpass");
		
		    form.addEventListener("submit", function (event) {
		      if (password.value !== confirmPassword.value) {
		        alert("Confirm password and Passwords do not match. Please re-enter the password.");
		        event.preventDefault();
		      }
		    });
     </script>
     
</body>
</html>