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


