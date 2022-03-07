<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	<!-- 금액 3자리마다 콤마찍을라고 넣음 -->
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
	<!-- 로그인확인. 그냥 url로 들어올경우 방지 -->
	<c:if test="${loginUser == null }">
        <script>
            let cp = "${pageContext.request.contextPath}";
            alert("로그인 후 이용하세요!");
            location.href=cp+"/index.jsp";
        </script>
    </c:if>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>구매내역</h2>
                <p><span>${loginUser.userName}</span><span id="rank">(VVIP)</span><span>님의 구매내역</span></p>
				<form action="${cp}/shop/ShopBills.sh" method="post" id="bill">
					<input type="hidden" name="periodValue" id="periodValue" value="">
				</form>
                <div id="select_period">
                    <span>기간조회</span>
                    <button type="button" class="on" onclick="select_period(this)">1주</button>
                    <button type="button" class="on" onclick="select_period(this)">1개월</button>
                    <button type="button" class="on" onclick="select_period(this)">3개월</button>
                    <button type="button" class="on" onclick="select_period(this)">6개월</button>
                    <button type="submit" form="bill">조회</button>
                    <script>	/* ${period} 기본값 "1개월" */
	                    let periods = document.getElementsByClassName("on")
	                    for (const period of periods) {
	                    	if(period.textContent=='${periodValue}'){
	                    		period.classList.add("active");
	                    	}
	                    }
                    </script>
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
                            <th width="20%">주문번호</th>
                            <th width="40%" colspan="2">상품정보</th>
                            <th width="10%">수량</th>
                            <th width="15%">판매가 합계</th>
                            <th width="15%">주문상태</th>
                        </tr>
                         <c:choose>
	                        <c:when test="${prodList.size()>0 and prodList != null}">
	                        	<c:forEach var="prod" items="${prodList}">
		                        	<tr>
			                            <td>
			                                <a href="#">${prod.billPk}</a><br><span>${prod.billDate}</span>
			                            </td>
			                            <td>
			                                <a href="#"><img src="${cp}/media/${prod.newBookImage}" alt="책"></a>
			                            <td>
			                                <a href="#">${prod.newBookTitle}</a>
			                                <button type="button">리뷰등록</button>
			                            </td>
			                            <td>${prod.productQuantity}</td>
			                            <td><fmt:formatNumber value="${prod.productTotalPrice}" pattern="#,###" />원</td>
			                            <td><p>${prod.billStatus}</p></td>
		                        	</tr>
	                        	</c:forEach>
	                        </c:when>
	                        <c:otherwise>
								<tr>
									<td colspan="6" style="text-align:center; font-size: 20px">
										<strong>구매내역이 없습니다.</strong>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
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