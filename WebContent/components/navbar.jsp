
<%@page import="com.sourav.entities.User"%>
<%
	User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">FlippyCart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>

		</button>

		<div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-right">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="true">
						Categories </a>

					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>

			</ul>
			<ul class="navbar-nav me-auto mb-2 mb-rg-0">

				<li class="nav-item active">
                    <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart">  <i class="fa fa-cart-plus"  style="font-size: 20px; color: aliceblue"></i> <span class="ml-0 cart-items">( 0 )</span>  </a>
                </li>


				<%
					if (user1 == null) {
				%>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp">Login</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="register.jsp">Register</a></li>

				<%
					} else {
				%>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#!"><%=user1.getUserName()%></a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LogoutServlet">Logout</a></li>

				<%
					}
				%>


			</ul>
		</div>
	</div>
</nav>
