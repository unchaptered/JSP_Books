<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주문결제 - BOOKS </title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/shop/shop_payment.css">
</head>
<!-- 저자 : jungbc1 -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>주문결제</h2>
                <form action="">
                    <!-- 주문상품 -->
                    <div id="products">
                        <h3>주문상품</h3>
                        <div>
                            <a href="#"><img src="../../assets/img/book_sample1.jpg" alt="book"></a>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                            <div>
                                <p>돈의 흐름에 올라타라</p>
                                <p><span>주문금액</span>17,000</p>
                                <p><span>수량</span>1</p>
                            </div>
                        </div>
                        <div>
                            <a href="#"><img src="../../assets/img/book_sample2.jpg" alt="book"></a>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            <div>
                                <p>떠먹는 국어문법</p>
                                <p><span>주문금액</span>16,000</p>
                                <p><span>수량</span>1</p>
                            </div>
                        </div>
                        <div id="total">
                            <p><span>결제예정금액</span><span>34,000원</span></p>
                            <input type="checkbox" name="agree1" id="agree1">
                            <label for="agree1">비회원 개인정보 수집 및 이용동의(필수)</label><br>
                            <input type="checkbox" name="agree2" id="agree2">
                            <label for="agree2">주문내역확인 동의(필수)</label><br>
                            <button>결제하기</button>
                            <button>장바구니가기</button>
                        </div>
                    </div>
                    <div id="right_box">
                        <!-- 주문결제 폼 (비회원전용) -->
                        <div id="guest_info">
                            <h3>주문정보</h3>
                            <p><span>주문자 이름</span><input type="text" name="guest_name"></p>
                            <p><span>주문자 이메일</span><input type="email" name="guest_email"></p>
                            <p><span>주문자 휴대폰</span><input type="tel" name="guest_phone"></p>
                            <p><span>주문조회 비밀번호</span><input type="password" name="guest_pw1"></p>
                            <p><span>비밀번호 확인</span><input type="password" name="guest_pw2"></p>
                        </div>
                        <!-- 배송정보 폼 (비회원전용) -->
                        <div id="delivery_info">
                            <h3>배송정보</h3>
                            <p>주문자와 동일<input type="checkbox" id="correct_user" name="correct_guest" checked>
                            <label for="correct_user"></label>
                            </p>
                            <p><span>이름</span><input type="text" name="deliv_name"></p>
                            <p><span>휴대폰</span><input type="tel" name="deliv_phone"></p>
                            <p><span>우편번호</span><input type="text" name="deliv_postnum" id="addr"><button>검색</button></p>
                            <p><span>상세주소</span><input type="text" name="deliv_addr"></p>
                        </div>
                        <!-- 결제정보 -->
                        <div id="payment_info">
                            <h3>결제정보</h3>
                            <!-- <div id="select_pay">
                                <button>신용카드</button>
                                <button>네이버페이</button>
                                <button>카카오페이</button>
                            </div> -->
                            <!-- 카드, 페이 둘중한가지로 분기 -->
                            <div id="cards">
                                <a href='javascript:void(0);'><img src="./assets/img/icon_card_1.png" alt="카드" onclick='preventClick(event)'>신한카드</a>
                                <a href='javascript:void(0);'><img src="./assets/img/icon_card_4.png" alt="카드" onclick='preventClick(event)'>현대카드</a>
                                <a href='javascript:void(0);'><img src="./assets/img/icon_card_7.png" alt="카드" onclick='preventClick(event)'>삼성카드</a>
                            </div>
                            <div id="pays">
                                <a href='javascript:void(0);'><img src="./assets/img/icon_pay_1.png" alt="페이" onclick='preventClick(event)'>네이버페이</a>
                                <a href='javascript:void(0);'><img src="./assets/img/icon_pay_2.png" alt="페이" onclick='preventClick(event)'>카카오페이</a>
                            </div>
                        </div>
                    </div>

                </form>
            </section>
        </section>
    </main>
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_payment.js"></script>
</html>