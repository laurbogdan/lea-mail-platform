<!DOCTYPE html>

<html lang='en'>
<head>
<meta charset="UTF-8" />
<title>HTML Document Structure</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">

		<form name="login-form" class="login-form" submi
			action="javascript:functie()">

			<div class="header">
				<h1>Login Form</h1>
				<span>Fill out the form below to login to my super awesome
					imaginary control panel.</span>
			</div>

			<div class="content">
				<input name="username" type="text" class="input username"
					placeholder="Username" />
				<div class="user-icon"></div>
				<input name="password" type="password" class="input password"
					placeholder="Password" />
				<div class="pass-icon"></div>
			</div>

			<div class="footer">
				<input type="submit" href="/login" name="submit" value="Login" class="button" />
				<input type="submit" name="submit" value="Register" class="register" />
			</div>

		</form>

	</div>
	<div class="gradient"></div>

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function functie() {
			$.ajax({
				type : 'GET',
				url : "/login",
				success : function(data) {
					var a = "${success}"; 
					alert(a);
				}
			});
		}
	</script>

</body>
</html>
