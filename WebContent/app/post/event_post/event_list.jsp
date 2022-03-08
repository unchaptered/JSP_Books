<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 리스트</title>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/event/event_list.css">
</head>
<body>
	<c:if test="${loginAdmin==null}">
		<script>
			let cp = "${pageContext.request.contextPath}";
		 	alert("로그인 후 이용하세요");
		 	location.replace(cp+"/admin/AdminJoin.adm")
		</script>
	</c:if>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
		<section class="main_content">
			<div class="event">
				<!-- 타이틀 -->
				<a href="${cp}/post/EventList.po"><strong class="title">이벤트</strong></a>
				<div>
					<!-- 폼 시작 -->
 					<form name="eventForm" method="get">				
					<!-- 검색창 -->
						<div class="event_search">
							<input type="text" name="keyword" id="e_search" placeholder="이벤트 제목을 입력하세요" value="${param.keyword}">
							<input type="submit" id="searchBtn">
						</div>
						<div class="eventTopArea">
							<div class="board_count">total : <span>${eventTotalCnt}</span> / pages : <span>${eventTotalPage}</span></div>
							
							<ul class="sortUl">
								<li class="sortLi">
									<c:choose>
										<c:when test="${sort == 'new'}">
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=new" class="sortA sortClicked" id="new">최근 등록순</a>
										</c:when>
										<c:otherwise>
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=new" class="sortA" id="new">최근 등록순</a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="sortLi">
									<c:choose>
										<c:when test="${sort == 'date'}">
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=date" class="sortA sortClicked" id="date">마감 임박순</a>
										</c:when>
										<c:otherwise>
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=date" class="sortA" id="date">마감 임박순</a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="sortLi">
									<c:choose>
										<c:when test="${sort == 'hit'}">
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=hit" class="sortA sortClicked" id="hit">조회수순</a>
										</c:when>
										<c:otherwise>
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=hit" class="sortA" id="hit">조회수순</a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="sortLi">
									<c:choose>
										<c:when test="${sort == 'like'}">
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=like" class="sortA sortClicked" id="like">좋아요순</a>
										</c:when>
										<c:otherwise>
											<a onclick="sortOption(this.id)" href="${cp}/post/EventList.po?keyword=${keyword}&sort=like" class="sortA" id="like">좋아요순</a>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>
							<c:if test="${loginAdmin != null }">
								<div class="eventBtnArea">
									<a href="${cp}/post/EventAdd.po?eventPage=${eventPage}" class="eventBtn createEvent">새 이벤트 등록</a>
								</div>
							</c:if>
						<!-- 이벤트 박스 (한 페이지 9개)-->
						<div class="eventBox_area">
							<c:choose>"WebContent/app/book/old_book/old_book_list.jsp"
								<c:when test="${eventList.size()>0 and eventList != null }">
									<div class="content__grid">
										<c:forEach var="event" items="${eventList}" varStatus="status">
											<c:choose>
												<c:when test="${event.eventEnded < today}">
													<a href="${cp}/post/EventRead.po?eventPk=${event.eventPk}&eventPage=${eventPage}" class="eventBox content__container-4">
														<c:if test="${loginAdmin != null }">
															<input type="checkbox" name="eCheck" class="eCheck" value="${event.eventPk}">
														</c:if>
														<div class="eventBox_img">
															<img src="${cp}/assets/img/event_deadline.png" alt="배너">
														</div>
														<div class="eventBox_txt">
															<strong class="box_title">
																${event.postTitle}
															</strong>
															<p class="box_date">
																기간 : ${event.eventStarted} - ${event.eventEnded}
																&nbsp;&nbsp;<img src="${cp}/assets/img/event_like_on.png"> ${event.eventLike}
															</p>
														</div>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${cp}/post/EventRead.po?eventPk=${event.eventPk}&eventPage=${eventPage}" class="eventBox content__container-4">
														<c:if test="${loginAdmin != null }">
															<input type="checkbox" name="eCheck" class="eCheck" value="${event.eventPk}">
														</c:if>
														<div class="eventBox_img">
															<c:choose>
																<c:when test="${fileList[status.index] != null}">
																	<img src="${cp}/media/post/${fileList[status.index]}" alt="배너">
																</c:when>
																<c:otherwise>
																	<img src="${cp}/assets/img/event_banner1.png" alt="배너">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="eventBox_txt">
															<strong class="box_title">
																${event.postTitle}
															</strong>
															<p class="box_date">
																기간 : ${event.eventStarted} - ${event.eventEnded}
																&nbsp;&nbsp;<img src="${cp}/assets/img/event_like_on.png"> ${event.eventLike}
															</p>
														</div>
													</a>
												</c:otherwise>
											</c:choose>
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
						<c:if test="${loginAdmin != null }">
							<div class="eventBtnArea">
								<div class="allCheckArea">
									전체선택<input type="checkbox" id="thCheck" name="thCheck" onclick="allCheck(this)">
								</div>
								<a href="javascript:deleteCheck();" class="eventBtn deleteCheckBtn">선택삭제</a>
							</div>
						</c:if>
						<!-- 페이지 버튼 한 페이지 1~10 > 11~20-->
						<div class="pagination">
							<ul>
								<c:if test="${eventPage>10}">
									<li><a href="${cp}/post/EventList.po?eventPage=${eventPage-10}" class="pageBtn prev">이전</a></li>
								</c:if>
										
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<c:choose>
										<c:when test="${i == eventPage }">
											<li><span class="pageBtn pageNum current">${i}</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/post/EventList.po?eventPage=${i}&keyword=${keyword}&sort=${sort}" class="pageBtn pageNum">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 다음 버튼 : +10페이지가 존재 하는지 확인(있으면 eventPage+10, 없으면 마지막페이지로)-->
								<c:if test="${eventPage != eventTotalPage && endPage < eventTotalPage && eventPage+10 < eventTotalPage}">
									<li><a href="${cp}/post/EventList.po?eventPage=${eventPage+10}&keyword=${keyword}&sort=${sort}" class="pageBtn next">다음</a></li>
								</c:if>
								<c:if test="${eventPage != eventTotalPage && endPage < eventTotalPage && eventPage+10 >= eventTotalPage}">
									<li><a href="${cp}/post/EventList.po?eventPage=${eventTotalPage}&keyword=${keyword}&sort=${sort}" class="pageBtn next">다음</a></li>
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
<script src="${cp}/assets/js/event_list.js"></script>
<script>
//공지사항 선택삭제
	function deleteCheck(){
		let eCheck = document.getElementsByName("eCheck");
		let eventPk = ""
		let first = false;
		const xhr = new XMLHttpRequest();
		
		for (i = 0; i < eCheck.length; i++) {
			if(eCheck[i].checked){
				if(!first){
					eventPk = eCheck[i].value;
					first = true;
				}else{
					eventPk += "-" + eCheck[i].value;
				}
			}
		}
		
		if(eventPk.length == 0){
			alert("선택된 글이 없습니다.");
		}
		else{
			if(confirm("선택된 게시물을 삭제하시겠습니까?")){
				xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						location.replace("${pageContext.request.contextPath}/post/EventList.po");		
					}
				}
			}
			xhr.open("GET","${pageContext.request.contextPath}/post/RemoveCheckEvent.po?eventPk="+eventPk,true);
			xhr.send();
		}	
	}
	
}

	
</script>
</html>