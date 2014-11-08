<html>
  <head><title>Example :: Spring Application</title></head>
  <body>
    <h1>Titlu: ${title}</h1>
    <p>Mesaj: ${message}</p>
    
    <form name='loginForm'  method='POST' action="/sendMail">	
				<input name="submit" type="submit"
						value="submit" />
		</form>
    
  </body>
</html>