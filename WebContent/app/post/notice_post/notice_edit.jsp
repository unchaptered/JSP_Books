<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 수정 </title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/notice/notice_add.css">
<link rel="stylesheet" href="${cp}/assets/css/summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_write">
                <strong class="title">공지사항 수정</strong>
                <!-- 폼 시작 -->
                <form action="${cp}/app/post/NoticeEditOk.po" name="noticeEditForm" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="noticePk" value="${notice.noticePk}">
                    <div>
                        <div class="write_content">
                            <strong class="detail_title">공지사항 제목</strong>
                            <input type="text" name="postTitle" placeholder="제목을 입력하세요." id="input-title"
                            	value="${notice.postTitle}">
                        </div>
                        <div class="write_content">
                            <strong class="detail_title plus">공지사항 상세</strong>
                            
                            <div class="fileBtn">
		                    	<label for="input-file">첨부 파일</label> 
		                        <input type="file" name="noticeFile" id="input-file" onchange="showName()"/>
		                        <div id="showFiles">${file.postFileOrigin}</div>
		                        <!-- <a href="" id="removeBtn">X</a> -->
				                <input type="hidden" id="stageOrigin" name="stageOrigin" value="${file.postFileOrigin }">
		                        <input type="hidden" id="stageSystem" name="stageSystem" value="${file.postFileSystem}">
                            </div>
                            
                            <textarea name="postText" cols="100" rows="20" placeholder="내용을 입력하세요." id="input-text">${notice.postText}</textarea>
                        </div>
                        <div class="checkBox">
                            <label for="notice_check" class="lbl">중요 공지사항으로 등록</label>
                            <c:choose>
	                            <c:when test="${notice.noticePin == 'Y'}">
	                            	<input type="checkbox" name="noticePin" id="notice_check" checked>
	                            </c:when>
	                            <c:otherwise>
	                            	<input type="checkbox" name="noticePin" id="notice_check">
	                            </c:otherwise>
                            </c:choose> 
                        </div>
                    </div>
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="수정" onclick="return editNotice()">
                    </div>
                    <a href="${cp}/app/post/NoticeList.po?noticePage=${param.noticePage==null ? 1 : param.noticePage}" class="goList">목록보기</a>
                </form>
                <!-- 폼 종료 -->
            </div>
        </section>
    </main>

	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/notice_edit.js"></script>
<script src="${cp}/assets/js/summernote/summernote-lite.js"></script>
<script src="${cp}/assets/js/summernote/lang/summernote-ko-KR.js"></script>
</html>