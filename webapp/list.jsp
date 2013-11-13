<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/list.css"/>

<script>

	function countText(){
		var allTxtList = document.querySelectorAll('#textSection');
		for (var i=0; i<allTxtList.length;i++){
			var currentNode = allTxtList[i];
			var spanText = currentNode.querySelectorAll('p').length;
			console.log(spanText);
			var prt = currentNode.parentNode;
			//prt.querySelector('div#countTxt').innerText=spanText;
		}
	}
	
	window.onload = countText;

</script>

</head>
<body>
<div id="wrap">
	<div id="header">
		<h1>list view</h1>
	</div>
	
	<div id="container">
		
		<c:forEach items="${boards}" var="board"> 
			
			<div id ="board">
				<div id="photoSection">
					<c:choose>
						<c:when test="${not empty board.filename}"> 
							<img src="/images/${board.filename}"><br>
						</c:when>	

						<c:otherwise>
							<img src="/images/tmp.gif">
						</c:otherwise>
					</c:choose>
				</div>
				
				<div id="textSection">
					<p><span id="title">${board.title}</span><p>
					<p><span id="content">${board.contents}</span></p>
					<c:choose>
						<c:when test="${not empty board.filename}"> 
							<p><span id="filename">${board.filename}</span></p>
						</c:when>	

						<c:otherwise>
							<p><span id="filename">no image</span></p>
						</c:otherwise>
					</c:choose>
					<a href="/board/${board.id}"><input type="button" value="more"></a>
				</div>
				<div id="countTxt"></div>
				

			</div>
		
		</c:forEach>
	</div>
	
	<div id="footer">
		<a href="/"><input type="button" value="main"></a>
		<a href="/board/form"><input type="button" value="write"></a>
		<a href="/login/joinform"><input type="button" value="join"></a>
	</div>
	
</div>

</body>
</html>