<%@page import="app.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 상세페이지 </title>
<%-- <c:set var="loginAdmin" value="1" /> --%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/event/event_read.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="event_detail">
                <!-- 타이틀 -->
                <a href="${cp}/post/EventList.po?eventPage=${param.eventPage == null ? 1 : param.eventPage}"><strong class="title">이벤트</strong></a>
                <!-- 폼 시작 -->
                <form>
                    <div>
                        <div class="top_title event_detail_topbar">
                            <p>${event.postTitle} </p>
                            <span>이벤트 기간 : ${event.eventStarted} - ${event.eventEnded}</span>&nbsp;
                            <span>조회수 : ${event.postViewed}</span>&nbsp;
                        </div>
                        <div class="event_detail_img">
		                    <c:choose>
								<c:when test="${file != null}">
									<img src="${cp}/media/post/${file.postFileSystem}" alt="${file.postFileOrigin}">
								</c:when>
								<c:otherwise>
									<img src="${cp}/assets/img/event_banner2.png" alt="배너">
								</c:otherwise>
							</c:choose>
	                    </div>
                        <div class="event_detail_txt">
                            <p class="detail_txt">
                            	${event.postText}
                            </p>
                        </div>
                        <div class="likeBtnArea">
                        	<c:choose>
                        		<c:when test="${aleadyLiked == 'Y'}">
		                        	<a href="javascript:like(${event.eventPk})" class="likeBtn likeClicked">
										<img src="${cp}/assets/img/event_like_on.png" alt="좋아요" class="likeHeart">
	                        			<span class="likeText" id="likeResult">${event.eventLike}</span>
										<span class="likeText">&nbsp;좋아요&nbsp;</span>
										<input type="hidden" id="aleadyLiked" value="${aleadyLiked}">
									</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="javascript:like(${event.eventPk})" class="likeBtn">
										<img src="${cp}/assets/img/event_like_off.png" alt="좋아요" class="likeHeart">
	                        			<span class="likeText" id="likeResult">${event.eventLike}</span>
										<span class="likeText">&nbsp;좋아요&nbsp;</span>
										<input type="hidden" id="aleadyLiked" value="${aleadyLiked}">
									</a>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <c:if test="${loginAdmin != null}">
	                        <div class="eventReadBtn">
	                        	<c:if test="${loginAdmin.adminidx == event.postOwner }">
	                            	<button class="readBtn" id="eventUpdate" formaction="${cp}/post/EventEdit.po?eventPk=${event.eventPk}" 
	                            		formmethod="post" onclick="return updateCheck()">수정</button>
	                            </c:if>
	                            <button class="readBtn" id="eventDelete" formaction="javascript:document.eventRemoveForm.submit()" onclick="return deleteCheck()">삭제</button>
	                        </div>
                        </c:if>
                        <div class="goList_div">
                        	<a href="${cp}/post/EventList.po?eventPage=${param.eventPage==null ? 1 : param.eventPage}" class="goList">목록보기</a>
                    	</div>
                    </div>
                </form>
                <form name="eventRemoveForm" action="${cp}/post/EventRemove.po" method="get">
                	<input type="hidden" name="eventPk" value="${event.eventPk}">
                </form>
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/shop_button.js"></script>
<script src="${cp}/assets/js/event_read.js"></script>
<script>
	//좋아요
	function like(eventPk){		
		/* 로그인 체크 */
		if(${empty loginUser}){
			if(confirm("로그인 페이지로 이동합니다.")){
				location.replace("${pageContext.request.contextPath}/index.jsp");
			}
		}
		else{ 
			const result = document.getElementById("likeResult");
			const likeBtn = document.querySelector(".likeBtn");
			const likeHeart = document.querySelector(".likeHeart");
			const aleadyLiked = document.getElementById("aleadyLiked");
			const xhr = new XMLHttpRequest();
			
			if(aleadyLiked.value == "N"){
				xhr.onreadystatechange = function(){
					if(xhr.readyState == XMLHttpRequest.DONE){
						if(xhr.status == 200){
							result.innerHTML = Number(result.innerHTML)+1;
							likeBtn.className += " likeClicked";
							likeHeart.src = "${pageContext.request.contextPath}/assets/img/event_like_on.png";
							aleadyLiked.value ="Y";
						}
					}
				}
				xhr.open("GET","${pageContext.request.contextPath}/post/EventLike.po?eventPk="+eventPk,true);
				xhr.send();
			}
			else{
				xhr.onreadystatechange = function(){
					if(xhr.readyState == XMLHttpRequest.DONE){
						if(xhr.status == 200){
							result.innerHTML = Number(result.innerHTML)-1;
							likeBtn.classList.remove("likeClicked");
							likeHeart.src = "${pageContext.request.contextPath}/assets/img/event_like_off.png";
							aleadyLiked.value = "N";
						}
					}   
				}
				xhr.open("GET","${pageContext.request.contextPath}/post/EventLike.po?eventPk="+eventPk,true);
				xhr.send();
			}
		}  
	};

</script>
</html>