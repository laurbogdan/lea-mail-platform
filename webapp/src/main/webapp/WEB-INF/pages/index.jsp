<!DOCTYPE html>

<html lang='en'>
<head>
<meta charset="UTF-8" />
<title>HTML Document Structure</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="login">
			<form name="login-form" class="login-form" action="/upload" enctype="multipart/form-data" method="post" id="eventForm" target="uploader_iframe">

				<div class="header">
					<h1>Login Form</h1>
					<span>Fill out the form below to login to our super awesome
						imaginary mail server.</span>
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
					<input type="submit" onclick="functie();" name="submit" value="Login" class="button"/>
					<input type="submit" onclick="switchDiv(1);" name="submit" value="Register" class="register" />
				</div>

			</form>
		</div>

		<div id="register" style="display:none"> 
			<form name="login-form" class="login-form" >

				<div class="header">
					<h1>Register</h1>
					<span>Fill out the form below to register to out super awesome imaginary mail server.</span>
				</div>

				<div class="content">
					<input name="username" type="text" class="input username"
						id="username_register" placeholder="Username" />
					<div class="user-icon"></div>
					<input name="password" type="password" class="input password"
						id="password_register" placeholder="Password" />
					<div class="pass-icon"></div>
					<input name="email" type="email" class="input email"
						id="email_register" placeholder="Email" />
					<div class=""></div>
				</div>

				<div class="footer">
					<input type="submit" onclick="javascript:register();" name="submit" value="Register" class="button"/>
					<input type="submit" onclick="javascript:switchDiv(0);" name="submit" value="Back" class="register" />
				</div>

			</form>
		</div>
		
		<iframe id="uploader_iframe" name="uploader_iframe" style="display: none;"></iframe>

	</div>
	<div class="gradient"></div>
	
	<div id="wrong" align="center" style="display:none">
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
				    	if(data.success==true) window.location.href="mainPage?id="+data.user.id;
				    	else document.getElementById("wrong").style.display = "block";
				    		       
				    },
				    error:function() {
				    	alert("Eroare! Va rugam reincercati mai tarziu!");
				    }
				});
			}
		function switchDiv(Contor) {
			var login = document.getElementById("login");
			var register = document.getElementById("register");
			if(Contor == 1)
			{
				login.setAttribute("style","display:none");
				register.removeAttribute("style");
			} else {
				register.setAttribute("style","display:none");
				login.removeAttribute("style");
			}
		function register() {
				var username = document.getElementById("username_register").value;
				var password = document.getElementById("password_register").value;
				var email = document.getElementById("email_register").value;
				$.ajax({
					type: 'POST',
				    url: "register",
				    async: false,
				    data: "username=" + username + "&password=" +  password + "&email=" +  email,
				    success: function(data) {
				    	alert("Cont creat cu success")				    		       
				    },
				    error:function() {
				    	alert("Eroare!");
				    }
				});
			}
		}
	</script>

</body>
</html>
