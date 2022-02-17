<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_info</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/screens/user/user_info.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
<!-- container -->
<div class="user_info_container_wrap">
<main id="main">
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
                                    <strong class="user_email_text">hong@gmail.com</strong>
                                    <button type="button" class="user_email_btn">&nbsp;이메일 변경&nbsp;</button>
                                </div>
                            </td>
                            </tr>
                            <tr>
                                <th scope="row">이름</th>
                                <td>
                                    <div class="info_user_name">
                                        <span class="user_name_text">고결</span>
                                        <button type="button" class="user_name_btn">&nbsp;이름 변경&nbsp;</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대폰 번호</th>
                                <td>
                                    <div class="info_user_phone">
                                        <span class="user_phone_text">01071468059</span>
                                        <button type="button" class="user_phone_btn">&nbsp;휴대폰 번호 변경&nbsp;</button>
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
                                                    <td><input type="password" class="info_userpw"></td>
                                                    <div class="info_userpw_space input_space"></div>
                                                </tr>
                                                <tr>
                                                    <th>새 비밀번호</th>
                                                    <td><input type="password" class="info_userpwre">
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
                                                    <th>비밀번호 확인</th>
                                                    <td><input type="password" class="info_userpwre_re">
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
                                                    <td><input type="text" class="info_useraddr info_useraddr_num" readonly id="sample6_postcode">
                                                    <button type="button" class="user_addr_btn" onclick="sample6_execDaumPostcode();">&nbsp;우편번호 찾기&nbsp;</button>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>주소</th>
                                                    <td><input type="text" class="info_useraddr info_user_address" readonly id="sample6_address">
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>상세주소</th>
                                                    <td><input type="text" class="info_useraddr info_useraddr_detail" id="sample6_detailAddress">
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>참고항목</th>
                                                    <td><input readonly type="text" class="info_useraddr_detail
                                                        info_useraddr" id="sample6_extraAddress">
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
                                    <input type="checkbox" name="shinhan_bank" id="shinhan_bank" style="vertical-align: middle;">
                                    <label for="shinhan_bank" class="shin">신한은행</label>
                                </li>
                            </div>
                            <div class="kookmin bank">
                                <li>
                                    <input type="checkbox" name="kookmin_bank" id="kookmin_bank" style="vertical-align: middle;">
                                    <label for="kookmin_bank">국민은행</label>
                                </li>
                            </div><div class="mgmg bank">
                                <li>
                                    <input type="checkbox" name="product_fizzo" id="mg" style="vertical-align: middle;">
                                    <label for="mg">새마을금고</label>
                                </li>
                            </div>
                            <div class="kakao">
                            <li>
                                <input type="checkbox" name="product_tea" id="kakao_bank" style="vertical-align: middle;">
                                <label for="kakao_bank">카카오뱅크</label>
                            </li>
                        </div> 
                            <div class="woori bank">
                                <li>
                                    <input type="checkbox" name="woori_bank" id="woori_bank" style="vertical-align: middle;">
                                    <label for="woori_bank">우리은행</label>
                                </li>
                            </div>
                            <div class="hana bank">
                                <li>
                                    <input type="checkbox" name="hana_bank" id="hana_bank" style="vertical-align: middle;">
                                    <label for="hana_bank">하나은행</label>
                                </li>
                            </div>
                            <div class="nhbank bank">
                                <li>
                                    <input type="checkbox" name="nh_bank" id="nh" style="vertical-align: middle;">
                                    <label for="nh">농협&nbsp;</label>
                                </li>
                            </div>
                            <div class="ibk">
                                <li>
                                    <input type="checkbox" name="ibk_bank" id="ibk_bank" style="vertical-align: middle;">
                                    <label for="ibk_bank">IBK기업은행</label>
                                </li>
                            </div>
                            <div class="info_user_bank_num">
                            <th><label for="banknum">계좌번호</label></th>
                            <td>
                                <input type="text" class="info_userbank info_user_bank" id="banknum">
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
                    <input type="button" value="수정" class="submit_btn">
                </div>
            </div>
        </div>
    </section>
</main>
</div>
<!-- container// -->
<!-- footer -->

	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/addr.js"></script>
</html>