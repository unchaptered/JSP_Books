<!-- 작성자 : 고결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pw</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/screens/user/pw.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../components/nav.jsp" %>
	
	<input style="margin-top:200px" type="button" id="myBtn" value="팝업창 오픈"/>
    <div class="pw_wrap" >
        <div class="pw_container">
            <div class="pw_header">
                비밀번호 입력
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
            <div class="pw_body_wrap">
                <div class="pw_body_wrap_inner">
                    <div class="pw_body_inner">
                        <label for="password_input" class="user_info">비밀번호</label>
                        <div class="input_pw">
                            <input type="password" id="password_input" placeholder="비밀번호" autocomplete="current-password" value>
                        </div>
                        <div class="pw_space"></div>
                        <button type="button" class="pw_btn buttons" id="pw_login">로그인</button>
                        <button type="button" class="pw_btn2 buttons">비밀번호 찾기/변경</button>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$("#myBtn").on("click", function(){
	 $(".pw_wrap").css({ visibility:"visible",opacity:1});
	 });
	 // 모달창 닫기 이벤트 
	 $("#close").on("click", function(){
			 $(".pw_wrap").css({ visibility:"hidden",opacity:0 });
	 });
 
	 $(document).on("click", function(e){  
	 if( $(".pw_wrap").is(e.target)) {
	 $(".pw_wrap").css({ visibility:"hidden",opacity:0 });
	 }
	 });
 </script>
</html>