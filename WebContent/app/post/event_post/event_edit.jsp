<!-- 저자 : carpriceksy -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 수정 </title>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/event/event_add.css">
<link rel="stylesheet" href="${cp}/assets/css/summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	<!-- 로그인 체크 -->
	<c:if test="${loginAdmin == null }">
		<script>
			alert("관리자 계정만 접근할 수 있습니다.");
			location.href="${cp}/index.jsp";
		</script>
	</c:if>
	
	<main id="main">
        <section class="main_content">
            <div class="event_write">
                <!-- 타이틀 -->
                <strong class="title">이벤트 수정</strong>
                <!-- 폼 시작 -->
                <form action="${cp}/post/EventEditOk.po" name="eventEditForm" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="eventPk" value="${event.eventPk}">
                    <div class="goList_div">
                        <a href="${cp}/post/EventList.po?eventPage=${param.eventPage==null ? 1 : param.eventPage}" class="goList">목록보기</a>
                    </div>
                    <p class="must">필수 입력 항목 <span class="redStar">*</span></p>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 제목 <span class="redStar">*</span></strong>
                        <input type="text" name="postTitle" placeholder="제목을 입력하세요." id="input-title"
                        	value="${event.postTitle}">
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 기간 <span class="redStar">*</span></strong>
                        <div class="detail_date">
                            <div class="date_start">
                                <p>이벤트 시작일</p><input type="date" name="eventStarted" id="input-dateStart"
                                	value="${event.eventStarted }">
                            </div>
                            <div class="date_end">
                                <p>이벤트 종료일</p><input type="date" name="eventEnded" id="input-dateEnd"
                                	value="${event.eventEnded }">
                            </div>
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 배너 이미지</strong>
                        <div class="fileBtn">
                            <label for="input-file1">첨부 파일</label> 
                            <input type="file" name="eventFile"  id="input-file1" class="input-file"
                                accept="image/*" onchange="javascript:setThumbnail(this,1);showName(1);"/>
							<c:choose>
								<c:when test="${not empty eventFile.postFileSystem || eventFile.postFileSystem != null}">
									<div class="showFileName" id="showFileName1">
                                		${eventFile.postFileOrigin}&nbsp;&nbsp;<a href="javascript:removeEventImg(${eventFile.postFilePk})">[X]</a>
                            		</div>
								</c:when>
								<c:otherwise>
									<div class="showFileName" id="showFileName1">
                                		목록에 나타낼 이미지를 등록하세요.
                            		</div>
								</c:otherwise>
							</c:choose>                            
                            <div class="imgPreview_div">
                            	<c:choose>
                            		<c:when test="${eventFile.postFileSystem != null or not empty eventFile.postFileSystem}">
                            			<img src="${cp}/media/post/${eventFile.postFileSystem}" class="imgPreview" id="imgPreview1"/>
                            		</c:when>
                            		<c:otherwise>
		                                <img class="imgPreview" id="imgPreview1"/>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <input type="hidden" id="stageEventFileOrigin" name="stageEventFileOrigin" value="${eventFile.postFileOrigin}">
                            <input type="hidden" id="stageEventFileSystem" name="stageEventFileSystem" value="${eventFile.postFileSystem}">
                        </div>
                        <div class="fileBtn">
                            <label for="input-file2">첨부 파일</label> 
                            <input type="file" name="eventFileDetail" id="input-file2" class="input-file"
                                accept="image/*" onchange="javascript:setThumbnail(this,2);showName(2);"/>
                            <c:choose>
								<c:when test="${not empty eventFileDetail.postFileSystem || eventFileDetail.postFileSystem != null}">
									<div class="showFileName" id="showFileName2">
                                		${eventFileDetail.postFileOrigin}&nbsp;&nbsp;<a href="javascript:removeEventImgDetail(${eventFileDetail.postFilePk})">[X]</a>
                            		</div>
								</c:when>
								<c:otherwise>
									<div class="showFileName" id="showFileName2">
                                		상세페이지에 나타낼 이미지를 등록하세요.
                            		</div>
								</c:otherwise>
							</c:choose>         
                            <div class="imgPreview_div">
                                <c:choose>
                            		<c:when test="${eventFileDetail.postFileSystem != null or not empty eventFileDetail.postFileSystem}">
                            			<img src="${cp}/media/post/${eventFileDetail.postFileSystem}" class="imgPreview" id="imgPreview2"/>
                            		</c:when>
                            		<c:otherwise>
		                                <img class="imgPreview" id="imgPreview2"/>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <input type="hidden" id="stageEventFileDetailOrigin" name="stageEventFileDetailOrigin" value="${eventFileDetail.postFileOrigin}">
                            <input type="hidden" id="stageEventFileDetailSystem" name="stageEventFileDetailSystem" value="${eventFileDetail.postFileSystem}">
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 상세 <span class="redStar">*</span></strong>
                        <textarea name="postText" id="eTextarea" placeholder="이벤트 내용을 입력하세요.">${event.postText}</textarea>
                    </div>

                    <!-- 수정완료 버튼 -->
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="수정" onclick="return editEvent()">
                    </div>
                </form>
            </div>
        </section>
    </main>
	
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/event_add.js"></script>
<script src="${cp}/assets/js/summernote/summernote-lite.js"></script>
<script src="${cp}/assets/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	function removeEventImg(postFilePk){
		const showFileName = document.getElementById("showFileName1");
		const stageOrigin = document.getElementById("stageEventFileOrigin");
		const stageSystem = document.getElementById("stageEventFileSystem");
		const imgPreview = document.getElementById("imgPreview1");
		
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					if(confirm("파일을 완전히 삭제하시겠습니까?")){
						showFileName.innerHTML = "목록에 나타낼 이미지를 등록하세요.";
						stageOrigin.remove();
						stageSystem.remove();
						imgPreview.src = "";
					}
				}
			}
		}	
		xhr.open("GET","${pageContext.request.contextPath}/post/RemoveEventFile.po?postFilePk="+postFilePk,true);
		xhr.send();
		flag = true;
	}
	function removeEventImgDetail(postFilePk){
		const showFileName = document.getElementById("showFileName2");
		const stageOrigin = document.getElementById("stageEventFileOrigin");
		const stageSystem = document.getElementById("stageEventFileSystem");
		const imgPreview = document.getElementById("imgPreview2");
		
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					if(confirm("파일을 완전히 삭제하시겠습니까?")){
						showFileName.innerHTML = "상세페이지에 나타낼 이미지를 등록하세요.";
						stageOrigin.remove();
						stageSystem.remove();
						imgPreview.src = "";
					}
				}
			}
		}	
		xhr.open("GET","${pageContext.request.contextPath}/post/RemoveEventFileDetail.po?postFilePk="+postFilePk,true);
		xhr.send();
		flag = true;
	}
	
</script>
</html>