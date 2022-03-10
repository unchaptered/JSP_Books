<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 리스트 - BOOKS</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/old_book/old_book_list.css">
</head>
<!-- 저자 : unchaptered -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/nav.jsp" %>
	
	<main id="main">
	
		<!-- 3(1*3) 개의 OldBookSelledDTO -->
        <header class="header_container">
            <div class="header">
                <div class="haeder_title_container">
                    <h2>최대 판매량 중고 도서</h2>
                </div>
                <div class="header_content_slider">
                    <div class="header_content">
                        <div class="haeder_content-left">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" /></svg>
                        </div>
                        <!-- 최초에는 header.js 가 여기에 더미 데이터를 삽입해주었습니다만, 지금은 슬라이더 기능만 남기고 header_slider.js 로 변경되었습니다. -->
                        <c:choose>
                        	<%-- AJAX 호출 데이터 --%>
							<c:when test="${oldBookHotList.size() > 0 and oldBookHotList != null}">
								<c:forEach items="${oldBookHotList}" var="oldBookHot" varStatus="status">
									<div class="header_content_center" style="z-index: ${status.count}">
										 <c:choose>
											<%-- 정크 이미지 출력 --%>
											<c:when test="${oldBook.bookOrgImage eq 'nonedd'}">
												<div class="header_content_center_img">
													<img src="${cp}/assets/img/cover__1.jpg">
												</div>
											</c:when>
											<%-- 호출 이미지 출력 --%>
											<c:otherwise>
												<div class="header_content_center_img">
													<img src="${cp}/assets/img/cover__1.jpg">
												</div>
											</c:otherwise>
										</c:choose>

									 	<div class="header_content_center_datas">
									 		<h3 class="header_title">${oldBookHot.bookTitle} / ${oldBookHot.bookSubtitle}</h3>
									 		<h5 class="header_infos">${oldBookHot.bookInfo}</h5>
									 		<h5 class="header_infos header_infos_short">${oldBookHot.bookInfoShort}</h5>
									 		<div>
									 			<h5 class="header_meta">저자 | ${oldBookHot.bookWriter}</h5>
									 			<h5 class="header_meta">발행일 | ${oldBookHot.bookCreated}</h5>
									 		</div>
									 	</div>
									</div>
								</c:forEach>
                        	</c:when>
                        	<%-- 더미 데이터 --%>
                        	<c:otherwise>
								<h2>도서가 존재하지 않습니다.</h2>
							</c:otherwise>
                        </c:choose>
                        <div class="haeder_content-right">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
                        </div>
                    </div>
                </div>
            </div>
        </header>

		<!-- 등록 가능 도서 : 18(6*3) 개의 BookDTO -->
		<section class="feed_container">
			<!-- Resizer 컨테이너 -->
			<section class="feed-sizer">
				<!-- Mini Nav -->
				<header class="feed_guider">
					<a href="${cp}/">홈</a>
					<p> > </p>
	                <a href="${cp}/book/OldBookList.ob">전체도서</a>
	                <p> > </p>
	                <a href="#">중고 판매 등록 가능</a>
				</header>
				
				<!-- Grid 컨테이너 -->
				<section class="feed-diplay">
					<c:choose>
						<%-- 호출 데이터 --%>
						<c:when test="${oldBookList.size() > 0 and oldBookList != null}">
							<c:forEach items="${oldBookList}" var="oldBook" varStatus="status">
								<%-- bookPk 필요 --%>
			                    <a href="${cp}/book/OldBookAdd.ob?bookPk=${oldBook.bookPk}" class="feed_content">
			                    	<c:choose>
			                    		<%-- 정크 이미지 출력 --%>
			                    		<c:when test="${oldBook.bookOrgImage eq 'none'}">
					                        <div class="feed_img_container">
					                            <img src="${cp}/assets/img/cover__1.jpg">
					                        </div>
			                    		</c:when>
			                    		<%-- 호출 이미지 출력 --%>
			                    		<c:otherwise>
					                        <div class="feed_img_container">
					                            <img src="${cp}/media/${oldBook.bookOrgImage}">
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
							<h3 style="grid-column: 1/-1">등록 가능 도서가 존재하지 않습니다.</h3>
						</c:otherwise>
					</c:choose>
				</section>
			</section>
		</section>
		
		<!-- 구매 가능 도서 -->
		<section class="feed_container">
			<!-- Resizer 컨테이너 -->
			<section class="feed-sizer">
				<!-- Mini Nav -->
				<header class="feed_guider">
					<a href="${cp}/">홈</a>
					<p> > </p>
	                <a href="${cp}/book/OldBookList.ob">전체도서</a>
	                <p> > </p>
	                <a href="#">구매 가능 도서</a>
				</header>
				
				<!-- Grid 컨테이너 -->
				<section class="feed-diplay">
					<c:choose>
						<%-- 호출 데이터 --%>
						<c:when test="${oldBookStockList.size() > 0 and oldBookStockList != null}">
							<c:forEach items="${oldBookStockList}" var="oldBookStock" varStatus="status">
								<%-- bookPk, oldBookPk 필요 --%>
			                    <a href="${cp}/book/OldBookRead.ob?bookPk=${oldBookStock.bookPk}&oldBookPk=${oldBookStock.oldBookPk}" class="feed_content">
			                    	<c:choose>
			                    		<%-- 정크 이미지 출력 --%>
			                    		<c:when test="${oldBookStock.bookOrgImage eq 'none'}">
					                        <div class="feed_img_container">
					                            <img src="${cp}/assets/img/cover__1.jpg">
					                        </div>
			                    		</c:when>
			                    		<%-- 일반 이미지 출력 --%>
			                    		<c:otherwise>
					                        <div class="feed_img_container">
					                            <img src="${cp}/media/${oldBookStock.bookOrgImage}">
					                        </div>
			                    		</c:otherwise>
			                    	</c:choose>
			                        <h2>${oldBookStock.bookTitle}</h2>
			                        <h3>${oldBookStock.bookWriter} 등</h3>
			                        <h4>${oldBookStock.bookCreated}</h4>
			                        <h4>정가 : ${oldBookStock.bookPrice} 원</h4>
			                        
			                        <!-- 기존에 방식, 하지만 더 좋은 방식이 있다.
			                        <fmt:parseNumber var= "discountedPrice" integerOnly= "true" value= "${oldBookStock.bookPrice * (100 - oldBookStock.oldBookDiscount) / 100}" />
			                        -->
			                        
                                	<fmt:formatNumber var="discountedPrice" type="number" maxFractionDigits="3" value="${oldBookStock.bookPrice * (100 - oldBookStock.oldBookDiscount) / 100}"/>
			                        <h4 style="color: #d63031">할인가 : ${discountedPrice} 원</h4>
			                    </a>
							</c:forEach>
						</c:when>
						<%-- 더미 데이터 --%>
						<c:otherwise>
							<h3 style="grid-column: 1/-1">등록된 재고가 존재하지 않습니다.</h3>
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
<!-- header 슬라이더 -->
<script type="text/javascript" src="${cp}/assets/js/header_slider.js"></script>
</html>