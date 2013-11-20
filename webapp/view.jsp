<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 2w1m3. 데이터베이스에 추가한 데이터를 조회할 수 있는 페이지를 구현한다. -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/view.css"/>

</head>
<body>
	<div id = "wrap">
	
		<div id="header">
			<h1> DETAIL VIEW </h1>	
		</div>
		
		<div id="container">
		
			<div id="board">
				<p>
				<span id=title>${board.title}</span>
				<span id=writer>by. ${board.writer}</span>
				<a href="/board/delete/${board.id}"><input type=submit value=D></input></a>
				<a href="/board/edit/${board.id}"><input type=submit value=E></input></a>
				</p>
				<!-- 3주차 요구사항 상세보기 화면에서 첨부한 파일이 없을 경우 첨부한 이미지를 보이지 않는다. -->
				<c:choose>
					<c:when test="${empty board.filename}">
						<img src="/images/tmp.gif">
						<p id=filename>no image</p>
					</c:when>
					<c:otherwise>
						<img src="/images/${board.filename}"><br>
						<p id=filename>${board.filename}</p>
					</c:otherwise>
				</c:choose>
				<br>
				<p id="contents">${board.contents}</p>
			</div>
			
			<div id = "commentgroup">
				<p>hide comments</p>
				<!-- 3주차 요구사항 댓글보기 -->
				<div id="commentlist">
					<c:set var="num" value="0"/>
					<c:forEach items="${board.comments}" var="comments">
						<!-- 댓글 번호 증가시키기, var : 변수, -->
						<p>
							<span id=cmtcontent>${comments.content}			</span>
							<a href="/commentdelete/${comments.id}" name="${comments.id}"><input type="submit" value="D"></a>
						</p>
					</c:forEach>
				</div>
				<!-- 3주차 요구사항 댓글쓰기 -->
				<form action="/putcomments/${board.id}" enctype="multipart/form-data" method="post" value="${board.id}"><br>
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
<script>

var hideButton = document.querySelector("#commentgroup>p");
hideButton.onclick = function hideCmt(e){
	e.preventDefault();
	var cmtList = document.getElementById('commentlist'),
		currentStyle = document.defaultView.getComputedStyle(cmtList);
		currentDisplay = currentStyle.getPropertyValue('display');
	
	if(currentDisplay=='block'){
		cmtList.style.display='none';
	} else {
		cmtList.style.display='block';
	}
}

var addCmtButton = document.querySelector("#commentgroup>form>input[type=submit]");
addCmtButton.addEventListener('click',writeComments,false);
function writeComments(e){
	e.preventDefault();
	var eleForm = e.target.form;
	var oFormData = new FormData(eleForm);
	
	var sId = eleForm.getAttribute("value");
	var url = "/putcomments/"+sId+".json";
	
	var request = new XMLHttpRequest();
	request.open("POST", url, true);
	console.log(request);
	
	request.onreadystatechange=function(){
		
		if(request.readyState == 4 && request.status == 200){
			console.log("응답옴ㅇㅇ");
			var obj = JSON.parse(request.responseText);
			var eleCommentList = eleForm.previousElementSibling;
			eleCommentList.insertAdjacentHTML("beforeend",
					"<p><span id=cmtcontent>" 
					+ obj.content 
					+ "			</span><a href=/commentdelete/"+ obj.id +" name=${comments.id}><input type=submit value=D></a></p>");
		}
	};
	request.send(oFormData);
}
</script>

</body>
</html>
