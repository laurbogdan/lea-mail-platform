<!DOCTYPE html>

<html lang='en'>
<head>
    <meta charset="UTF-8" /> 
    <title>
        HTML Document Structure
    </title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

<div id="wrapper">

	<form name="login-form" class="login-form" action="/login" method="post">
	
		<div class="header">
		<h1>Login Form</h1>
		<span>Fill out the form below to login to my super awesome imaginary control panel.</span>
		</div>
	
		<div class="content">
			<input name="username" type="text" class="input username" placeholder="Username" />
			<div class="user-icon"></div>
			<input name="password" type="password" class="input password" placeholder="Password" />
			<div class="pass-icon"></div>		
		</div>

		<div class="footer">
			<input type="submit" name="submit" value="Login" class="button" />
			<input type="submit" name="submit" value="Register" class="register" />
		</div>
	
	</form>

</div>
<div class="gradient"></div>


</body>
</html>
