<html>
  <head><title>Example :: Spring Application</title></head>
  <body>
    <div align="right">
    	<button onClick="logout()">Log Out</button>
    </div>
    
    
    <div align="center">
    <p>
   	ID: ${user.id} <br>
   	Username: ${user.username} <br>
   	Password: ${user.password}	<br>
   	Email: ${user.email}	<br>
    </p>
    
    
    </div>
    
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	function logout(){
		window.location.href="/";
	}
	</script>
    
  </body>
</html>