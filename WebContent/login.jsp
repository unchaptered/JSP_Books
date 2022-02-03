<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/screens/user/login.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<input type="button" value="팝업창 오픈" id="myBtn"/>
    <div class="login_wrap">
        <div class="login_container" style="overflow: auto;">
            <div class="login_header">
                회원가입
                <div class="icon">
                    <button type="button" id="close">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
                    <button type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                    </svg>
                    </button>
                </div>
            </div>
            <div class="login_body">
                <form id="set_login">
                    <div class="name_wrap">
                        <label for="user_name" class="user_info">이름</label>
                        <div class="user_name_input">
                            <input type="text" name="user_name" id="user_name" placeholder="이름을 입력해 주세요." value>
                        </div>
                        <div class="user_name_space login_space"></div>
                    </div>
                    <div class="pw_wrap">
                        <label for="user_pw" class="user_info">비밀번호</label>
                        <div class="user_pw_input">
                            <input type="password" name="user_pw" id="user_pw" autocomplete="new-password" maxlength="16" placeholder="비밀번호를 입력해 주세요." value>
                        </div>
                        <div class="user_pw_space login_space">영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합하여 8자 이상 입력해 주세요.</div>
                    </div>
                    <div class="user_pwre">
                        <label for="user_pwre" class="user_info">비밀번호 확인</label>
                        <div class="user_pwre_input">
                            <input type="password" name="user_pwre" autocomplete="new-password" maxlength="16" placeholder="비밀번호를 다시 한번 입력해주세요." id="user_pwre">
                        </div>
                        <div class="user_pwre_space login_space"></div>
                    </div>
                    <div class="mobile_wrap">
                        <div class="mobile_wrap_inner">
                        <label for="user_phone" class="user_info">휴대폰 번호</label>
                        <div class="user_phone_body">
                            <div id="user_phone">
                                <div class="mobile_input_select input_select">
                                    <select id="selectbox" name="selectbox">
                                        <option value="+82" selected="selected">+82 South Korea</option>                      
                                        <option value="+61">+61 Austalia</option>
                                        <option value="+55">+55 Brazil</option>
                                        <option value="+1">+1 Canada</option>
                                        <option value="+45">+45 Denmark</option>
                                        <option value="+20">+20 Egypt</option>
                                        <option value="+33">+33 France</option>
                                        <option value="+49">+49 Germany</option>
                                        <option value="+36">+36 Hungary</option>
                                        <option value="+39">+39 Italy</option>
                                        <option value="+91">+91 India</option>
                                        <option value="+81">+81 Japan</option>
                                        <option value="+254">+254 Kenya</option>
                                        <option value="+352">+352 Luxembourg</option>
                                        <option value="+52">+52 Mexico</option>
                                        <option value="+64">+64 New Zealand</option>
                                        <option value="+968">+968 Oman</option>
                                        <option value="+48">+48 Poland</option>
                                        <option value="+974">+974 Qatar</option>
                                        <option value="+7">+7 Russia</option>
                                        <option value="+34">+34 Spain</option>
                                        <option value="+65">+65 Singapore</option>
                                        <option value="+46">+46 Sweden</option>
                                        <option value="+90">+90 Turkey</option>
                                        <option value="+44">+44 United Kingdom</option>
                                        <option value="+1">+1 United States</option>
                                        <option value="+84">+84 Vietnam</option>
                                        <option value="+967">+967 Yemen</option>
                                        <option value="+263">+263 Zimbabwe</option>
                                    </select>
                                    
                                </div>
                                <div class="mobile_input">
                                    <input type="text" name="user_phone" placeholder="(예시) 01012345678" value="">
                                   
                                </div>
                                <div class="mobile_input_space login_space"></div>
                              
                            </div>
                        </div>
                        <div class="mobile_input_code_space login_space" ></div>
                    </div>
                </div>
                <div class="addr_wrap">
                    <div class="addr_wrap_inner">
                        <div class="addr_num">
                            <label for="" class="addr_num_text user_info">주소</label>
                            <input type="text" name="addr_num"  
                            readonly placeholder="우편번호" value id="sample6_postcode">
                            <button type="button" class="addr_button" onclick="sample6_execDaumPostcode();" value="우편번호 찾기">우편번호 찾기</button>
                        </div>
                        <div class="addr_input">
                            <input type="text"  readonly name="addr_input" class="addr_input_text" 
                            id="sample6_address" placeholder="주소">
                        </div>
                        <div class="addr_input_detail">
                            <input type="text" name="addr_input_detail" class="addr_input_text_detail"
                            id="sample6_detailAddress" placeholder="상세주소를 입력해 주세요.">
                        </div>
                        <div class="addr_input_detail_refer">
                            <input type="text" name="addr_input_detail_refer" class="addr_input_text_detail"
                            id="sample6_extraAddress" placeholder="참고항목">
                        </div>
                    </div>
                    <div class="addr_space login_space"></div>
                </div>
                <!-- 계좌번호 -->
                <div class="acnum_wrap">
                    <div class="acnum_wrap_inner">
                        <label for="acnum" class="user_info">은행</label>
                        <div class="acnum_body">
                            <div id="acnum">
                                <div class="acnum_input_select input_select">
                                   
                                    <select id="selectbox" name="selectbox">
                                        <option value="" selected="selected">은행</option>
                                        <option value="">신한은행</option>
                                        <option value="">국민은행</option>
                                        <option value="">우리은행</option>
                                        <option value="">하나은행</option>
                                        <option value="">기업은행</option>
                                        <option value="">농협</option>
                                        <option value="">새마을금고</option>
                                        <option value="">카카오뱅크</option>
                                    </select>
                                   
                                </div>
                                <div class="acnum_input">
                                    <input type="text" name="user_phone" placeholder=" - 를 넣어서 입력해주세요." value="">
                                </div>
                                <div class="acnum_input_space login_space"></div>
                            </div>
                        </div>
                        <div class="acnum_input_code_space login_space"></div>
                    </div>
                </div>
                    <div class="agree_wrap">
                        <div class="agree_wrap_inner agree_inner">
                            <div class="agree_checkbox_all agrees">
                            <input type="checkbox" name="checkbox_agree" id="checkbox_all" onclick="checkall(this);">
                            <label for="checkbox_all">전체 동의</label>
                            <hr>
                        </div>
                        </div>
                        <div class=" agree_wrap_inner2 agree_inner">
                            <div class="agree_checkbox_pilsoo agrees">
                                <input type="checkbox" name="checkbox_agree" id="checkbox_pilsoo" value="checkbox_pilsoo">
                                <label for="checkbox_pilsoo">개인정보 수집 및 이용 동의 <span>(필수)</span><a href="./notice_detail1.html" target="_blank" class="agree_link">자세히</a></label>
                            </div>
                        </div>
                        <div class="agree_wrap_inner3 agree_inner">
                            <div class="agree_checkbox_eventmail agrees">
                                <input type="checkbox" name="checkbox_agree" id="checkbox_eventmail" value="checkbox_eventmail">
                                <label for="checkbox_eventmail">이벤트 소식 등 알림 정보 받기<a href="#" target="_blank" class="agree_link">자세히</a></label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="set_login_wrap">
                    <div class="set_login_btn">
                        <button type="submit" class="login_btn" form="set_login">회원가입하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/addr.js"></script>
<script type="text/javascript">
    function checkall(checkall) {
        const check_box = document.getElementsByName("checkbox_agree");
        check_box.forEach((checkbox) => {
            checkbox.checked = checkall.checked;
        })
    }
    $("#myBtn").on("click", function(){
    $(".login_wrap").css({ visibility:"visible",opacity:1});
    });
    // 모달창 닫기 이벤트 
    $("#close").on("click", function(){
            $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    });

    $(document).on("click", function(e){  
    if( $(".login_wrap").is(e.target)) {
    $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    }
    });
</script>
</html>