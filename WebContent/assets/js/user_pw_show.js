function sendItInfoPw() {
	
	let findpw = document.getElementById("info_findUserPw").innerText;
	let newPw = document.getElementById("info_newPw");
	let newPwre = document.getElementById("info_newPwRe");
	let newPwError = document.getElementById("info_newPwError");
	let newPwreError = document.getElementById("info_newPwReError");
	
	if(findpw == newPw.value) {
		newPw.focus();
		newPwError.innerHTML = "기존과는 다른 비밀번호로 변경하셔야 합니다."
		return false;
	}
	let regPassword = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/
	if(!regPassword.test(newPw.value)){
		newPw.focus();
		newPwError.innerHTML = "비밀번호를 양식에 맞게 다시 입력해 주세요."
		return false;
	}
	if(newPwre.value != newPw.value) {
		newPwre.focus();
		newPwreError.innerHTML = "비밀번호가 일치하지 않습니다."
		return false;
	}
	
}

