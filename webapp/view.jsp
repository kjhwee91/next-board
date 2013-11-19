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

<script>

	window.onload = function initPage(){
		var cmtHide = document.getElementById('hideCmt');
		cmtHide.addEventListener('click', hideCmt, false);
		var cmtDelete = document.getElementById('commentlist').querySelector('a');
		cmtDelete.addEventListener('click', deleteCmt,false);
	}
	
	function deleteComment(e){
		e.preventDefault();
		var commentId = e.currentTarget.getArribute("cmtid");
		console.log(commentId);
	}
	
	/*
	function deleteComment(e) {        
        var commentId = e.currentTarget.getAttribute("data-commentid");
        var boardId = e.currentTarget.parentNode.parentNode.parentNode.parentNode.getAttribute("data-boardid");

        var url = "/comment/delete"; // 서버에 보낼 주소.

        var data = new FormData();
        data.append('commentid', commentId);
        
        var request = new XMLHttpRequest();
        request.open("POST",url,true);
        request.send(data);
        request.onreadystatechange = function() {
                if(request.readyState == 4 && request.status == 200) {
                        console.log("응답이 왔어요~");
                        var commentsArr = JSON.parse(request.responseText);
                        var result = "";
                        commentsArr.forEach(function(value){
                                result += "<p><span>"+ value.contents + "</span>" +
                                "<a href=\"javascript:void(0)\" data-commentid=\""+value.id+"\">삭제</a>" +
                                "</p>";                                
                        });
                        document.querySelector("section[data-boardid=\""+boardId+"\"] .commentList").innerHTML = result;

                        initPage();
     	   }
        };
	}
	*/
	
	window.onload = function countComments(){
		var cmts = document.querySelectorAll('#commentlist>p');
		console.log(cmts);
		var currentNode = document.querySelector('#commentlist');
		var	prtn = currentNode.parentNode;
		var	sbn = prtn.previousSibling;
	}
	
	function hideCmt(){
		
		var cmtSection = document.getElementById('commentgroup'),
			style = window.getComputedStyle(cmtSection),
			display = style.getPropertyValue('display');
		
		if (cmtSection.style.display == "block"){
			cmtSection.style.display = "none";
		} else {
			cmtSection.style.display = "block";
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
				<span id="title">${board.title}</span>
				<form action = "/board/delete/${board.id}"><input type=submit value=delete></input></form>
				<form action = "/board/edit/${board.id}"><input type=submit value=edit></input></form>
				<br>
				
				<!-- 3주차 요구사항 상세보기 화면에서 첨부한 파일이 없을 경우 첨부한 이미지를 보이지 않는다. -->
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
			<div id = "commentgroup">
				<!-- 3주차 요구사항 댓글보기 -->
				<div id="commentlist">
					<c:set var="num" value="0"/>
					<c:forEach items="${board.comments}" var="comments">
						<!-- 댓글 번호 증가시키기, var : 변수, -->
						<c:set var="num" value="${num+1}"/>
						<p>
							<span id="num">C${num}</span>
							<span id="comment">${comments.content}</span>
							<a href="/commentdelete/${comments.id}" cmtid="${comments.id}"><input type="submit" value="delete"></a>
						</p>
					</c:forEach>
				</div>
				<!-- 3주차 요구사항 댓글쓰기 -->
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
