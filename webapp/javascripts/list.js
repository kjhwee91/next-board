
function initPage(){
	countCmtNumber();
}

function countCmtNumber(){
	var list = document.querySelectorAll('#textSection');
	for(var i=0; i<list.length; i++){
		var currentCmtNode = list[i];
		console.log(currentCmtNode);
		var	cmtNumber = currentCmtNode.querySelectorAll('p').length;
		currentCmtNode.firstElementChild.innerHTML= cmtNumber + "개의 댓글이 달림";
	}
}

window.onload = initPage();
