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
                <input type="button" value="login" id="myBtnLogin">
                <input type="button" value="join">
            </div>
        </section>
    </nav>
    <nav id="nav_menu" class="nav_opaciter nav_displayer">
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">도서</summary>
            <section class="nav_menu_linkers">
            	<!-- kmhyeon -->
                <a href="new_book_list.jsp">책 리스트</a>
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
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
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