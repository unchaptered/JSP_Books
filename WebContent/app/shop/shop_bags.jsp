<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	<!-- 금액 3자리마다 콤마찍을라고 넣음 -->
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
	<!-- 로그인확인. 그냥 url로 들어올경우 방지 -->
	<c:if test="${loginUser == null }">
        <script>
            let cp = "${pageContext.request.contextPath}";
            alert("로그인 후 이용하세요!");
            location.href=cp+"/index.jsp";
        </script>
    </c:if>
	<!-- 주문결제 페이지에서 구매오류로 넘어왔을때 출력 -->
	<c:if test="${requestScope.errorMsg != null}">
		<script>
			alert("${requestScope.errorMsg}");
		</script>
	</c:if>
	
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="main-sizer">
            <section class="shop_content">
                <h2>장바구니</h2>
                <div id="cart_items">
                    <form action="${cp}/shop/Payment.sh" method="post" id="purchase" name="cartForm">
                        <table id="cart_table">
                            <tr id="cart_thead">
                                <th width="7%"></th>
                                <th width="35%" colspan="2">상품정보</th>
                                <th width="15%">판매가</th>
                                <th width="21%">수량</th>
                                <th width="11%">주문금액</th>
                                <th width="11%">재고</th>
                            </tr>
                            
                            <c:set var = "total" value = "0" />
			                <c:choose>
								<c:when test="${cartList.size()>0 and cartList != null}">
									<c:forEach var="product" items="${cartList}" varStatus="status">	<!-- varStatus="status" 인덱싱${status.count} 1,2,3... --> 
										<tr>
			                               <td><input type="checkbox" name="cartnum" id="cart${status.count}" value="${product.cartnum}" onclick="toggle_box()" checked></td>
			                               <td><a href="#"><img src="${cp}/assets/img/book_sample1.jpg" alt="book"></a></td>
			                               <td><a href="#">${product.title}</a></td>
			                               <td><fmt:formatNumber value="${product.price}" pattern="#,###" /></td>
			                               <td>
			                                   <div>
			                                       <button type="button" onclick="book_ea_down(this)">－</button>
			                                       <input type="text" name="quantity" value="${product.quantity}" id="book_ea${status.count}" onkeyup="enterkey(this)">
			                                       <button type="button" onclick="book_ea_up(this)">＋</button>
			                                   </div>
			                               </td>
			                               <td><fmt:formatNumber value="${product.price*product.quantity}" pattern="#,###" /></td>
			                               <td>${product.mount <= 0 or product.mount == null ? "품절" : product.mount <= 100 ? product.mount+="개" : "정상"}</td>
			        					</tr>
			        					<c:set var= "total" value="${total + product.price*product.quantity}"/>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" style="text-align:center; font-size: 20px">
											<strong>장바구니에 담긴 상품이 없습니다.</strong>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
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
                        <span>총 주문 금액</span><span id="order_sum"><fmt:formatNumber value="${total}" pattern="#,###" /></span>
                    </div>
                    <div id="btn_area">
                        <button type="button" onclick="location.href='${cp}/book/NewBookList.nb'">계속쇼핑</button>
                        <button type="button" onclick="payment_submit()">주문하기</button>
                    </div>
                </div>
            </section>
            <a href="javascript:addCart(2,2)">추가</a>	<!-- 장바구니추가 테스트용 -->
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_bags.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_button.js"></script> <!-- 장바구니추가 테스트용 -->
</html>