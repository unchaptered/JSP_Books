<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="../../assets/css/screens/user/login.css">
</head>
<body>
	<input type="button" value="모달창 열기" id="myBtnLogin">
    <div class="login_wrap">
        <div class="login_container">
            <div class="login_header">
                <i class="login_icon">
                    <!-- <img src="" alt=""> -->
                </i>
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
                    <label for="email" class="style_email">이메일</label>
                    <div class="email_input">
                        <input type="email" placeholder="이메일을 입력해주세요." id="email" value>
                    </div>
                </div>
                <div class="body_button">
                <button class="email_button buttons">이메일로 계속하기</button>
                <div class="body_button_or"></div>
                <div class="body_find">
                    <div class="body_find_id">
                        <a href="./emailFind.html"><span>아이디 찾기</span></a>
                        <span>/</span>
                        <a href="#"><span>비밀번호 찾기</span></a>
                     </div>
                 </div>
                <div class="body_button_next">다음 계정으로 접속하기</div>
                    <div class="body_button_social">
                        <div class="social_button">
                            <a class="social_button button_google buttons" href="#"></a>
                            <div class="social_title google_title">Google</div>
                        </div>
                        <div class="social_button">
                            <a class="social_button button_kakao buttons" href="#"></a>
                            <div class="social_title kakao_title">Kakao</div>
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
    </div>	
</body>
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    // 모달창 열기 이벤트
    $("#myBtnLogin").on("click", function(){
    $(".login_wrap").css({ visibility:"visible",opacity:1});
    });
    // 모달창 닫기 이벤트 
    $("#closeLogin").on("click", function(){
            $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    });

    $(document).on("click", function(e){  
    if( $(".login_wrap").is(e.target)) {
    $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    }
    });
</script>
</html>