// 저자 : jungbc1

// onclick달린 a태그의 이동막기.
function preventClick(e){
	e.preventDefault()
}

// 주문결제 페이지의 카트삭제(DB삭제X)
const delCart = function(cart){
    let prod = document.getElementsByClassName("prodPrice");
    if(prod.length===1){
    	alert("구매상품은 최소1개 이상입니다!")
    	return false;
    }
    const parent = document.getElementById("products");
    const child = document.getElementById(cart);
    parent.removeChild(child);
    total_change();
    return true;
}

//총주문금액변경
const total_change = function(){
    let order_sum = document.getElementById("order_sum");
    let arSum = document.getElementsByClassName("prodPrice");
    let total = 0;
    for (const sums of arSum) {
        total += sums.innerHTML.replaceAll(",","")*1;
    }
    order_sum.innerHTML = total.toLocaleString('ko-KR');
}

// 결재버튼 클릭
function purchase_submit()  {
	// basic required
	// 결제방법 미선택
	if(document.getElementById("payment").value==""){
		alert("결제방법을 선택하세요!");
		return false;
	}
	if(document.getElementById("cartExist").innerText=='주문할 상품이 없습니다.') {
		alert("주문할 상품이 없습니다!");
		return false;
	}
//	인증번호 발송
//	let pass = window.prompt("1회용 인증번호를 입력해주세요."); //string 타입. 입력 그대로 노출문제. 자바스크립트에서는 비밀번호 보안 개취약
	if(!confirm("결제인증 하시겠습니까?")){
		return false;
	}
	document.getElementById("btn_submit").disabled = "disabled";
	return true;
//	document.cartForm.submit();	//폼 name을 찾아서 submit(). 장바구니 폼정보 넘기면서 주문결제 페이지로 이동
}

// 결제방법 선택
const selectPayment = function(tag){
    let periods = document.getElementsByClassName("on")
    for (const period of periods) {
        period.classList.remove("active");
    }
    tag.classList.add("active");
    document.getElementById("payment").value=tag.innerText;	// name="payment" value값 선택된 결제방법으로 바꿈
}

// 주문자와 동일 input value 처리
const check_correct = function(tag, ...loginUser){	// tag:체크박스태그	, loginUser[]:loginUser[이름,폰번호,우편번호,주소,상세주소]
    let arInput = document.querySelectorAll("#delivery_info input[type=\"text\"], #delivery_info input[type=\"tel\"]");
    // 주문자와 동일이 체크되었으면
    if (tag.checked){
    	let idx=0;
    	for (const input of arInput) {
			input.value=loginUser[idx];
			idx++;
		}
	}else{
		for (const input of arInput) {
			input.value="";
		}
		arInput[0].focus();
	}
}

function sample6_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
														// 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").value = '';
				document.getElementById("detailAddress").focus();
			}
		}).open();
}