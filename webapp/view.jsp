<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/view.css"/>

<script>
	window.onload = function initPage(){
		var cmtHideBt = document.getElementById('hideCmt');
		cmtHideBt.addEventListener('click', hideCmtSec, false);
		
	}
	
	window.onload = function countComments(){
		var cmts = document.querySelectorAll('#commentlist>p');
		console.log(cmts.length);
		var currentNode = document.querySelector('#commentlist'),
			prtn = currentNode.parentNode,
			sbn = prtn.previousSibling;
		var txtn = sbn.querySelector('span');
		txtn.innerText = cmts.length + "comment"
	}
	
	function hideCmtSec(){
		console.log('test1');
		
		var cmtSection = document.getElementById('commentgroup'),
			style = window.getComputedStyle(cmtSection),
			display = style.getPropertyValue('display');
		console.log('test2');
		
		if (cmtSection.style.display == "block"){
			cmtSection.style.display = "none";
			console.log('test3');
		} else {
			cmtSection.style.display = "block";
			console.log('test4');
		}
	}

</script>

</head>
<body>
	<div id = "wrap">
		<div id="header">
			<h1> DETAIL VIEW </h1>	
		</div>
		
		<div id="container">
			<div id="board">
				<span id="title">${board.title}</span><br>
				<c:choose>
					<c:when test="${empty board.filename}">
						<img src="/images/tmp.gif">
						<p><span id="noimg">no image</span></p>
					</c:when>
					<c:otherwise>
						<img src="/images/${board.filename}"><br>
						<p><span id="filename">${board.filename}</span></p>
					</c:otherwise>
				</c:choose>
				<br>
				<div id="contents">${board.contents}</div>
			</div>
			<div>
				<span id="countCmt"></span>
				<input type="button" id="hideCmt" value="comments">
			</div>
			<div id = "commentgroup">
				<div id="commentlist">
					<c:set var="num" value="0"/>
					<c:forEach items="${board.comments}" var="comments">
						<c:set var="num" value="${num+1}"/>
							<p>
							<span id="num">C${num}</span>
							<span id="comment">${comments.content}</span>
							</p>
					</c:forEach>
				</div>
				<form action="/putcomments/${board.id}" method="post"><br>
					<textarea name="content" rows="10" cols="50">댓글달기</textarea><br>
					<input type=submit value=enter>
				</form>
			</div>
		</div>
	</div>
		
	<div id="footer">
		<a href="/"><input type="button" value="main"></a>
		<a href="/board/form"><input type="button" value="write"></a>
		<a href="/board/list"><input type="button" value="list"></a>
	</div>

</body>
</html>
