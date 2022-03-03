<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_info</title>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/user/user_id_show.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	<div class="idShowWrap">
    <section class="main_content">
        <div class="notice_detail">
            <span><a href="#"><strong class="title">내정보</strong></a></span>
            <div class="detail_area">
                <div class="detail_top">
                    <strong class="detail_title">이메일 찾기</strong>
                </div>
                <div class="detail_content">
                    <table class="idshow_table">
                        <tbody>
                            <div class="id_show_body_wrap">
                                    <div class="id_show_body_inner">
                                        <div class="id_show_body_text">
                                            <h3>회원님의 이메일은</h3><br>
                                            <h2><strong>" ${findUser.userEmail} "</strong></h2><br>
                                            <h3>입니다.</h3>
                                        </div>
                                    </div>
                            </div>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="notice_detail_nav">
                 <button type="button" class="idSubmit_btn"><a href="${cp}/index.jsp">홈으로</a></button>
            </div>
            </div>
        </section>
        </div>
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
</html>