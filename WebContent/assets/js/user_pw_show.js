function sendItInfoPw() {
	
	let findpw = document.getElementById("info_findUserPw").innerText;
	let newPw = document.getElementById("info_newPw");
	let newPwre = document.getElementById("info_newPwRe");
	let newPwError = document.getElementById("info_newPwError");
	let newPwreError = document.getElementById("info_newPwReError");
	
	if(findpw == newPw.value) {
		newPw.focus();
		newPwError.innerHTML = "&nbsp;&nbsp;기존에 사용하고 있는 비밀번호는 사용할 수 없습니다."
		return false;
	}
	let regPassword = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/
	if(!regPassword.test(newPw.value)){
		newPw.focus();
		newPwError.innerHTML = "&nbsp;&nbsp;비밀번호를 양식에 맞게 다시 입력해 주세요."
		return false;
	}
	if(newPwre.value != newPw.value) {
		newPwre.focus();
		newPwreError.innerHTML = "&nbsp;&nbsp;비밀번호가 일치하지 않습니다."
		return false;
	}
	
}

// 변경 실패시 알럿창 띄우고 index로 이동
if(window.location == "http://localhost:9090/project-2022-01-korea-Books/app/user/user_pw_show.jsp?ch=t"){
    alert("비밀번호가 변경되었습니다.");
    window.location.href="http://localhost:9090/project-2022-01-korea-Books/index.jsp";
}
if(window.location == "http://localhost:9090/project-2022-01-korea-Books/app/user/user_pw_show.jsp?ch=f"){
    alert("비밀번호 변경 실패!");
}


