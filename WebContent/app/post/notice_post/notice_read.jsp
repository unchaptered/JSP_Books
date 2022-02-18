<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 상세페이지 </title>
<link rel="stylesheet" href="../../../assets/css/styles.css">
<link rel="stylesheet" href="../../../assets/css/screens/notice/notice_read.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice_detail">
                <a href=""><strong class="title">공지사항</strong></a>
                <form name="noticeReadForm">
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
                                    <p>첨부파일</p> <a href="" download><span><img src="../../../assets/img/icon_download.png" alt="파일" id="fileDownLoad"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="detail_content">
                            <div class="content_txt">
                                <p>공지사항 내용입니다. </p>
                            </div>
                        </div>
                        <div class="noticeReadBtn">
                            <button class="readBtn" id="noticeUpdate" formaction="" formmethod="post" onclick="return updateCheck()">수정</button>
                            <button class="readBtn" id="noticeDelete" formaction="" formmethod="post" onclick="return deleteCheck()">삭제</button>
                        </div>
                        <div class="notice_detail_nav">
                            <div class="notice_prev">
                                <a href="">
                                    <span class="notice_arrow"><</span>
                                    <span>이전글</span>
                                    <p>5번 게시물 제목</p>
                                </a>
                            </div>
                            <div class="notice_next">
                                <a href="">
                                    <p>3번 게시물 제목</p>
                                    <span>다음글</span>
                                    <span class="notice_arrow">></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="../../../assets/js/nav_menu.js"></script>
<script src="../../../assets/js/notice_read.js"></script>
</html>