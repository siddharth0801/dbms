<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.user.Cart"%>
<%@page import="com.user.Product"%>
<%@page import="com.login.dao.Dao"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/checkout.css">
</head>
<title>Checkout</title>
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
	<h2>Checkout</h2>
	<hr>
	<br>
	<h3>
		<b>If you want home delivery then enter address!!</b>
	</h3>
	<br>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form action="Checkout" method="post">

					<div class="row">
						<div class="col-50">
							<h3>Shipping Address</h3>
							<br>
							<!-- <label for="fname"><i class="fa fa-user"></i> Full Name</label> <input
								type="text" id="fname" name="firstname"
								placeholder="Siddharth Singh"> <label for="email"><i
								class="fa fa-envelope"></i> Email</label> <input type="text" id="email"
								name="email" placeholder="john@example.com">  -->
							<label for="adr"><i class="fa fa-address-card-o"></i>
								Address</label> <input type="text" id="address" name="address"
								placeholder="93/3 Vallabh Nagar"> <label for="city"><i
								class="fa fa-institution"></i> City</label> <input type="text" id="city"
								name="city" placeholder="Indore">

							<div class="row">
								<div class="col-50">
									<label for="state">State</label> <input type="text" id="state"
										name="state" placeholder="MP">
								</div>
								<div class="col-50">
									<label for="zip">PinCode</label> <input type="text" id="zip"
										name="zip" placeholder="10001">
								</div>
							</div>
						</div>

						<!--           <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div> -->

					</div>
					<label> <input type="checkbox" checked="checked"
						name="sameadr">Want it now?? then select this..
					</label>
					<br> 
					<input type="submit" value="Order!!" class="btn">
				</form>
			</div>
		</div>
		<div class="col-25">
			<%
				int total = 0;
					int count = 0;
					if (cart_list != null) {
			%>
			<div class="container">
				<h4>
					Cart <span class="price" style="color: black"><i
						class="fa fa-shopping-cart"></i> <b></b></span>
				</h4>
				<%
					for (Cart c : cart_list) {
								Dao d = new Dao();
								Product pt = d.getP(c.getId());
								total += pt.getPrice() * c.getQuantity();
								count++;
				%>
				<p>
					<a href="#"><%=pt.getPname()%></a>*<%=c.getQuantity()%>
					<span class="price"><%=pt.getPrice()%></span>
				</p>
				<%
					}
				%>
				<br>
				<p>
					Total: <span class="price" style="color: black"><b><%=total%></b></span>
				</p>
			</div>
			<%
				}
				}
			%>
		</div>
	</div>

</body>
</html>