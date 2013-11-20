<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 2w(추가)-1-m1 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/list.css"/>
	<link rel="javascript" type="text/javascript" href="/javascripts/list.js">

</head>
<body>
<div id="wrap">

	<div id="header">
		<h1>list view</h1>
	</div>
	
	<div id="container">
		<!-- 게시글 등록 -->	
		<div id="submitcontent">
			<c:choose>
			<c:when test="${not empty sessionScope.strId}"> 
				<form action="/board" method="post" enctype="multipart/form-data">
					<p><input type="text" name="title" size=40></input></p>
					<p><textarea name="contents" rows="10" cols="50"></textarea></p>
					<p><input type="file" name="file" value="그림파일선택"></p>
					<p><input type="submit" value="send"></p>
				</form>
			</c:when>
			<c:otherwise>
				<form action="/login" method="post">
					<p><input type="text" name="strId"></p>
					<p><input type="password" name="password"></p>
					<p><input type="submit" value="일단 로그인 고고!"></p>
				</form>
				
			</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 리스트 -->
		<div id = "list">
		<c:forEach items="${boards}" var="board"> 
			<div class ="boardsec">
				<!-- 사진 -->
				<div class="photosec">
					<c:choose>
						<c:when test="${not empty board.filename}"> 
							<img src="/images/${board.filename}"><br>
						</c:when>	
						<c:otherwise>
							<img src="/images/tmp.gif">
						</c:otherwise>
					</c:choose>
				</div>
				
				<!-- 글 -->
				<div class="textsec">
					<!-- 제목 -->
					<p class="title">
						${board.title} 
						<a href="/board/${board.id}"><span>+</span></a>
					</p>
					<!-- 글내용 -->
					<p class="content">${board.contents}</p>
					<!-- 파일이름 -->
					<c:choose>
						<c:when test="${not empty board.filename}"> 
							<p class="filename">${board.filename}</p>
						</c:when>	
						<c:otherwise>
							<p class="filename">no image</p>
						</c:otherwise>
					</c:choose>
					<!-- 댓글 -->
					<div class="commentsec">
						<c:forEach items="${board.comments}" var="comments">
							<p id="comment">${comments.content}</p>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<div id="footer">
		<a href="/"><input type="button" value="main"></a>
		<a href="/board/form"><input type="button" value="write"></a>
		<a href="/login/joinform"><input type="button" value="join"></a>
	</div>
	
</div>

<!-- 자바스크립트 -->
<script>
	function initPage(){
		countCmtNumber();
	}
	
	function countCmtNumber(){
		var allComment = document.querySelectorAll('.textsec');
		for(var i=0; i<allComment.length; i++){
			var currentCmtNode = allComment[i].lastElementChild;
			var	cmtNumber = currentCmtNode.querySelectorAll('p').length;
			currentCmtNode.insertAdjacentHTML("afterbegin"," <p>- "+cmtNumber+"개의 댓글 - </p>");
		}
	}
		
	initPage();
</script>
</body>
</html>