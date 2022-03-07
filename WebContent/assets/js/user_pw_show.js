function sendItInfoPw(){ 
	let infoFindUserPw = document.getElementById("info_findUserPw");
	let infoLoginUserPw = document.getElementById("info_loginUserPw");
	let infoNewPw = document.getElementById("info_newPw");
	let infoNewPwRe = document.getElementById("info_newPwRe");
	let infoNewPwError = document.getElementById("info_newPwError");
	let infoNewPwReError = document.getElementById("info_newPwReError");
	let regPassword = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/
	
	if(infoFindUserPw == infoNewPw.value) {
		infoNewPw.focus();
		infoNewPwError.innerHTML = "기존과는 다른 비밀번호로 변경하셔야 합니다."
		infoNewPwError.style = "color:red";	
		return false;
	}
	if(infoLoginUserPw == infoNewPw.value) {
		infoNewPw.focus();
		infoNewPwError.innerHTML = "기존과는 다른 비밀번호로 변경하셔야 합니다."
		infoNewPwError.style = "color:red";	
		return false;
	}
	if(!regPassword.test(infoNewPw.value)){
		infoNewPw.focus();
		infoNewPwError.innerHTML = "비밀번호를 양식에 맞게 다시 입력해 주세요.";
		infoNewpwerror.style = "color:red";
		return false;
	}
	if(infoNewPwre.value != infoNewPw.value){
		infoNewPwRe.focus();
		infoNewPwReError.innerHTMl = "비밀번호가 일치하지 않습니다.";
		infoNewPwReError.style = "color:red";
		return false;
	}
}