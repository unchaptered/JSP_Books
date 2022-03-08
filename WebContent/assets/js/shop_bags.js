// 저자 : jungbc1

const book_ea_up = function(tag){
    // tag 현재 선택된 태그
    if(tag.parentNode.parentNode.nextElementSibling.nextElementSibling.innerHTML!="품절"){
        // tag.previousElementSibling.value 현재 태그의 이전요소노드의 값
        tag.previousElementSibling.value++
        // 주문금액 변경
        tag.parentNode.parentNode.nextElementSibling.innerHTML
        =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")*tag.previousElementSibling.value)
        .toLocaleString('ko-KR');
    }
    // 총주문금액변경
    total_change();
}
const book_ea_down = function(tag){
    tag.nextElementSibling.value==0 ? 0 : tag.nextElementSibling.value--;
    // 주문금액 변경
    tag.parentNode.parentNode.nextElementSibling.innerHTML
    =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")
    *tag.nextElementSibling.value+"")
    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    // 총주문금액변경
    total_change();
}

const remove_cart = function(){
    let arCheckbox = document.querySelectorAll("#cart_table tr td:nth-child(1) input[type=\"checkbox\"]");
    for (const sums of arCheckbox) {
        if(sums.checked){
            // 선택된 장바구니 삭제. 자식노드이하
            sums.parentNode.parentNode.parentNode.removeChild(sums.parentNode.parentNode);
            // DB 카트삭제	sums.value : 체크박스 태그의 값. cartPk 추적
            remove_cart_ajax(sums.value);
        }
    }
    // foreach를 돌며 매회 DB처리해보고, 부하심하면 arrResult로 cartPk의 값들을 받아 마이바티스 foreach 동적처리 한번에.
    // 총주문금액변경
    total_change();
}

const remove_cart_ajax = function(cartPk) {
	let cp = getContextPath();
	if (cartPk==null){
		return false;
	}
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				;
			}
		}
	}
	xhr.open("GET",cp+"/shop/ShopRemoveCartOk.sh?cartPk="+cartPk,false);//false. 동기처리. 응답기다림
	xhr.send();
}

// 장바구니 주문하기 버튼 : 페이지 넘어가기전 카트들의 변경된 갯수들을 DB업데이트. 체크된 카트들만 주문결제 페이지로 이동하고 보여줌.
function payment_submit()  {
	// 선택된 목록 가져오기
	const query1 = 'input[name="cartPk"]';	//체크유무 상관없이 카트모두 긁어옴. 변경된 수량 DBupdate
	const selectedEls = document.querySelectorAll(query1);
	const query2 = 'input[name="quantity"]';
	const qty = document.querySelectorAll(query2);
	  
	// 선택된 목록에서 value 찾기
	selectedEls.forEach((el,index) => {
		//페이지 이동전 ajax루트로 변경수량 업데이트.
		update_cart_ajax(el.value,qty[index].value); // el.value : cartPk, qty[index].value : quantity
	});
	//폼 객체를 찾아서 submit() 장바구니 폼정보 넘기면서 주문결제 페이지로 이동
	document.cartForm.submit();
}


// 장바구니view에서 '주문하기' 버튼 눌렀을때 변경된 수량 DB에 적용
const update_cart_ajax = function(cartPk,quantity) {
	let cp = getContextPath();
	if (cartPk==null && quantity>=0){
		return false;
	}
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				;
			}
		}
	}
	xhr.open("GET",cp+"/shop/ShopUpdateCartOverwriteOk.sh?cartPk="+cartPk+"&quantity="+quantity,false);//false. 동기처리. 응답기다림
	xhr.send();
}

const toggle_box = function(){
    // 총주문금액변경
    total_change();
}
const check_all = function(tag){
    let arCheckbox = document.querySelectorAll("#cart_table tr td:nth-child(1) input[type=\"checkbox\"]");
    for (const sums of arCheckbox) {
        // 전체선택하기가 체크되었으면
        if (tag.checked){
            sums.checked=true;
        }else{
            sums.checked=false;
        }
    }
    // 총주문금액변경
    total_change();
}

const enterkey = function(tag){
    if(event.keyCode==13){
        // 주문금액 변경
        if(tag.parentNode.parentNode.nextElementSibling.nextElementSibling.innerHTML!="품절"){
            tag.parentNode.parentNode.nextElementSibling.innerHTML
            =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")
            *tag.value+"")
            .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            // 총주문금액변경
            total_change();
        }else{
            tag.value=0;
        }
        // unfocus
        tag.blur();
    }
}

// input콘트롤 엔터 입력 시 submit 막기, 연속키눌림 off
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
    event.preventDefault();
    };
}, true);

// 총주문금액변경
const total_change = function(){
    let order_sum = document.getElementById("order_sum");
    let arSum = document.querySelectorAll("#cart_table tr td:nth-child(6)");
    let total = 0;
    for (const sums of arSum) {
        if(sums.parentNode.firstElementChild.firstElementChild.checked==true){
            total += sums.innerHTML.replaceAll(",","")*1;
        }
    }
    order_sum.innerHTML = total.toLocaleString('ko-KR');
}

//자바스크립트에서 콘텍스트페스 구하는 함수
//출처 : https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=mk1126sj&logNo=221019411361
function getContextPath(){
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	return contextPath;
}