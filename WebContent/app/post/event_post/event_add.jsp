<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 작성 </title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/event/event_add.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	<!-- 로그인 체크 -->
	<%--
	<script>let cp = "${pageContext.request.contextPath}";</script>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace(cp+"/user/");
		</script>
	</c:if> --%>
	
	<main id="main">
        <section class="main_content">
            <div class="event_write">
                <!-- 타이틀 -->
                <strong class="title">이벤트 작성</strong>
                <!-- 폼 시작 -->
                <form action="${cp}/app/post/EventAddOk.po" name="eventAddForm" method="post" enctype="multipart/form-data">
                    <div class="goList_div">
                        <a href="${cp}/app/post/EventList.po" class="goList">목록보기</a>
                    </div>
                    <p class="must">필수 입력 항목 <span class="redStar">*</span></p>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 제목 <span class="redStar">*</span></strong>
                        <input type="text" name="postTitle" placeholder="제목을 입력하세요." id="input-title">
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 기간 <span class="redStar">*</span></strong>
                        <div class="detail_date">
                            <div class="date_start">
                                <p>이벤트 시작일</p><input type="date" name="eventStarted" id="input-dateStart">
                            </div>
                            <div class="date_end">
                                <p>이벤트 종료일</p><input type="date" name="eventEnded" id="input-dateEnd">
                            </div>
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 배너 이미지</strong>
                        <div class="fileBtn">
                            <label for="input-file1">첨부 파일</label> <input type="file" name="inputFileToList"  id="input-file1" class="input-file"
                                accept="image/*" onchange="setThumbnail_list(this);"/>
                            <div class="showFileName" id="showFileName1">
                                이벤트 리스트에 나타낼 이미지를 등록하세요
                            </div>
                            <div class="imgPreview_div">
                                <img class="imgPreview" id="imgPreview1"/>
                            </div>
                        </div>
                        <div class="fileBtn">
                            <label for="input-file2">첨부 파일</label> <input type="file" name="inputFileToRead" id="input-file2" class="input-file"
                                accept="image/*" onchange="setThumbnail_read(this);"/>
                            <div class="showFileName" id="showFileName2">
                                상세페이지에 나타낼 이미지를 등록하세요
                            </div>
                            <div class="imgPreview_div">
                                <img class="imgPreview" id="imgPreview2"/>
                            </div>
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 상세 <span class="redStar">*</span></strong>
                        <textarea class="summernote" name="postText" id="eTextarea" placeholder="이벤트 내용을 입력하세요."></textarea>
                    </div>

                    <!-- 등록 버튼 -->
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="등록" onclick="javascript:return sendit()">
                    </div>
                </form>
            </div>
        </section>
    </main>
	
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/event_add.js"></script>
</html>