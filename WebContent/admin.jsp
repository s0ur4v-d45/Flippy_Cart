<%@page import="com.sourav.entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="com.sourav.helper.FactoryProvider"%>
<%@page import="com.sourav.dao.CategoryDao"%>
<%@page import="com.sourav.entities.User"%>
<%@page import="com.sourav.helper.Helper" %>
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

        
           <%
               CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
               List<Category> list = categoryDao.getAllCategories();
               
               
               //getting count
                 Map<String,Long> m =  Helper.getCounts(FactoryProvider.getFactory());
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

<div class="container-fluid mt-3">
   <%@include file="components/message.jsp" %>
</div>

   <div class="row mt-3">
   
     <div class="col-md-4">
        <div class="card">
            <div class="card-body text-center">
            
              <div class="container">
                <img style="max-width: 125px" class="img-fluid" alt="user_icon" src="img/man.png">
              </div>
              
              <h1><%=m.get("userCount") %></h1>
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
              
              <h1><%=list.size() %></h1>
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
              
              <h1><%=m.get("productCount") %></h1>
              <h1 class="text-uppercase text-muted">Products</h1>
            </div>
        </div>
     </div>
   
   </div>
   
   
   <div class="row mt-3">
   
      <div class="col-md-6">
           <div class="card" data-bs-toggle="modal" data-bs-target="#add_category">
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
           <div class="card" data-bs-toggle="modal" data-bs-target="#add_product">
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


<!-- category modal start-->
<!-- Modal -->
<div class="modal fade" id="add_category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
       <form action="ProductOperationServlet" method="post">
        
        <input type="hidden" name="operation" value="addcategory"/>
        
           <div class="form-group mt-3">
              <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
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


<!-- category modal end-->



<!-- =========================================================================================================
 -->
 	
<!-- product modal start-->

<!-- Modal -->
<div class="modal fade" id="add_product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
         
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        
        <input type="hidden" name="operation" value="addproduct"/>
        
        
        <!-- product name -->
           <div class="form-group mt-3">
              <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required/>
           </div>
           
           <!-- product description -->
           <div class="form-group mt-3">
              <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDescription" required></textarea>
           </div>
           
           <!-- product price -->
            <div class="form-group mt-3">
              <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product" required/>
           </div>
           
           <!-- product discount -->
           <div class="form-group mt-3">
              <input type="number" class="form-control" name="pDiscount" placeholder="Enter discount on product" required/>
           </div>
           
           <!-- product quantity -->
            <div class="form-group mt-3">
              <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
           </div>
           
           
   
           
           
           <!-- product category -->
            <div class="form-group mt-3">
              <select name="catId" class="form-control">
              
                <%
                  for(Category c:list)
                  { 
		                %>
		                 <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
		                 
                 <%}%>
              </select>
           </div>
           
            <!-- product picture -->
            <div class="form-group mt-3">
              <input type="file" name="pPic" required/>
           </div>
           
           
           <div class="container text-center mt-3">
             <button class="btn btn-outline-success">Add product</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
           </div>
          
        </form>
    
      </div>
     
    </div>
  </div>
</div>

<!-- product modal end-->

 <!-- End Product modal-->
        <%@include file="components/modal.jsp" %>
</body>
</html>