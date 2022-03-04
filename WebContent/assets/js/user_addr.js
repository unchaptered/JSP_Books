/* 저자 : 고결 */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
function checkall(checkall) {
    const check_box = document.getElementsByName("checkbox_agree");
    check_box.forEach((checkbox) => {
     checkbox.checked = checkall.checked;
    })
}

function checkLoginEmail(){
	const xhr = new XMLHttpRequest();
	let loginEmailError = document.getElementById("loginEmailError");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				const loginForm = document.loginForm;
				let email = loginForm.email;
				txt = txt.trim();
				console.log(txt);
				if(txt == 'O'){
					loginEmailError.innerHTML = "일치하는 이메일이 존재하지 않습니다.";
					loginEmailError.style = "color:red";
					email.focus();
				}
				else{
					loginEmailError.innerHTML = "사용할 수 있는 이메일입니다.";
					loginEmailError.style="color:rgb(93,176,226)";
					email.focus();
				}
			}
		}
	}
	xhr.open("GET",cp+"/user/LoginCheckEmailOk.us?email="+email.value);
	xhr.send();
}
function senditLogin() {
	const loginForm = document.loginForm;
	let email = loginForm.email;
	let loginEmailError = document.getElementById("loginEmailError");
	if(loginEmailError.innerText == "일치하는 이메일이 존재하지 않습니다."){
		email.focus();
		return false;
	}
	if(email.value == "") {
		email.focus();
		loginEmailError.innerHTML = "이메일을 입력해 주세요.";
		loginEmailError.style="color:red";
		return false;
	}
	let loginPw = loginForm.loginPw;
	let loginPwError = document.getElementById("loginPwError");
	if(loginPw.value == "") {
		loginPw.focus();
		loginPwError.innerHTML = "비밀번호를 입력해 주세요."
		loginPwError.style="color:red";
		return false;
	}
	
}



function checkJoin() {
	const xhr = new XMLHttpRequest();
	let joinEmailError = document.getElementById("joinEmailError");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				const joinForm = document.joinForm;
				let userEmail = joinForm.userEmail;
				txt = txt.trim();
				console.log(txt);
				if(txt == 'O'){
					joinEmailError.innerHTML = "사용할 수 있는 이메일입니다.";
					joinEmailError.style="color:rgb(93,176,226)";
					userEmail.focus();
				}
				else{
					joinEmailError.innerHTML = "중복된 이메일이 있습니다.";
					joinEmailError.style="color:red";
					userEmail.focus();
				}
			}
		}
	}
	xhr.open("GET",cp+"/user/JoinCheckEmailOk.us?userEmail="+userEmail.value);//XMLHttpRequest.OPENED
	xhr.send();
}


