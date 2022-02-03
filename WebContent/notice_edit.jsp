<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 수정 </title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/notice/notice_write.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_write">
                <strong class="title">공지사항 수정</strong>
                <!-- 폼 시작 -->
                <form action="./notice_list.jsp" name="noticeWriteForm" method="post" onsubmit="return sendit()" enctype="multipart/form-data">
                    <div>
                        <div class="write_content">
                            <strong class="detail_title">공지사항 제목</strong>
                            <input type="text" name="title" placeholder="제목을 입력하세요." id="input-title">
                        </div>
                        <div class="write_content">
                            <strong class="detail_title plus">공지사항 상세</strong>
                            <div class="fileBtn">
                                <label for="input-file">첨부 파일</label> <input type="file" id="input-file" multiple onchange="showName()"></input>
                                <div id="showFiles"></div>
                            </div>
                            <textarea name="detail" cols="100" rows="20" placeholder="내용을 입력하세요." id="input-text"></textarea>
                        </div>
                        <div class="checkBox">
                            <label for="notice_check" class="lbl">중요 공지사항으로 등록</label> <input type="checkbox"
                                name="important_check" id="notice_check">
                        </div>
                    </div>
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="등록" onsubmit="confirmEnroll()">
                    </div>
                    <a href="./notice_list.jsp" class="goList">목록보기</a>
                </form>
                <!-- 폼 종료 -->
            </div>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="assets/js/notice_write.js"></script>
</html>