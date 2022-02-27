<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 상세페이지 </title>
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
                <a href="${cp}/app/post/EventList.po?eventPage=${param.eventPage == null ? 1 : param.eventPage}"><strong class="title">이벤트</strong></a>
                <!-- 폼 시작 -->
                <form>
                    <div>
                        <div class="top_title event_detail_topbar">
                            <p>${event.postTitle} </p>
                            <span>이벤트 기간 : ${event.eventStarted} - ${event.eventEnded}</span>&nbsp;
                            <span>조회수 : ${event.postViewed}</span>&nbsp;
                            <a href="javascript:like(${event.eventPk})">♡</a><span id="likeResult">${event.eventLike}</span>
                        </div>
                        <c:if test="${file != null}">
	                        <div class="event_detail_img">
	                            <img src="${imgRoot}" alt="이벤트 상세이미지">
	                        </div>
                        </c:if>
                        <div class="event_detail_txt">
                            <p class="detail_txt">${event.postText}</p>
                        </div>
                        <div class="eventReadBtn">
                            <button class="readBtn" id="eventUpdate" formaction="${cp}/app/post/EventEdit.po?eventPk=${event.eventPk}" 
                            	formmethod="post" onclick="return updateCheck()">수정</button>
                            <button class="readBtn" id="eventDelete" formaction="javascript:document.eventRemoveForm.submit()" onclick="return deleteCheck()">삭제</button>
                        </div>
                    </div>
                </form>
                <form name="eventRemoveForm" action="${cp}/app/post/EventRemove.po" method="get">
                	<input type="hidden" name="eventPk" value="${event.eventPk}">
                </form>
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/event_read.js"></script>
<script>
	//좋아요 //아이디 당 한 번씩 수정 필요 //누르면 +1, 또 누르면 -1되게 likeaction수정
	let flag = false;
	function like(eventPk){		
		const result = document.getElementById("likeResult");
		const xhr = new XMLHttpRequest();
		if(!flag){
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						result.innerHTML = Number(result.innerHTML)+1;
					}
				}
			}	
			xhr.open("GET","${pageContext.request.contextPath}/app/post/EventLike.po?eventPk="+eventPk,true);
			xhr.send();
			flag = true;
		}
		else{
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						result.innerHTML = Number(result.innerHTML)-1;
					}
				}
			}	
			xhr.open("GET","${pageContext.request.contextPath}/app/post/EventLike.po?eventPk="+eventPk,true);
			xhr.send();
			flag = false;
		}
	}
</script>
</html>