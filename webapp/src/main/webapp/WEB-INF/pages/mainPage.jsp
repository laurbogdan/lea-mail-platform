<html>
  <head><title>Example :: Spring Application</title></head>
  <body>
    <div align="right">
    	<button onClick="logout()">Log Out</button>
    </div>
    
    <div align="right">
    	<button onClick="getInbox()">Inbox</button>
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
	
	function getInbox(){	
		$.ajax({
			type: 'GET',
		    url: "inbox",
		    async: false,
		    data: "id=${user.id}",
		    success: function(data) {
		    	for (var i = 0; i < data.length; i++) { 
		    		document.write(data[i].message);
		    	}
		    		       
		    },
		    error:function() {
		    	alert("Eroare! Va rugam reincercati mai tarziu!");
		    }
		});
	}
	</script>
    
  </body>
</html>