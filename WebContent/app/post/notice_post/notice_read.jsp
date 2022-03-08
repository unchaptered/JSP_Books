<!-- 저자 : carpriceksy -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 상세페이지 </title>
<%-- <c:set var="loginAdmin" value="1" /> --%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/notice/notice_read.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_detail">
                <a href="${cp}/post/NoticeList.po?noticePage=${param.noticePage == null ? 1 : param.noticePage}"><strong class="title">공지사항</strong></a>
                <form>
                    <div class="detail_area">
                        <div class="detail_top">
                            <strong class="detail_title">${notice.postTitle}</strong>
                            <div class="detail_sub">
                                <div class="sub">
                                    <p>작성자 </p><span>${ownerName}</span>
                                </div>
                                <div class="sub">
                                    <p>작성일</p><span>${fn:substring(notice.postCreated,0,10)}</span>
                                </div>
                                <div class="sub">
                                    <p>조회</p> <span>${notice.postViewed}</span>
                                </div>
                                <c:if test="${file != null or file.postFileSystem != null or not empty file.postFileSystem}">
	                                <div class="sub">
	                                    <p>첨부파일</p> <span>${file.postFileOrigin}</span><a href="${cp}/post/FileDownload.po?postFileSystem=${file.postFileSystem}&postFileOrigin=${file.postFileOrigin}"><span><img src="${cp}/assets/img/icon_download.png" alt="파일" id="fileDownLoad"></span></a>
	                                </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="detail_content">
                            <div class="content_txt">
                                <p>${notice.postText}</p>
                            </div>
                        </div>
                        <%-- <c:if test="${loginAdmin != null}"> --%>
	                        <div class="noticeReadBtn">
	                        	<%-- <c:if test="${loginAdmin.adminidx == notice.postOwner}"> --%>
	                            	<button class="readBtn" id="noticeUpdate" formaction="${cp}/post/NoticeEdit.po?noticePk=${notice.noticePk}" 
	                            		formmethod="post" onclick="return updateCheck()">수정</button>
	                            <%-- </c:if> --%>
	                            <button class="readBtn" id="noticeDelete" formaction="javascript:document.noticeRemoveForm.submit()" onclick="return deleteCheck()">삭제</button>
	                        </div>
                        <%-- </c:if> --%>
                        <c:choose>
                        	<c:when test="${notice.noticePin == 'Y' || (prevNoticePk == null && nextNoticePk == null) }">
	                        </c:when>
	                        <c:otherwise> 
		                        <div class="notice_detail_nav">
		                        	<c:if test="${prevNoticePk != null}">
			                            <div class="notice_prev">
			                                <a href="${cp}/post/NoticeRead.po?noticePk=${prevNoticePk}">
			                                    <span class="notice_arrow">&lt;</span>
			                                    <span>이전글</span>
			                                    <p>${prevNoticeTitle}</p>
			                                </a>
			                            </div>
		                        	</c:if>
		                        	<c:if test="${nextNoticePk != null}">
			                            <div class="notice_next">
			                                <a href="${cp}/post/NoticeRead.po?noticePk=${nextNoticePk}">
			                                    <p>${nextNoticeTitle}</p>
			                                    <span>다음글</span>
			                                    <span class="notice_arrow">&gt;</span>
			                                </a>
			                            </div>
		                            </c:if>
		                        </div>
		                    </c:otherwise>    
                        </c:choose>
                        <div class="goList_div">
                    		<a href="${cp}/post/NoticeList.po?noticePage=${param.noticePage==null ? 1 : param.noticePage}" class="goList">목록보기</a>
                    	</div>
                    </div>
                </form>
                <form name="noticeRemoveForm" action="${cp}/post/NoticeRemove.po" method="get">
                	<input type="hidden" name="noticePk" value="${notice.noticePk}">
                </form>
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/notice_read.js"></script>
</html>