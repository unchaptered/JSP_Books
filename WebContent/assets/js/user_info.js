function execDaumPostcode() {
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
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
           
            
        }
    }).open();
}

//user_info change

function changeEmail() {
	let emailtxt = document.getElementById("user_email_text");
	emailtxt.readOnly= false;
	emailtxt.style=" background-color: #fff;"
}
function changeName() {
	let nametxt = document.getElementById("user_name_text");
	nametxt.readOnly= false;
    nametxt.style=" background-color: #fff;"
}
function changePhone() {
	let phonetxt = document.getElementById("user_phone_text");
	phonetxt.readOnly= false;
    phonetxt.style=" background-color: #fff;"
}

// user_info 유효성(빈공간)
function sendItInfo() {
	let userInfoForm = document.userInfoForm;
	let userInfoName = userInfoForm.user_name_text;
	let userInfoPhone = userInfoForm.user_phone_text;
	let infoPhoneError = document.getElementById("infoPhoneError");
	let postcode = userInfoForm.postcode;
	let detailAddress = userInfoForm.detailAddress;
	let regNum = /^[0-9]+$/;
	
	let banknum = userInfoForm.banknum;
	
	if(userInfoName.value == ""){
		userInfoName.focus();
		return false;
	}
	if(userInfoPhone.value == "") {
		userInfoPhone.focus();
		return false;
	}
	if(!regNum.test(userInfoPhone.value)){
		userInfoPhone.focus();
		infoPhoneError.innerHTML = "휴대폰 번호는 숫자만 입력 가능합니다!"
		return false;
	}
	if(postcode.value == "") {
		execDaumPostcode();
		return false;
	}
	if(detailAddress.value == ""){
		detailAddress.focus();
		return false;
	}
	if(banknum.value == ""){
		banknum.focus();
		return false;
	}
	return true;
}

if(window.location == "http://localhost:9090/project-2022-01-korea-Books/app/user/user_info.jsp?ch=t"){
    alert("정보가 수정되었습니다.");
}
if(window.location == "http://localhost:9090/project-2022-01-korea-Books/app/user/user_info.jsp?ch=f"){
    alert("정보 수정 실패!");
}



	
	
	
	
	
	
	
	
	
	
	
	