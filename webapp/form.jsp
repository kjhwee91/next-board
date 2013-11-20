<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<!-- 1w-m3 사진을 추가할 수 잇는 입력화면과 Controller생성 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Photo Board</title>
	<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/form.css"/>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<h1> Upload Your Photo </h1>
		</div>
		
		<div id="container">
			<c:choose>
				<c:when test="${not empty sessionScope.strId}"> 
					<form action="/board" method="post" enctype="multipart/form-data">
						<input type="text" name="title" size=40></input><br />
						<textarea name="contents" rows="10" cols="50"></textarea>
						<br>
						<input type="file" name="file" value="그림파일선택">
						<input type="submit" value="send">
						<input type="reset" value="reset">
					</form>
				</c:when>
				<c:otherwise>
					<p>우선 로그인 ㄱㄱ 하세염</p>
					<form action="/login" method="post">
						<input type="text" name="strId"><br>
						<input type="password" name="password"><br>
						<input type="submit" value="go!">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="footer">
			<a href="/"><input type="button" value="main"></a>
			<a href="/board/list"><input type="button" value="list"></a>
			<a href="/login/joinform"><input type="button" value="join"></a>
		</div>
		
	</div>

</body>

</html>
