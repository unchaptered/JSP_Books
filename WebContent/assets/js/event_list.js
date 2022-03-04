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


