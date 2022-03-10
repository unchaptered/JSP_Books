<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 신청하기 - BOOKS</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/old_book/old_book_add.css">
</head>
<!-- 저자 : unchaptered -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/nav.jsp" %>

	<main id="main">
		<!-- 컨텐츠 영역 -->
        <section class="feed-sizer">
            <header class="feed_guider">
                <a href="./index.jsp">전체상품</a>
                <p> > </p>
                <a href="./old_book_list.jsp">중고도서</a>
                <p> > </p>
                <a href="./old_book_list.jsp">Science</a>
                <p> > </p>
                <a href="./old_book_detail.jsp">책 제목</a>
                <p> > </p>
                <a href="./old_book_add.jsp">심사 신청</a>
            </header>
        </section>
        <header id="old_book">
            <section class="old_book-sizer">
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_img_conatainer">
                	<c:choose>
                		<%-- 정크 이미지 출력 --%>
	                	<c:when test="${targetBook.bookOrgImage eq 'none'}">
	          				<img src="${cp}/assets/img/cover__1.jpg">
	               		</c:when>
	               		<%-- 호출 이미지 출력 --%>
	               		<c:otherwise>
	                    	<img src="${cp}/media/${targetBook.bookOrgImage}.jpg">
	               		</c:otherwise>
                	</c:choose>
                </section>
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_data_container">
                    <!-- 책 카테고리, 책 제목, 저자, 역자, 출판사, 부수, 발행연도, 고유번호 -->
                    <div class="old_book_meta_container">
                        <div class="old_book-801">
                            <h5>${targetBook.bookGenre}</h5>
                            <h2>${targetBook.bookTitle}</h2>
                            <div class="old_book_meta">
                                <h5>저자 : ${targetBook.bookWriter}</h5>
                                <h5>|</h5>
                                <h5>역자 : ${targetBook.bookTranslater}</h5>
                                <h5>|</h5>
                                <h5>출판사 : ${targetBook.bookPublisher}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>부수 : ${targetBook.bookPages}</h5>
                                <h5>|</h5>
                                <h5>발행연도 : ${targetBook.bookCreated}</h5>
                                <h5>|</h5>
                                <h5>발행국가 : ${targetBook.bookCountry}</h5>
                            </div>
                        </div>
                        <div class="old_book-800">
                            <h5>${targetBook.bookGenre}</h5>
                            <h2>${targetBook.bookTitle}</h2>
                            <div class="old_book_meta">
                                <h5>부수 : ${targetBook.bookPages}</h5>
                                <h5>|</h5>
                                <h5>발행연도 : ${targetBook.bookCreated}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>저자 : ${targetBook.bookWriter}</h5>
                                <h5>|</h5>
                                <h5>역자 : ${targetBook.bookTranslater}</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>출판사 : ${targetBook.bookPublisher}</h5>
                                <h5>|</h5>
                                <h5>발행국가 : ${targetBook.bookCountry}</h5>
                            </div>
                        </div>
                    </div>
                    <!-- 정가, 할인가액, 주요안내사항, 구매하기, 장바구니 등 -->
                    <!-- 위에거 지우고 고결님 코드 -->
                    <div class="old_book_add_container">
                        <!-- screens/old_book/old_book_add.css 안에 old_book_form 존재-->
                        <div class="old_book_form">
                            <div class="name_wrap">
                                <label for="user_name" class="user_info">이름</label>
                                <div class="user_name_input">
                                    <input type="text" id="user_name" value="${userDB.userName}" disabled>
                                </div>
                                <div class="user_name_space login_space"></div>
                            </div>
                            <div class="mobile_wrap">
                                <div class="mobile_wrap_inner">
                                    <label for="user_phone" class="user_info">휴대폰 번호</label>
                                    <div class="user_phone_body">
                                        <div id="user_phone">
                                            <div class="mobile_input_select input_select">
                                                <!-- <span>대한민국 +82</span> -->
                                                <input type="text" value="+82 South Korea" disabled>
                                                <!-- <i class="mobile_arrow icon_arrow"></i> -->
                                            </div>
                                            <div class="mobile_input">
                                                <input type="text" name="user_phone" value="${userDB.userPhone}" disabled>
                                            </div>
                                            <div class="mobile_input_space login_space"></div>
                                        </div>
                                    </div>
                                    <div class="mobile_input_code_space login_space" ></div>
                                </div>
                            </div>
                            <div class="acnum_wrap">
                                <div class="acnum_wrap_inner">
                                    <label for="acnum" class="user_info">은행</label>
                                    <div class="acnum_body">
                                        <div id="acnum">
                                            <div class="acnum_input_select input_select">
                                                <!-- <span>은행</span> -->
                                                <input type="text" value="${userDB.userBank}" disabled>
                                            </div>
                                            <div class="acnum_input">
                                                <input type="text" value="${userDB.userBankAccount}" disabled>
                                            </div>
                                            <div class="acnum_input_space login_space"></div>
                                        </div>
                                    </div>
                                    <div class="acnum_input_code_space login_space"></div>
                                </div>
                            </div>
                            
                            <a style="text-align: right;" href="${cp}/user/UserInfo.us">정보 수정하기</a>
                            <div class="set_login_wrap">
                                <a  href="${cp}/book/OldBookAddFinish.ob?userPk=${userDB.userPk}&?bookPk=${targetBook.bookPk}" class="set_login_btn">
                                    <button style="cursor:pointer !important" type="button" class="old_book_add" form="set_login">심사 신청하기</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </header>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../../components/footer.jsp" %>
</body>
<!-- 메뉴 접기 펼치기 -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
</html>