<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 장바구니 - BOOKS </title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/shop/shop_bags.css">
</head>
<!-- 저자 : jungbc1 -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>장바구니</h2>
                <div id="cart_items">
                    <!-- onsubmit="return false" input콘트롤 액션시 제출을 막음 -->
                    <form action="" method="GET" id="purchase">
                        <table id="cart_table">
                            <tr id="cart_thead">
                                <th></th>
                                <th colspan="2">상품정보</th>
                                <th>판매가</th>
                                <th>수량</th>
                                <th>주문금액</th>
                                <th>상태</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="a_book" id="check_a_book" onclick="toggle_box()" checked></td>
                                <td><a href="#"><img src="../../assets/img/book_sample1.jpg" alt="book"></a></td>
                                <td><a href="#">돈의 흐름에 올라타라</a></td>
                                <td>17,000</td>
                                <td>
                                    <div>
                                        <button type="button" onclick="book_ea_down(this)">－</button>
                                        <input type="text" name="book_ea" value="1" id="book_ea1" onkeyup="enterkey(this)">
                                        <button type="button" onclick="book_ea_up(this)">＋</button>
                                    </div>
                                </td>
                                <td>17,000</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="a_book" id="check_a_book" onclick="toggle_box()" checked></td>
                                <td><a href="#"><img src="../../assets/img/book_sample2.jpg" alt="book"></a></td>
                                <td><a href="#">떠먹는 국어문법</a></td>
                                <td>16,000</td>
                                <td>
                                    <div>
                                        <button type="button" onclick="book_ea_down(this)">－</button>
                                        <input type="text" name="book_ea" value="1" id="book_ea2" onkeyup="enterkey(this)">
                                        <button type="button" onclick="book_ea_up(this)">＋</button>
                                    </div>
                                </td>
                                <td>16,000</td>
                                <td>정상</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="a_book" id="check_a_book" onclick="toggle_box()" checked></td>
                                <td><a href="#"><img src="../../assets/img/book_sample3.jpg" alt="book"></a></td>
                                <td><a href="#">하루 한 장 마음챙김 긍정 확언 필사집</a></td>
                                <td>20,000</td>
                                <td>
                                    <div>
                                        <button type="button" onclick="book_ea_down(this)">－</button>
                                        <input type="text" name="book_ea" value="0" id="book_ea3" onkeyup="enterkey(this)">
                                        <button type="button" onclick="book_ea_up(this)">＋</button>
                                    </div>
                                </td>
                                <td>0</td>
                                <td>품절</td>
                            </tr>
                        </table>
                        <div id="select_controler">
                            <input type="checkbox" name="all_book" id="check_all_book" onclick="check_all(this)">
                            <label for="check_all_book">전체선택</label>
                            <button type="button" onclick="remove_cart()" id="select_remove">선택상품삭제</button>
                        </div>
                    </form>
                </div>
                <div id="order_info">
                    <div id="total_sum">
                        <span>총 주문 금액</span><span id="order_sum">33,000</span>
                    </div>
                    <div id="btn_area">
                        <button type="submit" form="purchase">비회원주문</button>
                        <button type="submit" form="purchase">회원주문</button>
                    </div>
                </div>
            </section>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_bags.js"></script>
</html>