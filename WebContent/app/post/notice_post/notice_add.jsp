<!-- 저자 : carpriceksy -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 작성 </title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/notice/notice_add.css">
<link rel="stylesheet" href="${cp}/assets/css/summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<c:if test="${loginAdmin == null }">
		<script>
			alert("관리자 계정만 접근할 수 있습니다.");
			location.href="${cp}/index.jsp";
		</script>
	</c:if>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_write">
                <strong class="title">공지사항 작성</strong>
                <!-- 폼 시작 -->
                <form action="${cp}/post/NoticeAddOk.po" name="noticeAddForm" method="post" enctype="multipart/form-data">
                    <div class="goList_div">
                    	<a href="${cp}/post/NoticeList.po?noticePage=${param.noticePage==null ? 1 : param.noticePage}" class="goList">목록보기</a>
                    </div>
                    <div>
                        <div class="write_content">
                            <strong class="detail_title">공지사항 제목</strong>
                            <input type="text" name="postTitle" placeholder="제목을 입력하세요." id="input-title">
                        </div>
                        <div class="write_content">
                            <strong class="detail_title plus">공지사항 상세</strong>
                            <div class="fileBtn">
                                <label for="input-file">첨부 파일</label> 
                                <input type="file" name="noticeFile" id="input-file" onchange="showName()"/>
                                <div id="showFiles"></div>
                            </div>
                            <textarea name="postText" cols="100" rows="20" placeholder="내용을 입력하세요." id="input-text"></textarea>
                        </div>
                        <div class="checkBox">
                            <label for="notice_check" class="lbl">중요 공지사항으로 등록</label> <input type="checkbox"
                                name="noticePin" id="notice_check">
                        </div>
                    </div>
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="등록" onclick="return addNotice()">
                    </div>                    
                </form>
                <!-- 폼 종료 -->
            </div>
        </section>
    </main>
	
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/notice_add.js"></script>
<script src="${cp}/assets/js/summernote/summernote-lite.js"></script>
<script src="${cp}/assets/js/summernote/lang/summernote-ko-KR.js"></script>
</html>