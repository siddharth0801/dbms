<%@page import="com.user.Cart"%>
<%@page import="com.user.Product"%>
<%@page import="com.login.dao.Dao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	/* DecimalFormat dcf = new DecimalFormat("#.##"); */
	/* request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
	    request.setAttribute("person", auth);
	} */
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		for (Cart c : cart_list) {
			System.out.println(c.getId());
		}
	}

	List<Cart> cartProduct = null;
	/* if (cart_list != null) {
		Dao dao = new Dao();
		dao.getP()
		
	} */
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/nav.css">
<title>E-Commerce Cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="navbar.html"%>
	<!-- <nav class="navbar"></nav>
    <script src="js/nav.js"></script> -->
	<%-- <%@include file="/includes/navbar.jsp"%> --%>

	<div class="container my-3">
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Description</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Buy Now</th>
				</tr>
			</thead>
			<tbody>

				<%
					int total = 0;
					if (cart_list != null) {
						for (Cart c : cart_list) {
							Dao d = new Dao();
							Product pt = d.getP(c.getId());
							total += pt.getPrice();
				%>
				<tr>
					<td><%=pt.getPname()%></td>
					<td><%=pt.getDes()%></td>
					<td><%=pt.getPrice()%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre"
									href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">+</a> <input
									type="text" name="quantity" class="form-control"
									value="<%=c.getQuantity()%>" readonly> <a
									class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">-</a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">
								Buy
								<%=pt.getPname()%></button>
						</form>
					</td>
					<td><a href="remove?id=<%=c.getId()%>"
						class="btn btn-sm btn-danger">Remove <%=pt.getPname()%></a></td>
				</tr>

				<%
					}
					}
				%>
			</tbody>
		</table>
		<div class="d-flex py-3">
			<h3>
				Total Price:
				<%=total%>
			</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
	</div>

	<%-- <%@include file="/includes/footer.jsp"%> --%>
</body>
</html>