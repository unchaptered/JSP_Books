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
				<a href=""><strong class="title">이벤트</strong></a>
				<div>
					<!-- 폼 시작 -->
					<form action="" name="eventForm" method="get" onsubmit="sendit()">					
					<!-- 검색창 -->
						<div class="event_search">
							<input type="text" name="e_search" id="e_search" placeholder="검색어를 입력해주세요.">
							<input type="submit" id="searchBtn" onclick="sendit()">
						</div>
						<div class="board_count">total : <span>${eventTotalCnt}</span> / pages : <span>${eventTotalPage}</span></div>
						<div class="createEvent_div">
							<a href="${cp}/app/post/EventAdd.po" class="createEvent">새 이벤트 등록</a>
						</div>
						<!-- 이벤트 박스 (한 페이지 9개)-->
						<div class="eventBox_area">
							<c:choose>
								<c:when test="${eventList.size()>0 and eventList != null }">
									<div class="content__grid">
										<c:forEach var="event" items="${eventList}">
											<a href="${cp}/app/post/event_post/EventRead.po?postPk=${post.postPk}&page=${eventPage}" class="eventBox content__container-4">
												<div class="eventBox_img">
													<img src="" alt="배너">
												</div>
												<div class="eventBox_txt">
													<strong class="box_title">
														${post.postTitle}
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
						<!-- 페이지 버튼 한 페이지 1~10-->
						<div class="pagination">
							<ul>
								<c:choose>
									<c:when test="${eventList.size()==0 or eventList == null }">
										<li><span class="pageBtn pageNum current">1</span></li>
									</c:when>
									<c:otherwise>
										<c:if test="${eventPage>10}">
											<li><a href="${cp}/post/event_post/EventList.po?eventPage=${eventPage-10}" class="pageBtn prev">이전</a></li>
										</c:if>
										<c:forEach begin="${eventStartPage}" end="${eventEndPage}" step="1" var="i">
											<c:choose>
												<c:when test="${i == eventPage }">
													<li><span class="pageBtn pageNum current">${i}</span></li>
												</c:when>
												<c:otherwise>
													<li><a href="${cp}/post/event_post/EventList.po?eventPage=${i}" class="pageBtn pageNum">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${eventPage<eventTotalPage}">
											<li><a href="${cp}/post/event_post/EventList.po?eventPage=${eventPage+10}" class="pageBtn next">다음</a></li>
										</c:if>
									</c:otherwise>
								</c:choose>
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
<script src="${cp}/assets/js/event_list.js"></script>
</html>