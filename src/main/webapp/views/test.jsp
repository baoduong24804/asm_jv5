<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>Login Form</h2>
    <form id="loginForm">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <button type="button" id="loginButton">Login</button>
    </form>
    <div id="loginResult"></div>

	<script>
	$("#test").click(()=>{
        $.get('api/baocuto', function(data, status) {
            alert("Data: " + data + "\nStatus: " + status);
        });
	})
	
	$('#loginButton').click(()=>{
		var p = {
                username: $('#username').val(),
                password: $('#password').val()
            };
		$.ajax({
			  url: "api/post",
			  type: "POST",
			  contentType: 'application/json',
			  data: JSON.stringify(p),
			  success: function( result ) {
			    $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
			  }
			});
	})
	</script>

</body>
</html>