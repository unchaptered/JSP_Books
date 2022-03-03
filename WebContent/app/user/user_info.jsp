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
<link rel="stylesheet" href="${cp}/assets/css/screens/user/user_info.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
<div class="user_info_container_wrap">
	<form name="userInfoForm" action="" method="post" onsubmit="return senditInfo();">
    <section class="main_content">
        <div class="notice_detail">
            <span><a href="#"><strong class="title">내정보</strong></a></span>
            <div class="detail_area">
                <div class="detail_top">
                    <strong class="detail_title">내 정보 수정</strong>
                </div>
                <div class="detail_content">
                    <table class="userinfo_table">
                        <tbody>
                            <tr>
                                <th scope="row">이메일</th>
                                <td>
                                <div class="info_user_email">
                                    <span class="user_email_text" id="user_email_text">${loginUser.userEmail}</span>
                                    
                                </div>
                            </td>
                            </tr>
                            <tr>
                                <th scope="row">이름</th>
                                <td>
                                    <div class="info_user_name">
                                        <input type="text" class="user_name_text" value="${loginUser.userName}" readonly id="user_name_text">
                                        <button type="button" class="user_name_btn" onclick="changeName()" id="user_name_btn">&nbsp;이름 변경&nbsp;</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대폰 번호</th>
                                <td>
                                    <div class="info_user_phone">
                                        <input type="text" class="user_phone_text" value="${loginUser.userPhone}" readonly id="user_phone_text">
                                        <button type="button" class="user_phone_btn" onclick="changePhone()" id="user_phone_btn">&nbsp;휴대폰 번호 변경&nbsp;</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호</th>
                                <td>
                                    <div class="info_user_pw">
                                        <table class="user_info_pw_table">
                                            <tbody>
                                                <tr>
                                                    <th>현재 비밀번호</th>
                                                    <td><input type="password" class="info_userpw" value="${loginUser.userPassword}" readonly></td>
                                                    <div class="info_userpw_space input_space"></div>
                                                </tr>
                                                <tr>
                                                    <th><label for="info_userpwre">새 비밀번호</label></th>
                                                    <td><input type="password" class="info_userpwre" id="info_userpwre">
                                                    <span id="info_userpwre_error" class="userInfoError"></span>
                                                    <div class="userpw_text">
                                                    <div class="info_userpwre_space1">
                                                        <span><i class="icon_cross"></i></span><span>기존에 사용하고 있는 비밀번호는 사용할 수 없습니다.</span>
                                                    </div>
                                                    <div class="info_userpwre_space1">
                                                        <span><i class="icon_cross"></i></span><span>영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합하여 8자 이상 입력해 주세요.</span>
                                                    </div>
                                                </div>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="info_userpwre_re">비밀번호 확인</label></th>
                                                    <td><input type="password" class="info_userpwre_re" id="info_userpwre_re">
                                                    <span id="info_userpwre_re_error" class="userInfoError">야야야야야야이런거쓰면</span>
                                                    <div class="info_userpwre_re_space input_space"></div>
                                                    <div class="info_userpwre_space1 userpwre_text">
                                                        <span><i class="icon_cross"></i></span><span>확인을 위해 새 비밀번호를 다시 입력해주세요.</span>
                                                    </div>
                                                </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td>
                                    <div class="info_user_addr">
                                        <table class="user_info_addr_table">
                                            <tbody>
                                                <tr>
                                                    <th>우편번호</th>
                                                    <td><input type="text" class="info_useraddr info_useraddr_num" readonly id="postcode" value="${loginUser.userZipcode}">
                                                    <button type="button" class="user_addr_btn" onclick="execDaumPostcode()">&nbsp;우편번호 찾기&nbsp;</button>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>주소</th>
                                                    <td><input type="text" class="info_useraddr info_user_address" readonly id="address" value="${loginUser.userAddress}">
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>상세주소</th>
                                                    <td><input type="text" class="info_useraddr info_useraddr_detail" id="detailAddress" value="${loginUser.userAddressDetail}">
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>참고항목</th>
                                                    <td><input readonly type="text" class="info_useraddr_detail
                                                        info_useraddr" id="extraAddress" value="${loginUser.userAddressEtc}">
                                                </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">은행정보</th>
                                <td>
                                    <div class="info_user_bank">
                                        <table class="user_info_bank_table">
                                <div class="shinhan bank">
                                <li>
                                <c:if test="${loginUser.userBank == '신한은행'}">
                                    <input type="checkbox" name="shinhan_bank" id="shinhan_bank" style="vertical-align: middle;" value="신한은행" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '신한은행'}">
                                    <input type="checkbox" name="shinhan_bank" id="shinhan_bank" style="vertical-align: middle;" value="신한은행">
                                    </c:if>
                                    <label for="shinhan_bank" class="shin">신한은행</label>
                                </li>
                            </div>
                            <div class="kookmin bank">
                                <li>
                                <c:if test="${loginUser.userBank == '국민은행'}">
                                    <input type="checkbox" name="kookmin_bank" id="kookmin_bank" style="vertical-align: middle;" value="국민은행" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '국민은행'}">
                                    <input type="checkbox" name="kookmin_bank" id="kookmin_bank" style="vertical-align: middle;" value="국민은행">
                                    </c:if>
                                    <label for="kookmin_bank">국민은행</label>
                                </li>
                            </div><div class="mgmg bank">
                                <li>
                                <c:if test="${loginUser.userBank == '새마을금고'}">
                                    <input type="checkbox" name="product_fizzo" id="mg" style="vertical-align: middle;" value="새마을금고" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '새마을금고'}">
                                    <input type="checkbox" name="product_fizzo" id="mg" style="vertical-align: middle;" value="새마을금고">
                                    </c:if>
                                    <label for="mg">새마을금고</label>
                                </li>
                            </div>
                            <div class="kakao">
                            <li>
                            <c:if test="${loginUser.userBank == '카카오뱅크'}">
                                <input type="checkbox" name="product_tea" id="kakao_bank" style="vertical-align: middle;" value="카카오뱅크" checked>
                                </c:if>
                                <c:if test="${loginUser.userBank != '카카오뱅크'}">
                                <input type="checkbox" name="product_tea" id="kakao_bank" style="vertical-align: middle;" value="카카오뱅크">
                                </c:if>
                                <label for="kakao_bank">카카오뱅크</label>
                            </li>
                        </div> 
                            <div class="woori bank">
                                <li>
                                <c:if test="${loginUser.userBank == '우리은행'}">
                                    <input type="checkbox" name="woori_bank" id="woori_bank" style="vertical-align: middle;" value="우리은행" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '우리은행'}">
                                    <input type="checkbox" name="woori_bank" id="woori_bank" style="vertical-align: middle;" value="우리은행">
                                    </c:if>
                                    <label for="woori_bank">우리은행</label>
                                </li>
                            </div>
                            <div class="hana bank">
                                <li>
                                <c:if test="${loginUser.userBank == '하나은행'}">
                                    <input type="checkbox" name="hana_bank" id="hana_bank" style="vertical-align: middle;" value="하나은행" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '하나은행'}">
                                    <input type="checkbox" name="hana_bank" id="hana_bank" style="vertical-align: middle;" value="하나은행">
                                    </c:if>
                                    <label for="hana_bank">하나은행</label>
                                </li>
                            </div>
                            <div class="nhbank bank">
                                <li>
                                <c:if test="${loginUser.userBank == '농협'}">
                                    <input type="checkbox" name="nh_bank" id="nh" style="vertical-align: middle;" value="농협" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '농협'}">
                                    <input type="checkbox" name="nh_bank" id="nh" style="vertical-align: middle;" value="농협">
                                    </c:if>
                                    <label for="nh">농협&nbsp;</label>
                                </li>
                            </div>
                            <div class="ibk">
                                <li>
                                <c:if test="${loginUser.userBank == '기업은행'}">
                                    <input type="checkbox" name="ibk_bank" id="ibk_bank" style="vertical-align: middle;" value="기업은행" checked>
                                    </c:if>
                                    <c:if test="${loginUser.userBank != '기업은행'}">
                                    <input type="checkbox" name="ibk_bank" id="ibk_bank" style="vertical-align: middle;" value="기업은행">
                                    </c:if>
                                    <label for="ibk_bank">기업은행</label>
                                </li>
                            </div>
                            <div class="info_user_bank_num">
                            <th><label for="banknum">계좌번호</label></th>
                            <td>
                                <input type="text" class="info_userbank info_user_bank" id="banknum" value="${loginUser.userBankAccount}">
                        </td>
                        </div>
                        </table>
                            </div>
                        </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="notice_detail_nav">
                    <input type="submit" value="수정" class="submit_btn">
                </div>
            </div>
        </div>
    </section>
    </form>
</div>	
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="${cp}/assets/js/addr_userinfo.js"></script>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>