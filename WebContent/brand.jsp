<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<title>brands</title>
<link rel="stylesheet" href="css/brand.css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");

		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<%@include file="navbar.html" %>
	<!-- <nav class="navbar"></nav>
	<script src="js/nav.js"></script> -->

	<section class="collection-container">
		<a href="listparty.jsp?brand=hrx" class="collection"> <img src="img/hrx.png"
			alt="">
			<p class="collection-title">HRX</p>
		</a> <a href="listparty.jsp?brand=mi" class="collection"> <img src="img/mi.jpg"
			alt="">
			<p class="collection-title">mi</p>
		</a> <a href="listparty.jsp?brand=nestle" class="collection"> <img
			src="img/Nestle.jpg" alt="">
			<p class="collection-title">Nestle</p>
		</a>
	</section>
</body>
</html>
