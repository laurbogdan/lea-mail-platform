<!DOCTYPE html>

<html lang='en'>
<head>
<meta charset="UTF-8" />
<title>HTML Document Structure</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">

		<form name="login-form" class="login-form" id="form">

			<div class="header">
				<h1>Login Form</h1>
				<span>Fill out the form below to login to my super awesome
					imaginary control panel.</span>
			</div>

			<div class="content">
				<input name="username" type="text" class="input username"
					id="username" placeholder="Username" />
				<div class="user-icon"></div>
				<input name="password" type="password" class="input password"
					id="password" placeholder="Password" />
				<div class="pass-icon"></div>
			</div>

			<div class="footer">
				<input type="submit" name="submit" value="Login" class="button"
					onClick="functie()" /> <input type="submit" name="submit"
					value="Register" class="register" />
			</div>

		</form>

	</div>
	<div class="gradient"></div>

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function functie() {
			$.ajax({
				type : "GET",
				url : "http://localhost:8080/login",
				async : false,
				cache : false,
				timeout : 10000,
				data : "username=" + document.getElementById('username').value
						+ "&password="
						+ document.getElementById('password').value,
				error : function() {
					alert("Nu merge!");
				},
				success : function() {
					var ok = "true";
					if (ok.localeCompare("${success}"))
						alert("V-ati logat!");
					else
						alert("Datele sunt incorecte!");
				}
			});
		}
	</script>

</body>
</html>
