// 장바구니버튼 bookpk:책상품번호, quantity:구매수량
const addCart = function(bookpk, quantity) {
	if (quantity==0){
		alert("장바구니에 0개를 추가할 수 없습니다!");
		return false;
	}
	
// ajax활용. 로그인되어 있으면 해당상품 장바구니 추가. 안되어 있으면 로그인 페이지 이동. 이동시 동의체크
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText;
					txt = txt.trim();
					if(txt == 'X'){
			        	if(confirm("로그인후 이용 가능합니다.\n로그인 페이지로 이동하시겠습니까?")){
//			        		location.replace(cp+"/index.jsp");	// 기존페이지를 새로운 페이지로 변경시킨다.(덮어쓰기.보안)
				       		location.href=cp+"/index.jsp";	// 새로운페이지로 이동.(히스토리남음.뒤로가기가능)
			        	}
					}else{
			        	if(confirm("선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?")){
				       		//location.replace(cp+"/shop/Bags.sh");	// 기존페이지를 새로운 페이지로 변경시킨다.(덮어쓰기.보안)
				       		location.href=cp+"/shop/ShopBags.sh";	// 새로운페이지로 이동.(히스토리남음.뒤로가기가능)
			        	}
					}
			}
		}
	}
	xhr.open("GET",cp+"/shop/ShopAddCartOk.sh?bookpk="+bookpk+"&quantity="+quantity,false); //false. 동기처리. 응답기다림
	xhr.send();
}