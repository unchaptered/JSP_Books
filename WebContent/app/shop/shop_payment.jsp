<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	<!-- 금액 3자리마다 콤마찍을라고 넣음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주문결제 - BOOKS </title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/shop/shop_payment.css">
</head>
<!-- 저자 : jungbc1 -->
<body>
	<!-- 로그인확인. 그냥 url로 들어올경우 방지 -->
	<c:if test="${loginUser == null }">
        <script>
            let cp = "${pageContext.request.contextPath}";
            alert("로그인 후 이용하세요!");
            location.href=cp+"/index.jsp";
        </script>
    </c:if>
	<c:set var="userEmail" value="${loginUser.userEmail}"/>
	<c:set var="userName" value="${loginUser.userName}"/>
	<c:set var="userPhone" value="${loginUser.userPhone}"/>
	<c:set var="userZipcode" value="${loginUser.userZipcode}"/>
	<c:set var="userAddr" value="${loginUser.userAddress}"/>
	<c:set var="userAddrDetail" value="${loginUser.userAddressDetail}"/>
	
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>주문결제</h2>
                <form action="${cp}/shop/ShopPaymentOk.sh" method="post" id="purchase" name="cartForm" onsubmit="return purchase_submit()">
                    <!-- 주문상품 -->
                    <div id="products">
                        <h3>주문상품</h3>
                        <c:set var = "total" value = "0" />
		                <c:choose>
							<c:when test="${cartList.size()>0 and cartList != null}">
								<c:forEach var="product" items="${cartList}" varStatus="status">	<!-- varStatus="status" 인덱싱처리위해서-->
					                <div id="cart${status.count}">
										<input type="hidden" name="products" value="${product.cartnum}">	<!-- 구매상품배열 req로 넘김 --> 
										<input type="hidden" name="quantity" value="${product.quantity}">	<!-- 구매수량배열 req로 넘김 --> 
			                            <a href="#"><img src="${cp}/assets/img/book_sample1.jpg" alt="book"></a>
			                            <svg onclick="delCart(`cart${status.count}`)" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
			                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
			                            </svg>
			                            <div>
			                                <p>${product.title}</p>
			                                <p><span>주문금액</span><span class="prodPrice"><fmt:formatNumber value="${product.price*product.quantity}" pattern="#,###" /></span></p>
			                                <p><span>수량</span>${product.quantity}</p>
			                            </div>
			                        </div>
		        					<c:set var= "total" value="${total + product.price*product.quantity}"/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="text-align:center; font-size: 20px"><strong id="cartExist">주문할 상품이 없습니다.</strong></p>
							</c:otherwise>
						</c:choose>
                        <div id="total">
                            <p><span>결제예정금액</span><span id="order_sum"><fmt:formatNumber value="${total}" pattern="#,###" /></span></p>
                            <input type="checkbox" name="agree1" id="agree1" required>
                            <label for="agree1">비회원 개인정보 수집 및 이용동의(필수)</label><br>
                            <input type="checkbox" name="agree2" id="agree2" required>
                            <label for="agree2">주문내역확인 동의(필수)</label><br>
                            <button id="btn_submit">결제하기</button>
                            <button type="button" onclick="location.href='${cp}/shop/ShopBags.sh'">장바구니가기</button>
                        </div>
                    </div>
                    <div id="right_box">
                        <!-- 주문결제 폼 -->
                        <div id="guest_info">
                            <h3>주문정보</h3>
                            <p><span>주문자 이름</span><input type="text" name="guestName" value="${userName}" disabled></p>
                            <p><span>주문자 이메일</span><input type="email" name="guestEmail" value="${userEmail}" disabled></p>
                            <p><span>주문자 휴대폰</span><input type="tel" name="guestPhone" value="${userPhone}" disabled></p>
                            <!-- <p><span>주문조회 비밀번호</span><input type="password" name="guest_pw1"></p>
                            <p><span>비밀번호 확인</span><input type="password" name="guest_pw2"></p> -->
                        </div>
                        <!-- 배송정보 폼 -->
                        <div id="delivery_info">
                            <h3>배송정보</h3>
                            <p><label for="correctUser">주문자와 동일</label>
                            <input type="checkbox" id="correctUser" name="correctGuest" checked>
                            </p>
                            <p><span>이름</span><input type="text" name="delivName" value="${userName}" required></p>
                            <p><span>휴대폰</span><input type="tel" name="delivPhone" value="${userPhone}" required></p>
                            <p><span>우편번호</span><input name="delivPostnum" type="text" id="postcode" placeholder="우편번호" value="${userZipcode}" readonly required><input type="button" onclick="sample6_execDaumPostcode()" value="검색"></p>
                            <p><span>주소</span><input type="text" name="delivAddr" id="address" placeholder="주소" value="${userAddr}" readonly required></p>
                            <p><span>상세주소</span><input type="text" name="delivAddrDetail" id="detailAddress" placeholder="상세주소" value="${userAddrDetail}" required></p>
                        </div>
                        <!-- 결제정보 -->
                        <div id="payment_info">
                            <h3>결제정보</h3>
                            <!-- 카드, 페이 둘중한가지로 분기 -->
                            <div id="cards">
                                <a href='javascript:void(0);' onclick="selectPayment(this)" class="on"><img src="${cp}/assets/img/icon_card_1.png" alt="카드" onclick='preventClick(event)'>신한카드</a>
                                <a href='javascript:void(0);' onclick="selectPayment(this)" class="on"><img src="${cp}/assets/img/icon_card_4.png" alt="카드" onclick='preventClick(event)'>현대카드</a>
                                <a href='javascript:void(0);' onclick="selectPayment(this)" class="on"><img src="${cp}/assets/img/icon_card_7.png" alt="카드" onclick='preventClick(event)'>삼성카드</a>
                            </div>
                            <div id="pays">
                                <a href='javascript:void(0);' onclick="selectPayment(this)" class="on"><img src="${cp}/assets/img/icon_pay_1.png" alt="페이" onclick='preventClick(event)'>네이버페이</a>
                                <a href='javascript:void(0);' onclick="selectPayment(this)" class="on"><img src="${cp}/assets/img/icon_pay_2.png" alt="페이" onclick='preventClick(event)'>카카오페이</a>
                            </div>
                            <input type="hidden" id="payment" name="payment" value="" required>	<!-- 선택된 결제방법이 value에 담긴다. form의 param으로 넘겨 결재내역에 방법추가 -->
                        </div>
                    </div>
                </form>
            </section>
        </section>
    </main>
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 다음 우편번호찾기api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_payment.js"></script>
</script>
</html>