function senditJoin(){
	const joinForm = document.joinForm;
	let userEmail = joinForm.userEmail;
	let joinEmailError = document.getElementById("joinEmailError");
	if(userEmail.value == "") {
		console.log('다시 해봐 이메일 공백')
		userEmail.focus();
		return false;	
	}
	$('#userEmail').css('border-color','#e1e2e3');
	let regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/
	if(!regEmail.test(userEmail.value)){
		console.log('다시 해봐 이메일 정규식')
		userEmail.focus();
		return false;
	}
	if(joinEmailError.innerText == "중복된 이메일이 있습니다."){
		console.log("중복된 이메일")
		userEmail.focus();
		return false;
	}
	let userName = joinForm.userName;
	let joinNameError = document.getElementById("joinNameError");
	if(userName.value == ""){
		console.log('다시 해봐 이름 공백')
		joinNameError.innerHTML = "이름을 입력해 주세요."
		joinNameError.style="color:red"
		userName.focus();
		return false;
	}
		joinNameError.innerHTML = "";
	let regPassword = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/
	let joinPasswordError = document.getElementById("joinPasswordError");
	let userPassword = joinForm.userPassword;
	if(!regPassword.test(userPassword.value)){
		console.log('다시 해봐 비밀번호 정규식')
		joinPasswordError.innerHTML = "비밀번호를 양식에 맞게 다시 입력해 주세요."
		joinPasswordError.style="color:red";
		userPassword.focus();
		return false;
	}
	if(userPassword.value.search(/\s/) != -1){
		console.log('다시 해봐 비밀번호 찐공백')
		joinPasswordError.innerHTML = "비밀번호를 입력해 주세요."
		joinPasswordError.style="color:red";
		userPassword.focus();
		return false;
	}
		joinPasswordError.innerHTML = "";
	let userPasswordre = joinForm.userPasswordre;
	let joinPasswordreError = document.getElementById("joinPasswordreError");
	if(userPasswordre.value == ""){
		console.log('다시 해봐 비밀번호 확인 공백')
		joinPasswordreError.innerHTML = "비밀번호 확인을 입력해 주세요."
		joinPasswordreError.style="color:red";
		userPasswordre.focus();
		return false;
	}
	if(userPassword.value != userPasswordre.value){
		console.log('다시 해봐 비밀번호확인불일치')
		joinPasswordreError.innerHTML = "비밀번호가 일치하지 않습니다."
		joinPasswordreError.style="color:red";
		userPassword.focus();
		return false;
	}
		joinPasswordreError.innerHTML = "";
	let userPhone = joinForm.userPhone;
	let joinPhoneError = document.getElementById("joinPhoneError");
	if(userPhone.value == ""){
		console.log('다시해봐 휴대폰 공백')
		joinPhoneError.innerHTML = "휴대폰 번호를 입력해 주세요."
		joinPhoneError.style="color:red";
		userPhone.focus();
		return false;
	}
		joinPhoneError.innerHTML = "";
	let userZipcode = joinForm.userZipcode;
	let joinAdressError = document.getElementById("joinAdressError");
	if(userZipcode.value == ""){
		sample6_execDaumPostcode();
		return false;
	}
	let userAddressDetail = joinForm.userAddressDetail;
	if(userAddressDetail.value == ""){
		console.log('다시해봐 상세주소')
		joinAdressError.innerHTML = "상세주소를 입력해 주세요."
		joinAdressError.style="color:red";
		userAddressDetail.focus();
		return false;
	}
		joinAdressError.innerHTML = "";
	let userBank = joinForm.userBank;
	let joinBankError = document.getElementById("joinBankError");
	if(userBank.value == "은행"){
		console.log('은행 이름 선택 오류')
		joinBankError.innerHTML = "은행을 선택해 주세요."
		joinBankError.style="color:red";
		userBank.focus();
		return false;
	}
		joinBankError.innerHTML = "";
	let userBankAccount = joinForm.userBankAccount;
	if(userBankAccount.value == ""){
		console.log('다시해봐 계좌번호')
		joinBankError.innerHTML = "계좌번호를 입력해 주세요."
		joinBankError.style="color:red";	
		userBankAccount.focus();
		return false;
	}
		joinBankError.innerHTML = "";
	let checkboxAll = document.getElementById("checkbox_all")
	let checkboxPilsoo = document.getElementById("checkbox_pilsoo")
	let checkboxEvent = document.getElementById("checkbox_eventmail")
	let joinAgreeError = document.getElementById("joinAgreeError")
	let ca = $(checkboxAll).prop("checked");
	let cp = $(checkboxPilsoo).prop("checked");
	let ce = $(checkboxEvent).prop("checked");
	if(ca == false && cp == false && ce == false){
		console.log('전체동의에 체크가 안되있');
		console.log('필수항목에 체크가 안되있');
		console.log('이벤트알림에 체크가 안되있');
		joinAgreeError.innerHTML = "개인정보 수집 및 이용동의에 체크해 주세요."
		joinAgreeError.style="color:red";
		return false;
	}
		joinAgreeError.innerHTML = "";
	if(cp == false) {
		console.log('필수항목에 체크해주세요.');
		joinAgreeError.innerHTML = "필수항목에 체크해 주세요."
		joinAgreeError.style="color:red";
		return false;
	}
		joinAgreeError.innerHTML = "";
	
}

// 로그인 실패시 알럿창 띄우고 index로 이동
if(window.location == "http://localhost:9090/project-2022-01-korea-Books/index.jsp?l=f"){
    alert("로그인 실패 !");
    window.location.href="http://localhost:9090/project-2022-01-korea-Books/index.jsp";
}




