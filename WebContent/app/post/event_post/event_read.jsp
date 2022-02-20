<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <a href="${cp}/app/post/EventList.po"><strong class="title">이벤트</strong></a>
                <!-- 폼 시작 -->
                <form name="eventReadForm">
                    <div>
                        <div class="top_title event_detail_topbar">
                            <p>${post.post_title} </p>
                            <span>이벤트 기간 : ${event.event_started} ~ ${event.event_ended}</span>
                        </div>
                        <div class="event_detail_img">
                            <img src="" alt="상세배너">
                        </div>
                        <div class="event_detail_txt">
                            <p class="detail_txt">
                                구매한 상품의 사진과 함께 구매후기를 남겨주세요. <br><br>추첨을 통해 원하시는걸로 챙겨가시라고 괴산장터에서 현금처럼 사용가능한 포인트를 드립니다.
                                <br><br><br>많은 참여하셔서 푸짐한 선물 꼭 ! 받아가세요. </p>
                        </div>
                        <div class="eventReadBtn">
                            <button class="readBtn" id="eventUpdate" formaction="" formmethod="post" onclick="return updateCheck()">수정</button>
                            <button class="readBtn" id="eventDelete" formaction="" formmethod="post" onclick="return deleteCheck()">삭제</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="/WebContent/assets/js/nav_menu.js"></script>
<script src="/WebContent/assets/js/event_read.js"></script>
</html>