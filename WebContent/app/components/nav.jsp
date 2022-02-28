<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cp" value="${pageContext.request.contextPath}"/>
</head>
<!-- 저자 : unchaptered -->
<body>

    <nav id="nav">
        <section class="nav-sizer">
            <div class="nav_column">
                <svg class="nav_menu_btn" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 nav_svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
	            
                <!-- jungbc1 -->
	            <a href="shop_bags.jsp">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
				</a>
				<a href="shop_payment.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" /></svg>
				</a>
				<a href="shop_bills.jsp">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0" /></svg>
				</a>
            </div>
            <div class="nav_column">
                <a href="${cp}/index.jsp" class="nav_logo">Books</a>
            </div>
            <div class="nav_column">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 nav_svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
                <!-- kogyul -->
                
            	
                <c:if test="${loginUser == null }">
                <input type="button" value="login" id="myBtnLogin">
                <input type="button" value="join" id="myBtnJoin">
				</c:if>
				<c:if test="${loginUser != null }">
                <input type="button" value="Logout" id="myBtnLogout">
                </c:if>
            </div>
        </section>
    </nav>
    <nav id="nav_menu" class="nav_opaciter nav_displayer">
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">도서</summary>
            <section class="nav_menu_linkers">
            	<!-- kmhyeon -->
                <a href="${cp}/book/NewBookList.nb">책 리스트</a>
                <a href="new_book_read.jsp">책 디테일</a>
                <!-- sunsetkk -->
                <a href="new_book_add.jsp">책 등록하기</a>
                <a href="new_book_edit.jsp">책 수정하기</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">중고도서</summary>
            <section class="nav_menu_linkers">
            	<!-- unchaptered -->
                <a href="${cp}/book/OldBookList.ob">중고 책 리스트</a>
                <a href="${cp}/book/OldBookRead.ob">중고 책 디테일</a>
                <a href="${cp}/book/OldBookAdd.ob">중고 책 심사신청</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">이벤트</summary>
            <section class="nav_menu_linkers">
            	<!-- capriceksy -->
                <a href="event_list.jsp">이벤트 리스트</a>
                <a href="event_read.jsp">이벤트 글 보기</a>
                <a href="event_add.jsp">이벤트 글 쓰기</a>
                <a href="event_edit.jsp">이벤트 글 수정</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">공지사항</summary>
            <section class="nav_menu_linkers">
            	<!-- capriceksy -->
                <a href="notice_list.jsp">공지사항 리스트</a>
                <a href="notice_read.jsp">공지사항 글 보기</a>
                <a href="notice_add.jsp">공지사항 글 쓰기</a>
                <a href="notice_edit.jsp">공지사항 글 수정</a>
            </section>
        </details>
    </nav>
    <div class="login_wrap">
    	<form name="loginForm" action="${cp}/user/UserLoginOk.us" method="post">
        <div class="login_container">
            <div class="login_header">
                <span>Books</span>
                <div class="icon">
                    <button type="button" id="closeLogin">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linelogin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </div>
            </div>
            <div class="login_body">
                <div class="body_text">
                    <h3>로그인을 진행하시려면</h3>
                    <h3>이메일을 입력해주세요.</h3>
                </div>
                <div class="body_input">
                <div class="body_email">
                    <label for="email"><span class="style_email">이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="loginEmailError" class="error"></span></label>
                    <div class="email_input">
                        <input type="email" placeholder="이메일을 입력해주세요." id="email" onkeyup="checkLogin()" name="email">
                    </div>
                </div>
                <div class="body_pw">
                    <label for="loginPw"><span class="style_pw">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="loginPwError" class="error"></span></label>
                    <div class="pw_input">
                        <input type="password" placeholder="비밀번호를 입력해주세요." id="loginPw" name="loginPw">
                    </div>
                </div>
                <div class="body_button">
                <input type="submit" class="email_button buttons" value="로그인" id="myBtnPw">
                <div class="body_button_or"></div>
                <div class="body_find">
                    <div class="body_find_id">
                        <span id="myBtnIdFind" class=loginIdFind>아이디 찾기</span>
                        <span>/</span>
                        <span class="loginPwFind" id="myBtnLoginPwFind">비밀번호 찾기</span>
                     </div>
                 </div>
                <div class="body_button_next">다음 계정으로 접속하기</div>
                    <div class="body_button_social">
                        <div class="social_button">
                            <div class="social_title google_title">Google</div>
                            <a class="social_button button_google buttons" href="#"><img src="${cp}/assets/img/google.png"></a>
                        </div>
                        <div class="social_button">
                            <div class="social_title kakao_title">Kakao</div>
                            <a class="social_button button_kakao buttons" href="#"><img src="${cp}/assets/img/kakao.png"></a>
                        </div>
                    </div>
                </div>
                <p class="login_footer">
                    걱정마세요! 여러분의 활동은 SNS에 노출되지 않습니다.
                    <br>
                    회원가입 시
                    <a href="notice_detail1.html" class="loginAnchor">개인정보 처리방침</a>과
                    <a href="#" class="loginAnchor">이용약관</a>을 확인하였으며, 동의합니다.
                   </p>
                </div>
            </div>
        </div>
    </form>
    </div>
    
    <div class="join_wrap">
    <form name="joinForm" action="${cp}/user/UserJoinOk.us" method="post" onsubmit="return senditJoin()">
        <div class="join_container" style="overflow: auto;">
            <div class="join_header">
                회원가입
                <div class="icon">
                    <button type="button" id="closeJoin">
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
            <div class="join_body">
                <form id="set_join">
                    <div class="email_wrap">
                        <label for="userEmail" class="user_info"><span class="head_span">이메일&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinEmailError" class="error"></span></label>
                        <div class="user_email_input">
                            <input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력해 주세요." onkeyup="checkJoin()">
                        </div>
                        <div class="user_email_space join_space"></div>
                    </div>
                    <div class="name_wrap">
                        <label for="userName" class="user_info"><span class="head_span">이름&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinNameError"class="error"></span></label>
                        <div class="user_name_input">
                            <input type="text" name="userName" id="userName" placeholder="이름을 입력해 주세요.">
                        </div>
                        <div class="user_name_space join_space"></div>
                    </div>
                    <div class="join_pw_wrap">
                        <label for="userPassword" class="user_info"><span class="head_span">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinPasswordError"class="error"></span></label>
                        <div class="user_pw_input">
                            <input type="password" name="userPassword" id="userPassword" autocomplete="new-password" maxlength="16" placeholder="비밀번호를 입력해 주세요.">
                        </div>
                        <div class="user_pw_space join_space">영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합하여 8자 이상 입력해 주세요.</div>
                    </div>
                    <div class="user_pwre">
                        <label for="userPasswordre" class="user_info"><span class="head_span">비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinPasswordreError"class="error"></span></label>
                        <div class="user_pwre_input">
                            <input type="password" name="userPasswordre" autocomplete="new-password" maxlength="16" placeholder="비밀번호를 다시 한번 입력해주세요." id="userPasswordre">
                        </div>
                        <div class="user_pwre_space join_space"></div>
                    </div>
                    <div class="mobile_wrap">
                        <div class="mobile_wrap_inner">
                        <label for="user_phone" class="user_info"><span class="head_span">휴대폰 번호&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinPhoneError"class="error"></span></label>
                        <div class="user_phone_body">
                            <div id="user_phone">
                                <div class="mobile_input_select input_select">
                                    <select id="selectboxPhone" name="selectboxPhone">
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
                                    <input type="text" name="userPhone" placeholder="(예시) 01012345678" id="userPhone">
                                   
                                </div>
                                <div class="mobile_input_space join_space"></div>
                              
                            </div>
                        </div>
                        <div class="mobile_input_code_space join_space" ></div>
                    </div>
                </div>
                <div class="addr_wrap">
                    <div class="addr_wrap_inner">
                        <div class="addr_num">
                            <label for="" class="addr_num_text user_info"><span class="head_span">주소&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinAdressError"class="error"></span></label>
                            <input type="text" name="userZipcode"  
                            readonly placeholder="우편번호" value id="sample6_postcode">
                            <button type="button" class="addr_button" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><span>우편번호 찾기</span></button>
                        </div>
                        <div class="addr_input">
                            <input type="text"  readonly name="userAddress" class="addr_input_text" 
                            id="sample6_address" placeholder="주소">
                        </div>
                        <div class="addr_input_detail">
                            <input type="text" name="userAddressDetail" class="addr_input_text_detail"
                            id="sample6_detailAddress" placeholder="상세주소를 입력해 주세요.">
                        </div>
                        <div class="addr_input_detail_refer">
                            <input type="text" name="userAddressEtc" class="addr_input_text_detail"
                            id="sample6_extraAddress" placeholder="참고항목">
                        </div>
                    </div>
                    <div class="addr_space join_space"></div>
                </div>
                <!-- 계좌번호 -->
                <div class="acnum_wrap">
                    <div class="acnum_wrap_inner">
                        <label for="acnum" class="user_info"><span class="head_span">은행&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="joinBankError"class="error"></span></label>
                        <div class="acnum_body">
                            <div id="acnum">
                                <div class="acnum_input_select input_select">
                                   
                                    <select id="userBank" name="userBank">
                                        <option value="은행" selected="selected">은행</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="국민은행">국민은행</option>
                                        <option value="우리은행">우리은행</option>
                                        <option value="하나은행">하나은행</option>
                                        <option value="기업은행">기업은행</option>
                                        <option value="농협">농협</option>
                                        <option value="새마을금고">새마을금고</option>
                                        <option value="카카오뱅크">카카오뱅크</option>
                                    </select>
                                   
                                </div>
                                <div class="acnum_input">
                                    <input type="text" name="userBankAccount" placeholder=' " - " 없이 입력해주세요.' id="userBankAccount">
                                </div>
                                <div class="acnum_input_space join_space"></div>
                            </div>
                        </div>
                        <div class="acnum_input_code_space join_space"></div>
                    </div>
                </div>
                    <div class="agree_wrap">
                        <div class="agree_wrap_inner agree_inner">
                            <div class="agree_checkbox_all agrees">
                            <input type="checkbox" name="checkbox_agree" id="checkbox_all" onclick="checkall(this);">
                            <label for="checkbox_all">전체 동의&nbsp;&nbsp;&nbsp;&nbsp;</label><span id="joinAgreeError"class="error"></span>
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
                <input type="submit" value="회원가입하기" class="joinOK">
            </div>
        </div>
        </form>
    </div>
     <div class="id_find_wrap">
     <form>
        <div class="id_find_container">
            <div class="id_find_header">
                이메일 찾기
                <div class="icon">
                    <button type="button" id="closeIdFind">
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
            <div class="id_find_body_wrap">
                <div class="id_find_body_wrap_inner">
                    <div class="id_find_body_inner">
                        <div class="id_find_name_inner">
                        <label for="id_find_name_input" class="user_info">이름</label>
                        <div class="input_name_id_find">
                            <input type="text" id="email_name_input_find" placeholder="이름을 입력해주세요.">
                        </div>
                    </div>
                    <div class="id_find_phone_inner">
                        <label for="id_find_phone_input" class="user_info">휴대폰 번호</label>
                        <div class="input_phone_id_find">
                            <input type="text" id="email_phone_input_find" placeholder="(예시) 01012345678">
                        </div>
                    </div>
                        <div class="id_find_space"></div>
                        <button type="button" class="id_find_btn buttons" id="id_find_login"><a href="./emailShow.html">이메일 찾기</a></button>
                    </div>
                </div>
            </div>
            
        </div>
        </form>
    </div> 
    <div class="pw_find_wrap">
    <form>
        <div class="pw_find_container">
            <div class="pw_find_header">
                비밀번호 찾기
                <div class="icon">
                    <button type="button" id="closePwFind">
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
            <div class="pw_find_body_wrap">
                <div class="pw_find_body_wrap_inner">
                    <div class="pw_find_body_inner">
                        <div class="pw_find_name_inner">
                        <label for="pw_find_name_input" class="user_info">이메일</label>
                        <div class="input_name_find">
                            <input type="text" id="pw_email_input_find" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div class="pw_find_phone_inner">
                        <label for="pw_find_phone_input" class="user_info">휴대폰 번호</label>
                        <div class="input_phone_find">
                            <input type="text" id="pw_phone_input_find" placeholder="(예시) 01012345678">
                        </div>
                    </div>
                        <div class="pw_find_space"></div>
                        <button type="button" class="pw_find_btn buttons" id="pw_find_login"><a href="./pwShow.html">비밀번호 찾기</a></button>
                    </div>
                </div>
            </div>
            
        </div>
        </form>
    </div>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>const cp = "${pageContext.request.contextPath}"</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${cp}/assets/js/addr.js"></script>
<script type="text/javascript" src="${cp}/assets/js/nav_user.js"></script>
</html>