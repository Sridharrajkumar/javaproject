<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <link rel="stylesheet" href="login.css" />
</head>
<body>
  <center>
	     <form action="userlogin" method="post" class="loginform">
	           <h2 style= color:red;>Sign In</h2>
	           <input type="text" name="mail" class="logininput" placeholder="Enter Email" required/>
	           <input type="password" name="password" class="logininput" placeholder="Enter Password" required/>
	           <a href="forgotPassword.jsp" class="forget">forget password?</a><br>
	           <input type="submit" value="LogIn" class="loginbtn" /><br><br>
	           <p style="color:white">Don't have a account? <a href="signin.jsp" style= text-decoration:none;color:red;>signup</a></p>
	     </form>
     </center>
</body>
</html>