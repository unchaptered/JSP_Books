//저자 : carpriceksy

//checkbox 전체 선택, 전체 선택해제
function allCheck(obj){
	const eCheck = document.getElementsByName("eCheck");
	const checkbox = eCheck.length;
	
	if(obj.checked){
		for (var i = 0; i < checkbox; i++) {
			if(eCheck[i].type == "checkbox"){
				eCheck[i].checked = true;
			}
		}
	}
	else{
		for (var i = 0; i < checkbox; i++) {
			if(eCheck[i].type == "checkbox"){
				eCheck[i].checked = false;
			}
		}
	}
}

//이벤트 검색창
function searchEvent(){
	let search = document.getElementById("e_search");
	if(search.value == "" || search.value == null){
		alert("검색어를 입력하세요");
		return false;
	}
	return true;
}
