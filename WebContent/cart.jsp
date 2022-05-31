<%@page import="com.user.Cart"%>
<%@page import="com.user.Product"%>
<%@page import="com.login.dao.Dao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/nav.css">
<title>Cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
	margin: 0.5%;
}

.btn-incre, .btn-decre {
	font-size: 20px;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");

		if (session.getAttribute("userName") == null) {
			System.out.println("In if of cart");
			response.sendRedirect("login.jsp");
		} else {
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
	%>
	<%@include file="navbar.html"%>
	<div class="container p-3 my-3 bg-dark text-white">
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Description</th>
					<th scope="col">Price(&#x20B9)</th>
					<th scope="col">Quantity</th>
					<th scope="col">Remove Item</th>
				</tr>
			</thead>
			<tbody>
				<%
					int total = 0;
						if (cart_list != null) {
							for (Cart c : cart_list) {
								Dao d = new Dao();
								Product pt = d.getP(c.getId());
								total += pt.getPrice() * c.getQuantity();
				%>
				<tr>
					<td><%=pt.getPname()%></td>
					<td><i><%=pt.getDes()%></i></td>
					<td><%=pt.getPrice()%></td>
					<td>
						<div class="form-group d-flex justify-content-between">
							<a class="btn bnt-sm btn-incre"
								href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">+</a>
							<%-- <input type="text" name="quantity" class="form-control" value="<%=c.getQuantity()%>" readonly> --%>
							<p><%=c.getQuantity()%></p>
							<a class="btn btn-sm btn-decre"
								href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">-</a>
						</div>
					</td>
					<%-- <td><button type="submit" class="btn btn-primary btn-sm">Buy <%=pt.getPname()%></button></td> --%>
					<td><a href="remove?id=<%=c.getId()%>"
						class="btn btn-sm btn-danger">Remove <%=pt.getPname().trim()%></a></td>
				</tr>
				<%
					}
						}
				%>
			</tbody>
		</table>
		<div class="d-flex py-3">
			<h3>
				Total: &#x20B9 <i><%=total%></i>
			</h3>
			<a class="mx-3 btn btn-primary" href="checkout.jsp">Checkout</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>