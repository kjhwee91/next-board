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
