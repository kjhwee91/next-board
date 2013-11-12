<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>안녕!</title>

<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/index.css"/>
<script>

</script>

</head>
<body>
	<div id="wrap">
		<div id = "header">
			<h1> WELCOME </h1>
		</div>
		
		<div id="container">
			<form action="/login" method="post">
				<input type="text" name="id" value="id"><br>
				<input type="password" value="password"><br>
				<!--
				<label>name : </label><input type="text"><br>
				<label>password : </label><input type="password"><br>
				-->
				<input type="submit" value="go!">
			</form>
		</div>	
		
		<div id="footer">
			<a href="/board/form"><input type="button" value="write"></a>
			<a href="/board/list"><input type="button" value="list"></a>
			<a href="/login/signupform"><input type="button" value="join"></a>
		</div>
	</div>

</body>
</html>
