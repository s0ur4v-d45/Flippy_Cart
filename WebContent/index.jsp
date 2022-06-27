<%-- <%@page import="com.sourav.entities.Category"%>
<%@page import="com.sourav.dao.CategoryDao"%>
<%@page import="com.sourav.dao.ProductDao"%>
<%@page import="com.sourav.helper.FactoryProvider"%>
<%@page import="com.sourav.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.sourav.entities.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FlippyCart - Home</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

<div class="container-fluid">
	<div class="row mt-3 mx-2">

		<%
		String cat = request.getParameter("category");
        //out.println(cat);
			
		

		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> list2 = categoryDao.getAllCategories();
		
		 ProductDao dao = new ProductDao(FactoryProvider.getFactory());
         List<Product> list1 = null;
         if (cat == null || cat.trim().equals("all")) {
             list1 = dao.getAllProducts();
         } else {
             int cid = Integer.parseInt(cat.trim());
             list1 = dao.getAllProductsById(cid);
         }
         
         
        
         List<Category> clist = categoryDao.getAllCategories();
		%>



		<!--     show categories -->
		<div class="col-md-2">
		
		    <div class="list-group mt-4 ">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"
					aria-current="true"> All categories </a>
					<%
				for (Category c : list2) {
			
					%>
					
					<a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
					
					<% 
										
			}
			
			%>
					
					
			</div>
	
		</div>








		<!--     show products -->
		<div class="col-md-6">
		
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active"
					aria-current="true"> All products </a>
				<%
					for (Product p : list1) {
						%>
						
						<a href="#" class="list-group-item list-group-item-action"><%=p.getpName() %></a>
						
						<% 				
				}
				%>     
			</div>    
			
			     
            <!--row-->
            <div class="row mt-4">

                <!--col:12-->
                <div class="col-md-12">

                    <div class="card-columns">

                        <!--traversing products-->

                        <%
                            for (Product p : list1) {
                        %>


                        <!--product card-->
                        <div class="card product-card">

                            <div class="container text-center">
                              <img class="card-img-top m-2" src="img/Product/<%= p.getpPhoto()%>"  style="max-height: 200px;max-width: 100%;width: auto; " alt="...">

                            </div>

                            <div class="card-body">

                                <h5 class="card-title"><%=p.getpName()%></h5>

                                <p class="card-text">

                                    <%= Helper.get5Words(p.getpDesc())%>

                                </p>

                            </div>

                            <div class="card-footer text-center">
                                <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterDis()%>)">Add to Cart</button>
                                <button class="btn  btn-outline-success ">  &#8377; <%= p.getPriceAfterDis()%>/-  <span class="text-secondary discount-label">  &#8377; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off </span>  </button>

                            </div>



                        </div>

                        <%}
                            if (list1.size() == 0) {
                                out.println("<h3>No item in this category</h3>");
                            }
                        %>




                    </div>



                </div>

            </div>
			     
			
			
			
		</div>

	</div>

   </div>
   <%@include file = "components/modal.jsp"%>
   <script src="/FlippyCart/WebContent/js/script.js"></script>
</body>
</html> --%>




<%@page import="com.sourav.entities.Category"%>
<%@page import="com.sourav.dao.CategoryDao"%>
<%@page import="com.sourav.dao.ProductDao"%>
<%@page import="com.sourav.helper.FactoryProvider"%>
<%@page import="com.sourav.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.sourav.entities.Product"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <title>FlippyCart - Home</title>

    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-3 mx-2">

        	<%
		String cat = request.getParameter("category");
        //out.println(cat);
			
		

		CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> list2 = categoryDao.getAllCategories();
		
		 ProductDao dao = new ProductDao(FactoryProvider.getFactory());
         List<Product> list1 = null;
         if (cat == null || cat.trim().equals("all")) {
             list1 = dao.getAllProducts();
         } else {
             int cid = Integer.parseInt(cat.trim());
             list1 = dao.getAllProductsById(cid);
         }
         
         
        
         List<Category> clist = categoryDao.getAllCategories();
		%>



        <!--show categories-->
        <div class="col-md-2">


            <div class="list-group mt-4">

                <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                    Categories
                </a>

                <% for (Category c : clist) {
                %>



                <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>


                <%    }
                %>



            </div>


        </div>

        <!--show products-->
        <div class="col-md-10">


            <!--row-->
            <div class="row mt-4">

                <!--col:12-->
                <div class="col-md-12">

                    <div class="card-columns">

                        <!--traversing products-->

                        <%
                            for (Product p : list1) {
                        %>


                        <!--product card-->
                        <div class="card product-card">

                            <div class="container text-center">
                              <img class="card-img-top m-2" src="img/Product/<%= p.getpPhoto()%>"  style="max-height: 200px;max-width: 100%;width: auto; " alt="...">

                            </div>

                            <div class="card-body">

                                <h5 class="card-title"><%=p.getpName()%></h5>

                                <p class="card-text">

                                    <%= Helper.get5Words(p.getpDesc())%>

                                </p>

                            </div>

                            <div class="card-footer text-center">
                                <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterDis()%>)">Add to Cart</button>
                                <button class="btn  btn-outline-success ">  &#8377; <%= p.getPriceAfterDis()%>/-  <span class="text-secondary discount-label">  &#8377; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off </span>  </button>

                            </div>



                        </div>

                        <%}
                            if (list1.size() == 0) {
                                out.println("<h3>No item in this category</h3>");
                            }
                        %>




                    </div>



                </div>

            </div>



        </div>

    </div>
</div>

<%@include  file="components/modal.jsp" %>

</body>
</html>
