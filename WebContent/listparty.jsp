<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.user.Product,com.login.dao.Dao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/aboutUs.css">

<title>Product List</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");

		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<%@include file="navbar.html"%>
	<!-- <nav class="navbar">
	<script src="js/nav.js"></script>
	</nav> -->


	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");
		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		}

		String c = (String) request.getParameter("Category");
		String b = (String) request.getParameter("brand");
		ArrayList<Product> products;
		if (c != null) {
			Dao d = new Dao();

			if (c.equals("ALL")) {
				products = d.getList();
			} else {
				products = d.getList("Category",c);
			}
		} else if (b != null) {
			Dao d = new Dao();

			products = d.getList("brand",b);
		} else {
			products = (ArrayList<Product>) request.getAttribute("alist");
		}
		/* Dao d = new Dao();
		ArrayList<Product> products = d.getList(x); */
	%>
	<%-- <%! ArrayList<Product> alist; %> --%>
	<%
		/* if(alist==null){
			response.sendRedirect("Display");
		}
		else{
			response.setIntHeader("Refresh", 1);
		} */
		/* response.setIntHeader("Refresh", 1); */
	%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
				if (products != null || !products.isEmpty()) {
					for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="img/mi.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getPname()%></h5>
						<h6 class="price">
							Price: Rs.
							<%=p.getPrice()%></h6>
						<h6 class="category">
							Description:
							<%=p.getDes()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getPid()%>">Add
								to Cart</a> <a class="btn btn-primary"
								href="order-now?quantity=1&id=<%=p.getPid()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
				} else {
					out.println("There is no products");
				}
			%>

		</div>
	</div>

	<!--  -->

	<%-- <div class="container">
		<h1 class="display-3">Product List</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col">Description</th>

				</tr>
			</thead>
			<%
				/* 		alist = (ArrayList<Product>)request.getAttribute("alist"); */
				System.out.println("In listparty.jsp");

				if (products != null && !products.isEmpty()) {

					for (int i = 0; i < products.size(); i++) {
			%>
			<tbody>
				<tr>
					<th scope="row"><%=products.get(i).getPname()%>
					</td>
					<td><%=products.get(i).getPrice()%></td>
					<td><%=products.get(i).getDes()%></td>

				</tr>
				<%
					}

					} else {
				%>

				<tr>

					<td colspan="9" align="center">No Records Available!!</td>

				</tr>

				<%
					}
				%>
			</tbody>
		</table>

		<br> <br> <a href="home.jsp">Back to Home..</a>
	</div> --%>
</body>
</html>