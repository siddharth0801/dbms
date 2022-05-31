<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.user.Product,com.login.dao.Dao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<title>Product List</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");

		/* if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		} */
	%>
	<%@include file="navbar.html"%>
	
	<%
		String c = (String) request.getParameter("Category");
		String b = (String) request.getParameter("brand");
		ArrayList<Product> products;
		if (c != null) {
			Dao d = new Dao();

			if (c.equals("ALL")) {
				products = d.getList();
			} else {
				products = d.getList("Category", c);
			}
		} else if (b != null) {
			Dao d = new Dao();

			products = d.getList("brand", b);
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
		
		<div class="row">
			<%
				int min = Integer.MAX_VALUE;
				
				if(products.size()!=0){
					for(Product p:products){
						min = Math.min(min,p.getDes().length());
					}
				
					for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-150">
					<img class="card-img-top" src="<%=p.getImageUrl()%>"
						alt="Product Image">
					<div class="card-body">
						<h6 class="card-title"><%=p.getPname()%></h6>
						<h6 class="price">
							Price: &#x20B9
							<i><%=p.getPrice()%></i></h6>
						<p class="text-muted">
							Description:
							<%=p.getDes().substring(0, min)%>...</p>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getPid()%>">Add to Cart</a> 
							<%-- <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getPid()%>">Buy Now</a> --%>
						</div>
					</div>
				</div>
			</div>
			<%
				}
				} 
				else {
					%>
					<tr>

					<td colspan="9" align="center">No Products Available Right Now!!</td>

				</tr>
					<%
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