<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">

<div class="row mt-6">
<div class="col-md-6 offset-md-3">
<h3 class="text-center my-3">Sign Up here!!</h3>
    
    <div class="card">
    
    <%@include file="components/message.jsp" %>
    <div class="card-body px-5">
    <div class="container text-center">
       <img alt="profile picture" src="img/dp.webp" style="max-width:100px;" class="img-fluid">
    </div>
    
      <form action="RegisterServlet" method="post">
		  <div class="mb-3">
		    <label for="name" class="form-label">User Name</label>
		    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here"   aria-describedby="emailHelp">
		  </div>
		  
		  <div class="mb-3">
		    <label for="email" class="form-label">User Email</label>
		    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" >
		    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
		  </div>
		  
		  <div class="mb-3">
		    <label for="password" class="form-label">Password</label>
		    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" >
		  </div>
		  
		   <div class="mb-3">
		    <label for="phone" class="form-label">User phone</label>
		    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" >
		  </div>
		  
		   <div class="mb-3">
		    <label for="" class="form-label">User Address</label>
		    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your Address"></textarea>
		  </div>
		  
		  <div class="container text-center">
		    <button class="btn btn-outline-success">Submit</button>
		  <button class="btn btn-outline-warning">Reset</button>
		  </div>
		  
</form>
    </div>
    </div>
    
</div>
</div>
</div>


</body>
</html>