<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<title>categories</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/category.css">
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
		<a href="listparty.jsp?Category=C" class="collection"> <img
			src="img/clothing.jpg" alt="">
			<p class="collection-title">Clothing</p>
		</a> <a href="listparty.jsp?Category=F" class="collection"> <img
			src="img/food.jfif" alt="">
			<p class="collection-title">Food</p>
		</a> <a href="listparty.jsp?Category=E" class="collection"> <img
			src="img/electric-appliances.jpg" alt="">
			<p class="collection-title">Electronics</p>
		</a>
	</section>
</body>
</html>
