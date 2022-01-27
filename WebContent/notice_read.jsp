<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 상세페이지 </title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/notice/notice_read.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_detail">
                <a href="./notice_list.jsp"><strong class="title">공지사항</strong></a>
                <form action="./notice_list.jsp" name="event_dForm" method="get" onsubmit="">
                    <div class="detail_area">
                        <div class="detail_top">
                            <strong class="detail_title">공지사항 제목</strong>
                            <div class="detail_sub">
                                <div class="sub">
                                    <p>작성자 </p><span>작성자</span>
                                </div>
                                <div class="sub">
                                    <p>작성일</p> <span>2022-1-20</span>
                                </div>
                                <div class="sub">
                                    <p>조회</p> <span>10000</span>
                                </div>
                                <div class="sub">
                                    <p>첨부파일</p> <a href="#" download id="fileA"><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a>
                                </div>
                            </div>
                        </div>
                        <div class="detail_content">
                            <div class="content_txt">
                                <p>공지사항 내용입니다. </p>
                            </div>
                        </div>
                        <div class="notice_detail_nav">
                            <div class="notice_prev">
                                <a href="./notice_read.jsp">
                                    <span class="notice_arrow">
                                        < </span>
                                            <span>이전글</span>
                                            <p>5번 게시물</p>
                                </a>
                            </div>
                            <div class="notice_next">
                                <a href="./notice_read.jsp">
                                    <p>3번 게시물</p>
                                    <span class="notice_arrow">다음글</span>
                                    <span class="notice_arrow">></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
</html>