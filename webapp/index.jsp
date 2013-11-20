<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>안녕!</title>

<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/index.css"/>
</head>
<body>
	<div id="wrap">
		<div id = "header">
			<h1> WELCOME </h1>
		</div>
		
		<div id="container">
		
			<c:choose>
			<c:when test="${not empty sessionScope.strId}"> 
					<p>Hi! <span>${sessionScope.strId}</span> :)</p>
					<a href="/login/out"><input type="submit" value="logout!"></a>
			</c:when>
			<c:otherwise>
				<form action="/login" method="post">
					<input type="text" name="strId"><br>
					<input type="password" name="password"><br>
					<input type="submit" value="go!">
				</form>
				
			</c:otherwise>
			</c:choose>
			
		</div>	
		
		<div id="footer">
			<a href="/board/form"><input type="button" value="write"></a>
			<a href="/board/list"><input type="button" value="list"></a>
			<a href="/login/joinform"><input type="button" value="join"></a>
		</div>
	</div>

</body>
</html>
