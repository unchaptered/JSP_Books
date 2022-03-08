<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 리스트</title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/event/event_list.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
		<section class="main_content">
			<div class="event">
				<!-- 타이틀 -->
				<a href="${cp}/app/post/EventList.po"><strong class="title">이벤트</strong></a>
				<div>
					<!-- 폼 시작 -->
 					<form action="" name="eventForm" method="get">				
					<!-- 검색창 -->
						<div class="event_search">
							<input type="text" name="keyword" id="e_search" placeholder="이벤트 제목을 입력하세요" value="${param.keyword}">
							<input type="submit" id="searchBtn" onclick="return searchEvent()">
						</div>
						<div class="board_count">total : <span>${eventTotalCnt}</span> / pages : <span>${eventTotalPage}</span></div>
						<div class="createEvent_div">
							<a href="${cp}/app/post/EventAdd.po?eventPage=${eventPage}" class="createEvent">새 이벤트 등록</a>
						</div>
						<!-- 이벤트 박스 (한 페이지 9개)-->
						<div class="eventBox_area">
							<c:choose>"WebContent/app/book/old_book/old_book_list.jsp"
								<c:when test="${eventList.size()>0 and eventList != null }">
									<div class="content__grid">
										<c:forEach var="event" items="${eventList}" varStatus="status">
											<a href="${cp}/app/post/EventRead.po?eventPk=${event.eventPk}&eventPage=${eventPage}" class="eventBox content__container-4">
												<div class="eventBox_img">
													<c:choose>
														<c:when test="${fileList[status.index] != null}">
															<img src="/media/${fileList[status.index]}" alt="배너">
														</c:when>
														<c:otherwise>
															<img src="/assets/img/event_banner1.png" alt="배너">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="eventBox_txt">
													<strong class="box_title">
														${event.postTitle}
													</strong>
													<p class="box_date">
														기간 : ${event.eventStarted} - ${event.eventEnded}
													</p>
												</div>
											</a>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<div class="event_none">
										등록된 이벤트가 없습니다.
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 페이지 버튼 한 페이지 1~10 > 11~20-->
						<div class="pagination">
							<ul>
								<c:if test="${eventPage>10}">
									<li><a href="${cp}/app/post/EventList.po?eventPage=${eventPage-10}" class="pageBtn prev">이전</a></li>
								</c:if>
										
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<c:choose>
										<c:when test="${i == eventPage }">
											<li><span class="pageBtn pageNum current">${i}</span></li>
										</c:when>
										<c:when test="${i == 0}">
											<li><span class="pageBtn pageNum current">1</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/app/post/EventList.po?eventPage=${i}&keyword=${keyword}" class="pageBtn pageNum">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
							<!-- 다음 버튼 : +10페이지가 존재 하는지 확인(있으면 eventPage+10, 없으면 마지막페이지로)-->
								<c:if test="${eventPage>10 && eventPage<eventTotalPage && eventPage+10 < eventTotalPage}">
									<li><a href="${cp}/app/post/EventList.po?eventPage=${eventPage+10}" class="pageBtn next">다음</a></li>
								</c:if>
								<c:if test="${eventPage>10 && eventPage<eventTotalPage && eventPage+10 >= eventTotalPage}">
									<li><a href="${cp}/app/post/EventList.po?eventPage=${eventTotalPage}" class="pageBtn next">다음</a></li>
								</c:if>
							</ul>
						</div>
 					</form>
					<!-- 폼 끝 -->
				</div>
			</div>
		</section>
	</main>	
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
</html>