<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
	function validateForm() {
		let fn = document.forms["registerForm"]["firstName"].value;
		let ln = document.forms["registerForm"]["lastName"].value;
		if (fn == "") {
			alert("Empty First Name");
			return false;
		}
		if (ln == "") {
			alert("Empty Last Name");
			return false;
		}
	}
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<link rel="stylesheet" href="home.css">
<title>Registration Form</title>
</head>
<body>

	<div id="register">
		<h3 class="text-center pt-5">Registration Form</h3>
		<div class="container">
			<div id="register-row"
				class="row justify-content-center align-items-center">
				<div id="register-column" class="col-md-6">
					<div id="register-box" class="col-md-12">
						<form name="registerForm" id="register-form" class="form"
							action="Register" onsubmit="return validateForm()" method="POST">
							<div class="form-group">
								<label for="firstName" class="text-info">Name:</label><br>
								<input type="text" name="Name" class="form-control">
							</div>
							<div class="form-group">
								<label for="phone" class="text-info">Phone:</label><br> <input
									type="text" name="phone" class="form-control">
							</div>
							<input type="radio" name="gender" value="M" checked>M <input
								type="radio" name="gender" value="F">F
							<hr>
							<div class="form-group">
								<label for="uname" class="text-info">Email ID:</label><br>
								<input type="text" name="email" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="passw" class="text-info">Password:</label><br>
								<input type="password" name="passw" class="form-control"
									required>
							</div>
							<div class="form-group">
								<br> <br> <input type="submit" name="submit"
									class="btn btn-info btn-md" value="Register"> <a
									href="login.jsp"><button type="button"
										class="btn btn-warning">Login</button></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
