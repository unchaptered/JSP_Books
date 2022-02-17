<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 보기 - BOOKS</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/old_book/old_book_detail.css">
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
            </header>
        </section>
        <header id="old_book">
            <section class="old_book-sizer">
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_img_conatainer">
                    <img src="./assets/img/cover__1.jpg">
                </section>
                <!-- 801px 기준으로 "좌-우" 가 "상-하"로 변경 -->
                <section class="old_book_column old_book_data_container">
                    <!-- 책 카테고리, 책 제목, 저자, 역자, 출판사, 부수, 발행연도, 고유번호 -->
                    <div class="old_book_meta_container">
                        <div class="old_book-801">
                            <h5>Science</h5>
                            <h2>인문학의 숲</h2>
                            <div class="old_book_meta">
                                <h5>저자 : 제프리리처, 크리스토프나자르</h5>
                                <h5>|</h5>
                                <h5>역자 : 김명선</h5>
                                <h5>|</h5>
                                <h5>출판사 : 한빛미디어</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>부수 : 981p</h5>
                                <h5>|</h5>
                                <h5>발행연도 : 2019.04.01</h5>
                                <h5>|</h5>
                                <h5>고유번호 : ISBN-13-9788979146219</h5>
                            </div>
                        </div>
                        <div class="old_book-800">
                            <h5>Science</h5>
                            <h2>인문학의 숲</h2>
                            <div class="old_book_meta">
                                <h5>부수 : 981p</h5>
                                <h5>|</h5>
                                <h5>발행연도 : 2019.04.01</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>저자 : 제프리리처, 크리스토프나자르</h5>
                                <h5>|</h5>
                                <h5>역자 : 김명선</h5>
                            </div>
                            <div class="old_book_meta">
                                <h5>출판사 : 한빛미디어</h5>
                                <h5>|</h5>
                                <h5>고유번호 : ISBN-13-9788979146219</h5>
                            </div>
                        </div>
                    </div>
                    <!-- 정가, 할인가액, 주요안내사항, 구매하기, 장바구니 등 -->
                    <div class="old_book_price_container">
                        <div>
                            <div class="old_book_price">
                                <p>정가</p>
                                <p>(43,100원)</p>
                                <p>|</p>
                                <p>12권</p>
                            </div>
                            <div class="old_book_price">
                                <p>10% 할인</p>
                                <p>(00,000원)</p>
                                <p>|</p>
                                <p>12권</p>
                            </div>
                            <div class="old_book_price">
                                <p>20% 할인</p>
                                <p>(00,000원)</p>
                                <p>|</p>
                                <p>12권</p>
                            </div>
                            <div class="old_book_price">
                                <p>30% 할인</p>
                                <p>(00,000원)</p>
                                <p>|</p>
                                <p>12권</p>
                            </div>
                            <div class="old_book_price">
                                <p>40% 할인</p>
                                <p>(00,000원)</p>
                                <p>|</p>
                                <p>12권</p>
                            </div>
                            <div class="old_book_price">
                                <p>50% 할인</p>
                                <p>(00,000원)</p>
                                <p>|</p>
                                <p>-</p>
                            </div>
                            <p>본 상품은 할인 쿠폰이 적용되지 않는 상품입니다.</p>
                            <p>상품 구매 버튼을 누르면 일시적으로 재고가 감소하며,<br>타 고객님께서는 잠시 해당 제품을 구매하실 수 없게 됩니다.</p>
                        </div>
                        <div class="old_book_btn_menus">
                            <div class="old_book_count">
                                <button type="button" class="count_minus">-</button>
                                <span class="count">0</span>
                                <button type="button" class="count_plus">+</button>
                            </div>

                            <div class="old_book_btn_container">
                                <button type="button" class="old_book_btn old_book_btn_1">장바구니 담기</button>
                                <button type="button" class="old_book_btn old_book_btn_2">바로구매</button>
                                <button type="button" class="old_book_btn old_book_btn_3">찜하기</button>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </header>

        <section class="feed_container margin-top-zero">
            <section class="feed-sizer">
                <header class="feed_title">Related</header>
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
                </section>
            </section>
        </section>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="../../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
</html>