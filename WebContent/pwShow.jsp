<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwShow</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/screens/user/pwShow.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<input type="button" id="myBtn" value="팝업창 오픈"/>
    <div class="pw_show_wrap">
        <div class="pw_show_container">
            <div class="pw_show_header">
                비밀번호 설정
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
            <div class="pw_show_body_wrap">
                <div class="pw_show_body_wrap_inner">
                    <div class="pw_show_body_inner">
                        <div class="pw_show_pw_inner">
                        <label for="pw_input_show" class="user_info">새 비밀번호</label>
                        <div class="input_pw_show">
                            <input type="text" id="pw_input_show" placeholder="비밀번호를 입력해 주세요." value>
                            <p>영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합하여 8자 이상 입력해 주세요.</p>
                        </div>
                    </div>
                    <div class="pwre_show_pw_inner">
                        <label for="pwre_input_show" class="user_info">새 비밀번호 확인</label>
                        <div class="input_pwre_show">
                            <input type="text" id="pwre_input_show" placeholder="비밀번호를 입력해 주세요." value>
                        </div>
                    </div>
                        <div class="pw_show_space"></div>
                        <button type="button" class="pw_show_btn buttons" id="pw_show_login"><a href="./join.html">로그인 하기</a></button>
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
<script type="text/javascript">
    $("#myBtn").on("click", function(){
    $(".pw_show_wrap").css({ visibility:"visible",opacity:1});
    });
    // 모달창 닫기 이벤트 
    $("#close").on("click", function(){
            $(".pw_show_wrap").css({ visibility:"hidden",opacity:0 });
    });

    $(document).on("click", function(e){  
    if( $(".pw_show_wrap").is(e.target)) {
    $(".pw_show_wrap").css({ visibility:"hidden",opacity:0 });
    }
    });
</script>
</html>