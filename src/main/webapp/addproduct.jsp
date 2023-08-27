<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="addproduct.css">
<title>New Product</title>
</head>
<body>
  <center>
		<div class="productdetail">
		      <h1 class="productheading"> Add Product Details</h1>
		      <form action="addproject" method="post">
		          <input type="text" name="productId" placeholder="Insert Product Id" class="productlist" required/>
		          <input type="text" name="productName" placeholder="Insert Product Name" class="productlist" required/>
		          <input type="text" name="productCost" placeholder="Insert Product Cost" class="productlist" required/>
		          <input type="text" name="productDescription" placeholder="Type something about products" class="productlist" required/>
		          <label class="plable" style="font-size:20px;color:white">ProductImage</label>
		          <input type="file" name="productImage" class="productlist" placeholder="Product Image" required/>
		          <input type="submit" value="Save Project" class="productBtn"/>
		      </form>
		</div>
   </center>
      
</body>
</html>