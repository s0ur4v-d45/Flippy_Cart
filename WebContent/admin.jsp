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

</head>
<body>

<%@include file="components/navbar.jsp" %>

<h1>This is admin user panel</h1>
</body>
</html>