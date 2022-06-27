
<%@page import="com.sourav.entities.User"%>
<%
User user=(User) session.getAttribute("current-user");

if(user==null)
{
	session.setAttribute("message","You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
}
else if(user.getUserType().equals("admin"))
{
	session.setAttribute("message","You are not an normal user! You can't access this page");
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
<title>Insert title here</title>
</head>
<body>
<h1>This is normal user panel</h1>


</body>
</html>