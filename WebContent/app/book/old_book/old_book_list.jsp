<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 리스트 - BOOKS</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/old_book/old_book_list.css">
</head>
<!-- 저자 : unchaptered -->
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/nav.jsp" %>
	
	<main id="main">
		<!-- 컨텐츠 영역 -->
        <header class="header_container">
            <div class="header">
                <div class="haeder_title_container">
                    <h2>중고 추천 도서</h2>
                </div>
                <div class="header_content_slider">
                    <div class="header_content">
                        <div class="haeder_content-left">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" /></svg>
                        </div>
                        <!-- ./js/header.js 파일이 여기에 컨텐츠를 주입해줍니다.-->
                        <div class="haeder_content-right">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="feed_container">
            <section class="feed-sizer">
                <header class="feed_guider">
                    <a href="./index.jsp">전체상품</a>
                    <p> > </p>
                    <a href="./old_book_list.jsp">중고도서</a>
                    <p> > </p>
                    <a href="./old_book_list.jsp">Science</a>
                </header>
                <section class="feed-diplay">
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                    <a class="feed_content">
                        <div class="feed_img_container">
                            <img src="./assets/img/cover__1.jpg">
                        </div>
                        <h2>WINDOWS</h2>
                        <h3>김다니엘 등</h3>
                        <h4>2020.01.24</h4>
                        <h4>33,330원</h4>
                    </a>
                </section>
            </section>
        </section>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/header.js"></script>
</html>