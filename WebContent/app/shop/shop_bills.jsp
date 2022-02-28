<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 구매내역 - BOOKS </title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/shop/shop_bills.css">
</head>
<!-- 저자 : jungbc1 -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>구매내역</h2>
                <p><span>김사과</span><span id="rank">(VVIP)</span><span>님의 구매내역</span></p>
                <div id="select_period">
                    <span>기간조회</span>
                    <button type="button" class="on" onclick="select_period(this)">1주</button>
                    <button type="button" class="on active" onclick="select_period(this)">1개월</button>
                    <button type="button" class="on" onclick="select_period(this)">3개월</button>
                    <button type="button" class="on" onclick="select_period(this)">6개월</button>
                    <button type="button">조회</button>
                </div>
                <div id="notice">
                    <ul>
                        <li>최근 1개월이 기본으로 조회 되며, 기간 변경시 기간 선택한 후 조회버튼을 클릭해 주세요.</li>
                        <li>한번에 조회 가능한 기간은 최근 6개월까지 입니다.</li>
                    </ul>
                </div>
                <div id="prd_list">
                    <table id="prd_table">
                        <tr id="prd_thead">
                            <th>주문번호</th>
                            <th>주문금액</th>
                            <th colspan="2">상품정보</th>
                            <th>수량</th>
                            <th>주문상태</th>
                        </tr>
                        <tr>
                            <td>
                                <a href="#">02243291</a>
                            </td>
                            <td>17,000</td>
                            <td>
                                <a href="#" id="book1"><img src="../../assets/img/book_sample1.jpg" alt="책"><span></span></a>
                            <td>
                                <a href="#">돈의 흐름에 올라타라</a>
                                <button type="button">리뷰등록</button>
                            </td>
                            </td>
                            <td>1</td>
                            <td>
                                <p>배송완료</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#">02345348</a>
                            </td>
                            <td>16,000</td>
                            <td>
                                <a href="#" id="book1"><img src="../../assets/img/book_sample2.jpg" alt="책"></a>
                            </td>
                            <td>
                                <a href="#">떠먹는 국어문법</a>
                            </td>
                            <td>1</td>
                            <td>
                                <p>배송중</p>
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_bills.js"></script>
</html>