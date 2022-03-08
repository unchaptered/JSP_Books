//저자 : carpriceksy

//checkbox 전체 선택, 전체 선택해제
function allCheck(obj){
	const nCheck = document.getElementsByName("nCheck");
	const checkbox = nCheck.length;
	
	if(obj.checked){
		for (var i = 0; i < checkbox; i++) {
			if(nCheck[i].type == "checkbox"){
				nCheck[i].checked = true;
			}
		}
	}
	else{
		for (var i = 0; i < checkbox; i++) {
			if(nCheck[i].type == "checkbox"){
				nCheck[i].checked = false;
			}
		}
	}
}

//공지사항 검색창
function searchNotice(){
	let search = document.getElementById("n_search");
	if(search.value == "" || search.value == null){
		alert("검색어를 입력하세요");
		return false;
	}
	return true;
}
