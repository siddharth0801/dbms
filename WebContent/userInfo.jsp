<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.ArrayList,com.user.Customer,com.login.dao.Dao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/aboutUs.css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");

		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<%@include file="navbar.html"%>
	<%
		String email = (String) session.getAttribute("userName");
		Dao d = new Dao();
		Customer cus = d.getInfo(email);
	%>
	
	<h1 class="display-5">
		<div class="alert alert-primary" role="alert">Profile</div>
	</h1>
	<%
		if(!(cus==null)){
			
	%>
	<h3 style="margin:5%;"><%=cus.getName() %>, <%=cus.getEmail() %>, <%=cus.getGender() %>, <%=cus.getPhoneNumber() %></h3>
	<%
		}
	%>

</body>
</html>