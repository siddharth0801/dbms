<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");
		
		if(session.getAttribute("userName")==null){
			response.sendRedirect("login.jsp");
		}
		
	%>
	<%@include file="navbar.html" %>
	<%-- <nav class="navbar"></nav>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/nav.js"></script>
	<!-- <script src="js/nav.js"></script> --> --%>
	
    <!-- hero section -->
  <header class="hero-section">
    <div class="content">
        <img src="img/light-logo.png" class="logo" alt="">
        <p class="sub-heading">Shopping is easy with siri!</p>
    </div>
  </header>
</body>
</html>