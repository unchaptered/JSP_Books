//저자 : carpriceksy

//checkbox 전체 선택, 전체 선택해제
function checkAll(){
	const thCheck = document.getElementById("thCheck");
	const checkbox = document.getElementsByClassName("boardCheck");
	if(thCheck.checked){
		for (var i = 0; i < checkbox.length; i++) {
			checkbox[i].checked = true;
		}
	}
	if(!thCheck.checked){
		for (var i = 0; i < checkbox.length; i++) {
			checkbox[i].checked = false;
		}
	}
}

//공지사항 선택삭제
function deleteCheck(valueArr){
	if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
	}
	else{
		if(confirm("정말 삭제하시겠습니까?")){
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
							
						}
					}
				}
			xhr.open("GET","${pageContext.request.contextPath}/app/post/RemoveCheckNotice.po?valueArr="+valueArr,true);
			xhr.send();
			}	
	}
}

function checkCnt(){
	const checkbox = document.getElementsByClassName("boardCheck");
	const valueArr = new Array();
	for (var i = 0; i < checkbox.length; i++) {
		if(checkbox[i].checked){
			valueArr.push(checkbox[i].value);
		}
	}
	
	
}