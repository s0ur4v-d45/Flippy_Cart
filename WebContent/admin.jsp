<%@page import="com.sourav.entities.User"%>
<%
User user=(User) session.getAttribute("current-user");

if(user==null)
{
	session.setAttribute("message","You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
}
else if(user.getUserType().equals("normal"))
{
	session.setAttribute("message","You are not an admin! You can't access this page");
	response.sendRedirect("login.jsp");
	return;
}

%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp" %>


<style type="text/css">

.admin .card
{
	border: 1px solid #673ab7;
}

.admin .card:hover
{
	background: #e2e2e2;
}
</style>


</head>
<body>

<%@include file="components/navbar.jsp" %>


<div class="container admin">

   <div class="row mt-3">
   
     <div class="col-md-4">
        <div class="card">
            <div class="card-body text-center">
            
              <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/man.png">
              </div>
              
              <h1>6542</h1>
              <h1 class="text-uppercase text-muted">Users</h1>
            </div>
        </div>
     </div>
     
     <div class="col-md-4">
      <div class="card">
            <div class="card-body text-center">
            
            <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/categories.png">
              </div>
              
              <h1>76572</h1>
              <h1 class="text-uppercase text-muted">Categories</h1>
            </div>
        </div>
     </div>
     
     <div class="col-md-4">
      <div class="card">
            <div class="card-body text-center">
            
            <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/box.png">
              </div>
              
              <h1>548765</h1>
              <h1 class="text-uppercase text-muted">Products</h1>
            </div>
        </div>
     </div>
   
   </div>
   
   
   <div class="row mt-3">
   
      <div class="col-md-6">
           <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <div class="card-body text-center">
            
            <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/menu.png">
              </div>
              
              <p class="mt-2">Click here to add new category</p>
              <h1 class="text-uppercase text-muted">Add category</h1>
            </div>
        </div>
      </div>
      
      <div class="col-md-6">
           <div class="card">
            <div class="card-body text-center">
            
            <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/add-to-basket.png">
              </div>
              
              <p class="mt-2">Click here to add new products</p>
              <h1 class="text-uppercase text-muted">Add Products</h1>
            </div>
        </div>
      </div>
   
   </div>

</div>





<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
        
        <form action="">
           <div class="form-group mt-3">
              <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
           </div>
           
           <div class="form-group mt-3">
              <textarea style="height: 300px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
           </div>
           
           <div class="container text-center mt-3">
             <button class="btn btn-outline-success">Add category</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
           </div>
          
        </form>
        
        
        
      </div>
     
    </div>
  </div>
</div>

</body>
</html>