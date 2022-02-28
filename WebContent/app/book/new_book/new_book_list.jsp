<!-- 저자 : 김명현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베이스 - BOOKS</title>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp }/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/index_category.css">
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/main_content.css">
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/page_basket.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../../app/components/nav.jsp"%>

	<main id="main">
		<div class="grid_part">
			<div class="bestseller">
				<img src="${cp }/assets/img/new_book/images/Best_logo.png" alt="">
			</div>
			<section class="main_content backimg">
			<!-- ------------------------------------------------------------- -->
			<c:choose>
			<c:when test="${bookList2.size()>0 and bookList2 != null}">
			<c:forEach var="best" items="${bookList2}">
			<div class="content_container_best">
					<img src="${cp }/assets/img/new_book/images/best-1.png" alt="">
					<div class="photo"></div>
					<div class="book_name">
						<p>
							<a href=""><h3>${best.bookTitle }</h3></a> 
							<input type="button" value="${best.bookWriter }" name="writer">· 
							<input type="button" value="${best.bookPublisher }" name="company">
							<br> ${best.bookPrice}원
						</p>
					</div>
					<div class="blank"></div>
					<div class="book_content">
						<p>
							${best.bookInfo}
							<!--『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2
                            청파동 골목에 자리 잡은 작은 편의점 ALWAYS.
                            어느 날 서울역에서 살던 사내가 야간 알바로 들어오면서
                            편의점에 변화의 바람이 일기 시작한다!-->
						</p>
					</div>
				</div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="content_container_best">
					<img src="${cp }/assets/img/new_book/images/best-1.png" alt="">
					<div class="photo"></div>
					<div class="book_name">
						<p>
							<a href=""><h3>${best.bookTitle }</h3></a> 
							<input type="button" value="${best.bookWriter }" name="writer">· 
							<input type="button" value="${best.bookPublisher }" name="company">
							<br> ${best.bookPrice}원
						</p>
					</div>
					<div class="blank"></div>
					<div class="book_content">
						<p>
							${best.bookInfo}dfsdfdsfsdfdsfsd
							<!--『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2
                            청파동 골목에 자리 잡은 작은 편의점 ALWAYS.
                            어느 날 서울역에서 살던 사내가 야간 알바로 들어오면서
                            편의점에 변화의 바람이 일기 시작한다!-->
						</p>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
			<!-- --------------------------------------------------------------- -->
			</section>
			<hr>
			<section class="category">
				<div class="category_part">
					<div class="kor">
						<ul class="kor_0">
							<a href="#">국내도서</a>
						</ul>
						<ul class="ul_part1">
							<li><a href="#" class="kor_1">소설</a></li>
							<li><a href="#" class="kor_2">시/에세이</a></li>
							<li><a href="#" class="kor_3">경제경영</a></li>
						</ul>
						<ul class="ul_part2">
							<li><a href="#" class="kor_4">자기계발</a></li>
							<li><a href="#" class="kor_5">사회과학</a></li>
							<li><a href="#" class="kor_6">역사⦁문화</a></li>
						</ul>
						<ul class="ul_part3">
							<li><a href="#" class="kor_8">인문</a></li>
							<li><a href="#" class="kor_9">자연⦁과학</a></li>
						</ul>
					</div>
					<div class="forg">
						<ul class="forg_0">
							<a href="#" class="forg_0">외국도서</a>
						</ul>
						<ul class="ul_part1">
							<li><a href="#" class="forg_1">어린이</a></li>
							<li><a href="#" class="forg_2">문학</a></li>
							<li><a href="#" class="forg_5">경제 경영</a></li>
						</ul>
						<ul class="ul_part2">
							<li><a href="#" class="forg_7">컴퓨터</a></li>
							<li><a href="#" class="forg_8"> 기타 </a></li>
						</ul>
					</div>
				</div>
			</section>
			<hr>
			<form name="checkForm" method="post" action="join_db.jsp">
				<section class="main_content">
				<%-- <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="${cp }/assets/img/new_book/images/1984.jpg" alt=""></div>
                    <div class="book_name">
                        <p>
                        <a href="./book.html"><h3>1984</h3></a>
                        <input type="button" value="조지 오웰" name="writer"><br>
                        <input type="button" value="소담출판사" name="company"><br>
                        14800원
                        </p>
                    </div>
                </div> --%>
				<c:choose>
					<c:when test="${bookList.size()>0 and bookList != null }">
						<c:forEach var="title" items="${bookList}">
						<div class="content_container">
						<input type="checkbox" id="check" name="check1" value="왼쪽위"
							onclick="checkthis()">
						<div class="photo">
							<img src="${title.bookImage }" alt="">
						</div>
							<div class="book_name">
							<p>
								<a href="${cp }/book/NewBookRead.nb"> 
								<h3>${title.bookTitle}</h3>
								</a> 
								<input type="button" value="${title.bookWriter }" name="writer"><br>
								<input type="button" value="${title.bookPublisher }" name="company"><br>
								${title.bookPrice }
							</p>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>
					</div>
				</section>
			</form>
		</div>
		<div id="basket">
			<a href="#" id="basket2" onclick="">장바구니</a>
		</div>
		<div class="pagination">
			<table class="pagtable">
				<tr class="pagtr">
					<td class="pagbtn">
						<c:if test="${page>1}">
							<a href="${cp }/book/NewBookList.nb?page=${page-1}">&lt;</a>
						</c:if>
						<c:forEach begin = "${startPage}" end="${endPage}" step="1" var="i">
							<c:choose>
								<c:when test="${i==page}">
									<span class="nowPage">${i}</span>
								</c:when>
								<c:otherwise>
									<span class = "pagbtn2"><a href="${cp }/book/NewBookList.nb?page=${i}">${i }</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${page<totalPage}">
							<a href="${cp }/book/NewBookList.nb?page=${page+1}">&gt;</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
</main>

		<!-- 경로 수정하셔야 합니다. -->
		<%@ include file="../../../app/components/footer.jsp"%>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="../../../assets/js/nav_menu.js"></script>
<script src="../../../assets/js/new_book/index_page.js"></script>
</html>