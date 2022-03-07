<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_info</title>
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/user/user_pw_show.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	<div class="pwShowWrap">
                <form name="userPwForm" action="${cp}/user/UserInfoPwChange.us" method="post">
    <section class="main_content">
        <div class="notice_detail">
            <span><strong class="title">내정보</strong></span>
            <div class="detail_area">
                <div class="detail_top">
                    <strong class="detail_title">비밀번호 찾기 / 수정</strong>
                </div>
                <div class="detail_content">
                    <table class="pwshow_table">
                        <tbody>
                            <div class="pw_show_body_wrap">
                                    <div class="pw_show_body_inner">
                                        <div class="pw_show_body_text">
                                            <tr>
                                                <th>현재 비밀번호</th>
                                                <c:if test="${findUserPw != null}">
                                                <td><span class="info_userpw"> ${findUserPw.userPassword}</span><span class="InfocheckEmail" name="InfocheckEmail">${findUserPw.userEmail}</span></td>
                                                </c:if>
                                                <c:if test="${loginUser != null}">
                                                <td><span class="info_userpw"> ${loginUser.userPassword}</span><span class="InfocheckEmail" name="InfocheckEmail">${loginUser.userEmail}</span></td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <th><label for="info_newPw">새 비밀번호</label></th>
                                                <td><input type="password" class="info_newPw" id="info_newPw" name="info_newPw"><span id="info_newPwError"></span><br>
                                                    <span class="newPw">※ 기존에 사용하고 있는 비밀번호는 사용할 수 없습니다.</span><br>
                                                    <span class="newPw">※ 영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합하여 8자 이상 입력해 주세요.</span>
                                                </td>
                                            </tr>
                                            </div>
                                            </td>
                                            <tr>
                                                <th><label for="info_newPwRe">비밀번호 확인</label></th>
                                                <td><input type="password" class="info_newPwRe" id="info_newPwRe"><span id="info_newPwReError"></span><br>
                                                <span class="newPw">확인을 위해 새 비밀번호를 다시 입력해주세요.</span>
                                            </td>
                                            </tr>
                                        </div>
                                    </div>
                            </div>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="notice_detail_nav">
                <button type="button" class="idSubmit_btn"><a href="${cp}/index.jsp">홈으로</a></button>
                <input type="submit" class="pwSubmit_btn" value="수정">
            </div>
            </div>
        </section>
                    </form>
        </div>
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
</html>