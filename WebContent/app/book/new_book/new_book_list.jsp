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
				<div class="content_container_best">
					<img src="${cp }/assets/img/new_book/images/best-1.png" alt="">
					<div class="photo"></div>
					<div class="book_name">
						<p>
							<a href=""><h3>불편한 편의점</h3></a> <input type="button" value="작가"
								name="writer">· <input type="button" value="출판사"
								name="company"><br> 11000원
						</p>
					</div>
					<div class="blank"></div>
					<div class="book_content">
						<p>
							불편한데 자꾸 가고 싶은 편의점이 있다! 힘들게 살아낸 오늘을 위로하는 편의점의 밤 정체불명의 알바로부터 시작된
							웃음과 감동의 나비효과...
							<!--『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2
                            청파동 골목에 자리 잡은 작은 편의점 ALWAYS.
                            어느 날 서울역에서 살던 사내가 야간 알바로 들어오면서
                            편의점에 변화의 바람이 일기 시작한다!-->
						</p>
					</div>
				</div>
				<div class="content_container_best">
					<img src="${cp }/assets/img/new_book/images/best-2.png" alt="">
					<div class="photo2"></div>
					<div class="book_name">
						<p>
							<a href="#"><h3>벼랑 위의 집</h3></a> <input type="button" value="작가"
								name="writer">· <input type="button" value="출판사"
								name="company"><br> 11000원
						</p>
					</div>
					<div class="blank"></div>
					<div class="book_content">내용</div>
				</div>
				<div class="content_container_best">
					<img src="${cp }/assets/img/new_book/images/best-3.png" alt="">
					<div class="photo3"></div>
					<div class="book_name">
						<p>
							<a href=""><h3>센 강의 이름 모를 여인</h3></a> <input type="button"
								value="작가" name="writer">· <input type="button"
								value="출판사" name="company"><br> 11000원
						</p>
					</div>
					<div class="blank"></div>
					<div class="book_content">내용</div>
				</div>
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
							<img src="${title.new_book_image }" alt="">
						</div>
							<div class="book_name">
							<p>
								<a href="${cp }/book/NewBookRead.nb"> 
								<h3>${title.new_book_title}</h3>
								</a> 
								<input type="button" value="${title.new_book_writer }" name="writer"><br>
								<input type="button" value="${title.new_book_publisher }" name="company"><br>
								${title.new_book_price }
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