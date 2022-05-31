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
	<h1 class="display-6">
		<div class="alert alert-primary" role="alert">
			<i>Available Products</i>
		</div>
	</h1>
	<%
		Dao d = new Dao();
		ArrayList<Product> products;
		products = d.getList();
	%>

	<div class="container">

		<div class="row">
			<%
				int min = Integer.MAX_VALUE;

				if (products.size() != 0) {
					for (Product p : products) {
						min = Math.min(min, p.getDes().length());
					}

					for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-150">
					<img class="card-img-top" src="<%=p.getImageUrl()%>"
						alt="Product Image">
					<div class="card-body">
						<h6 class="card-title"><%=p.getPname()%></h6>
						<h6 class="price font-italic">
							Price: &#x20B9
							<%=p.getPrice()%></h6>
						<p class="text-muted">
							Description:
							<%=p.getDes().substring(0, min)%>...
						</p>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getPid()%>">Add
								to Cart</a>
							<%-- <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getPid()%>">Buy Now</a> --%>
						</div>
					</div>
				</div>
			</div>
			<%
				}
				} else {
			%>
			<tr>

				<td colspan="9" align="center">No Products Available Right
					Now!!</td>

			</tr>
			<%
				}
			%>

		</div>
	</div>
</body>
</html>