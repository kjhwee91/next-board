<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div id="container">
			<form action="/login/join" method="post">
				<input type="text" name="email" value="email"><br>
				<input type="text" name="strId" value="id"><br>
				<input type=password name="password" value="password"><br>
				<input type="submit" value="go!">
			</form>
		</div>	

</body>
</html>