<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Page</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1> Upload Your Photo </h1>
		</div>
		
		<div id="container">
			<form action="/board/editsave/${board.id}" method="post" enctype="multipart/form-data">
				<input type="text" name="title" value="${board.title}" size=40></input><br />
				<textarea name="contents" rows="10" cols="50">${board.contents}</textarea>
				<br>
				<c:choose>
					<c:when test="${empty board.filename}">
						<input type="file" name="file" value="그림파일선택"><br>
					</c:when>
					<c:otherwise>
						<br>
						현재 파일명 : ${board.filename}
						<input type="file" name="file" value="다른 파일 선택"><br>
					</c:otherwise>
				</c:choose>
				<br>---------------------------------------------<br>
				<input type="submit" value="send">
				<input type="reset" value="reset">
			</form>
		</div>
		<br>---------------------------------------------<br>
		<div id="footer">
			<a href="/"><input type="button" value="main"></a>
			<a href="/board/list"><input type="button" value="list"></a>
			<a href="/login/joinform"><input type="button" value="join"></a>
		</div>
	</div>
</body>
</html>