<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 보기 - BOOKS</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/old_book/old_book_detail.css">
</head>
<!-- 저자 : unchaptered -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="feed-sizer">
			<header class="feed_guider">
				<a href="${cp}/">홈</a>
				<p> > </p>
                <a href="${cp}/book/OldBookList.ob">전체도서</a>
                <p> > </p>
                <a href="#">구매 가능 도서</a>
			</header>
        </section>
        <header id="old_book">
            <section class="old_book-sizer">
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_img_conatainer">
                	<c:choose>
                		<%-- 정크 이미지 출력 --%>
	                	<c:when test="${targetBook.bookOrgImage eq 'none'}">
	          				<img src="${cp}/assets/img/cover__1.jpg">
	               		</c:when>
	               		<%-- 호출 이미지 출력 --%>
	               		<c:otherwise>
	                    	<img src="${cp}/media/${targetBook.bookOrgImage}.jpg">
	               		</c:otherwise>
                	</c:choose>
                </section>
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_data_container">
                    <!-- 책 카테고리, 책 제목, 저자, 역자, 출판사, 부수, 발행연도, 고유번호 -->
                    <div class="old_book_meta_container">
                        <div class="old_book-801">
                            <h5>${targetBook.bookGenre}</h5>
                            <h2>${targetBook.bookTitle}</h2>
                            <div class="old_book_meta">
                                <h5>저자 : ${targetBook.bookWriter}</h5>
                                <h5>|</h5>
                                <h5>역자 : ${targetBook.bookTranslater}</h5>
                                <h5>|</h5>
                                <h5>출판사 : ${targetBook.bookPublisher}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>부수 : ${targetBook.bookPages}</h5>
                                <h5>|</h5>
                                <h5>발행연도 : ${targetBook.bookCreated}</h5>
                                <h5>|</h5>
                                <h5>발행국가 : ${targetBook.bookCountry}</h5>
                            </div>
                        </div>
                        <div class="old_book-800">
                            <h5>${targetBook.bookGenre}</h5>
                            <h2>${targetBook.bookTitle}</h2>
                            <div class="old_book_meta">
                                <h5>부수 : ${targetBook.bookPages}</h5>
                                <h5>|</h5>
                                <h5>발행연도 : ${targetBook.bookCreated}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>저자 : ${targetBook.bookWriter}</h5>
                                <h5>|</h5>
                                <h5>역자 : ${targetBook.bookTranslater}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>출판사 : ${targetBook.bookPublisher}</h5>
                                <h5>|</h5>
                                <h5>발행국가 : ${targetBook.bookCountry}</h5>
                            </div>
                        </div>
                    </div>
                    <!-- 정가, 할인가액, 주요안내사항, 구매하기, 장바구니 등 -->
                    <div class="old_book_price_container">
                        <div>
                        	<!-- 할인율이 10 ~ 50 사이의 모든 재고량을 계산 (차후 .count 안에 data-set 으로 주입 하여 최대 주문 제어) -->
							<c:set var="targetMaxMount" value="0"/>
							<c:forEach items="${targetInventory}" var="target" varStatus="status">
								<c:set var="targetMaxMount" value="${targetMaxMount + target.oldBookMount}"></c:set>
							</c:forEach>
							
                            <div class="old_book_price">
                                <p>정가</p>
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice}" var="standardPrice" />
                                <p>(${standardPrice}원)</p>
                                <p>|</p>
                                <p>${targetBook.bookMount}권</p>
                            </div>
                            <div class="old_book_price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice * (100 - 10) / 100}" var="discountedPrice10"/>
                                <p>10% 할인</p>
                                <p>(${discountedPrice10}원)</p>
                                <p>|</p>
                                <!-- 할인율이 10 인 것을 찾는 JSTL -->
								<c:forEach items="${targetInventory}" var="target" varStatus="status">
									<c:if test="${target.oldBookDiscount eq '10'}">
	                                	<p>${target.oldBookMount}권</p>
									</c:if>
								</c:forEach>
                            </div>
                            <div class="old_book_price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice * (100 - 20) / 100}" var="discountedPrice20"/>
                                <p>20% 할인</p>
                                <p>(${discountedPrice20}원)</p>
                                <p>|</p>
                                <!-- 할인율이 20 인 것을 찾는 JSTL -->
								<c:forEach items="${targetInventory}" var="target" varStatus="status">
									<c:if test="${target.oldBookDiscount eq '20'}">
	                                	<p>${target.oldBookMount}권</p>
									</c:if>
								</c:forEach>
                            </div>
                            <div class="old_book_price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice * (100 - 30) / 100}" var="discountedPrice30"/>
                                <p>30% 할인</p>
                                <p>(${discountedPrice30}원)</p>
                                <p>|</p>
                                <!-- 할인율이 30 인 것을 찾는 JSTL -->
								<c:forEach items="${targetInventory}" var="target" varStatus="status">
									<c:if test="${target.oldBookDiscount eq '30'}">
	                                	<p>${target.oldBookMount}권</p>
									</c:if>
								</c:forEach>
                            </div>
                            <div class="old_book_price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice * (100 - 40) / 100}" var="discountedPrice40"/>
                                <p>40% 할인</p>
                                <p>(${discountedPrice40}원)</p>
                                <p>|</p>
                                <!-- 할인율이 40 인 것을 찾는 JSTL -->
								<c:forEach items="${targetInventory}" var="target" varStatus="status">
									<c:if test="${target.oldBookDiscount eq '40'}">
	                                	<p>${target.oldBookMount}권</p>
									</c:if>
								</c:forEach>
                            </div>
                            <div class="old_book_price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${targetBook.bookPrice * (100 - 50) / 100}" var="discountedPrice50"/>
                                <p>50% 할인</p>
                                <p>(${discountedPrice50}원)</p>
                                <p>|</p>
                                <!-- 할인율이 50 인 것을 찾는 JSTL -->
								<c:forEach items="${targetInventory}" var="target" varStatus="status">
									<c:if test="${target.oldBookDiscount eq '50'}">
	                                	<p>${target.oldBookMount}권</p>
									</c:if>
								</c:forEach>
                            </div>
                            <p>본 상품은 할인 쿠폰이 적용되지 않는 상품입니다.</p>
                            <p>상품 구매 버튼을 누르면 일시적으로 재고가 감소하며,<br>타 고객님께서는 잠시 해당 제품을 구매하실 수 없게 됩니다.</p>
                        </div>
                        <div class="old_book_btn_menus">
                            <div class="old_book_count">
                                <button type="button" class="count_minus">-</button>
                                <span class="count" data-max-value="${targetMaxMount}">0</span>
                                <button type="button" class="count_plus">+</button>
                            </div>

                            <div class="old_book_btn_container">
                                <button type="button" class="old_book_btn old_book_btn_1">장바구니 담기</button>
                                <button type="button" class="old_book_btn old_book_btn_2">바로구매</button>
                                <button type="button" class="old_book_btn old_book_btn_3">찜하기</button>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </header>
        
		<!-- 최대 6(1*3) 개의 OldBookDTO, 장르 기준으로 긁어 옴 -->
		<section class="feed_container margin-top-zero">
            <section class="feed-sizer">
                <header class="feed_title">같은 장르의 다른 작품 보기 : ${targetBook.bookGenre}</header>
                
                <section class="feed-diplay">
	                <c:choose>
	                	<%-- 호출 데이터 --%>
	                	<c:when test="${oldBookListWithGenre.size() > 0 and oldBookListWithGenre != null}">
	                		<c:forEach items="${oldBookListWithGenre}" var="oldBook" varStatus="status">
	                			<%-- bookPk, oldBookPk 필요 --%>
			                    <a href="${cp}/book/OldBookRead.ob?bookPk=${oldBook.bookPk}&oldBookPk=${oldBook.oldBookPk}" class="feed_content">
			                    	<c:choose>
			                    		<%-- 정크 이미지 출력 --%>
			                    		<c:when test="${oldBook.bookOrgImage eq 'none'}">
					                        <div class="feed_img_container">
					                            <img src="${cp}/assets/img/cover__1.jpg">
					                        </div>
			                    		</c:when>
			                    		<%-- 일반 이미지 출력 --%>	
			                    		<c:otherwise>
					                        <div class="feed_img_container">
					                            <img src="${cp}/media/${oldBook.bookOrgImage}.jpg">
					                        </div>
			                    		</c:otherwise>
			                    	</c:choose>
			                        <h2>${oldBook.bookTitle}</h2>
			                        <h3>${oldBook.bookWriter} 등</h3>
			                        <h4>${oldBook.bookCreated}</h4>
			                        <h4>정가 : ${oldBook.bookPrice} 원</h4>
			                    </a>
	                		</c:forEach>
	                	</c:when>
	                	
						<%-- 더미 데이터 --%>
	                	<c:otherwise>
							<h3 style="grid-column: 1/-1">비슷한 장르의 작품이 없습니다.</h3>
	                	</c:otherwise>
	                </c:choose>
                </section>
            </section>
		</section>
		
		<!-- 최대 6(1*3) 개의 OldBookDTO, 작가 기준으로 긁어 옴 -->
		<section class="feed_container margin-top-zero">
            <section class="feed-sizer">
                <header class="feed_title">같은 작가의 다른 작품 보기 : ${targetBook.bookWriter}</header>
                
                <section class="feed-diplay">
	                <c:choose>
	                	<%-- 호출 데이터 --%>
	                	<c:when test="${oldBookListWithWriter.size() > 0 and oldBookListWithWriter != null}">
	                		<c:forEach items="${oldBookListWithWriter}" var="oldBook" varStatus="status">
	                			<%-- bookPk, oldBookPk 필요 --%>
			                    <a href="${cp}/book/OldBookRead.ob?bookPk=${oldBook.bookPk}&oldBookPk=${oldBook.oldBookPk}" class="feed_content">
			                    	<c:choose>
			                    		<%-- 정크 이미지 출력 --%>
			                    		<c:when test="${oldBook.bookImage eq 'none'}">
					                        <div class="feed_img_container">
					                            <img src="${cp}/assets/img/cover__1.jpg">
					                        </div>
			                    		</c:when>
			                    		<%-- 일반 이미지 출력 --%>
			                    		<c:otherwise>
					                        <div class="feed_img_container">
					                            <img src="${cp}/media/${oldBook.bookOrgImage}.jpg">
					                        </div>
			                    		</c:otherwise>
			                    	</c:choose>
			                        <h2>${oldBook.bookTitle}</h2>
			                        <h3>${oldBook.bookWriter} 등</h3>
			                        <h4>${oldBook.bookCreated}</h4>
			                        <h4>정가 : ${oldBook.bookPrice} 원</h4>
			                    </a>
	                		</c:forEach>
	                	</c:when>
	                	
						<%-- 더미 데이터 --%>
	                	<c:otherwise>
							<h3 style="grid-column: 1/-1">같은 작가의 작품이 없습니다.</h3>
	                	</c:otherwise>
	                </c:choose>
                </section>
            </section>
		</section>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../../components/footer.jsp" %>
</body>
<!-- 메뉴 접기 펼치기 -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<!-- 수량조절기 -->
<script type="text/javascript" src="${cp}/assets/js/old_book_read.js"></script>
</html>