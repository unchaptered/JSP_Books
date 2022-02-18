<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 수정 </title>
<link rel="stylesheet" href="../../../assets/css/styles.css">
<link rel="stylesheet" href="../../../assets/css/screens/notice/notice_add.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_write">
                <strong class="title">공지사항 수정</strong>
                <!-- 폼 시작 -->
                <form action="" name="noticeWriteForm" method="post" onsubmit="return sendit()" enctype="multipart/form-data">
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
                    <a href="" class="goList">목록보기</a>
                </form>
                <!-- 폼 종료 -->
            </div>
        </section>
    </main>

	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="../../../assets/js/nav_menu.js"></script>
<script src="../../../assets/js/notice_add.js"></script>
</html>