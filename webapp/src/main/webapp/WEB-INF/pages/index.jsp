<!DOCTYPE html>

<html lang='en'>
<head>
<meta charset="UTF-8" />
<title>HTML Document Structure</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">

		<form name="login-form" class="login-form" id="form"
			onSubmit="javascript:functie(); return false;">

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
				<input type="submit" name="submit" value="Login" class="button"/>
				<input type="submit" name="submit" value="Register" class="register" />
			</div>

		</form>

	</div>
	<div class="gradient"></div>
	
	<div id="wrong" align="center" style="visibility:hidden">
	<p>Datele introduse sunt incorecte</p>
	
	</div>

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
   
		function functie() {
						var username = document.getElementById("username").value;
						var password = document.getElementById("password").value;
						$.ajax({
							type: 'POST',
						    url: "login",
						    async: false,
						    data: "username=" + username + "&password=" +  password,
						    success: function(data) {
						    	alert("dsa");
						    	document.getElementById("wrong").style.display;
						    
						       
						    },
						    error:function() {
						    	alert("fds");
						    }
						});
					}
	</script>

</body>
</html>
