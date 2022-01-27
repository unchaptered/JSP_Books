<!-- 저자 : 김명현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 베이스 - BOOKS </title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="./assets/css/new_book/book_category.css">
<link rel="stylesheet" href="./assets/css/new_book/page_basket.css">
<link rel="stylesheet" href="./assets/css/new_book/book_read_explain.css">
<link rel="stylesheet" href="./assets/css/new_book/button.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <div id="nav_menu" class="nav_menu-fold">
            <!-- nav-zier 는 padding 0 30px -->
            <div class="nav_menu_grid">
                <div class="nav_menu_box">
                    <h3 class="nav_menu_title">도서</h3>
                    <div class="nav_menu_link_box">
                        <a href="#" class="nav_menu_linker">> 전체 책 보기</a>
                        <a href="#" class="nav_menu_linker">> 베스트 샐러</a>
                        <a href="#" class="nav_menu_linker">> 추천 도서</a>
                        <a href="#" class="nav_menu_linker">> 신규 도서</a>
                        <a href="#" class="nav_menu_linker">> 국내 도서</a>
                        <a href="#" class="nav_menu_linker">> 해외 도서</a>
                    </div>
                </div>
                <div class="nav_menu_box">
                    <h3 class="nav_menu_title">중고도서</h3>
                    <div class="nav_menu_link_box">
                        <a href="#" class="nav_menu_linker">> 시/수필</a>
                        <a href="#" class="nav_menu_linker">> 에세이</a>
                        <a href="#" class="nav_menu_linker">> 자기계발</a>
                        <a href="#" class="nav_menu_linker">> 영유아 도서</a>
                        <a href="#" class="nav_menu_linker">> 국내외 소설</a>
                        <a href="#" class="nav_menu_linker">> 장르소설</a>
                    </div>
                </div>
                <div class="nav_menu_box">
                    <h3 class="nav_menu_title">이벤트</h3>
                </div>
                <div class="nav_menu_box">
                    <h3 class="nav_menu_title">공지사항</h3>
                </div>
            </div>
        </div>
    </main>
    <section class="category">
        <div class="category_part">
            <div class="kor">
                <ul class="kor_0"><a href="#">국내도서</a></ul>
                <ul class="ul_part1">
                    <li><a href="#" class="kor_1">소설</a></li>
                    <li><a href="#" class="kor_2">시⦁에세이</a></li>
                    <li><a href="#" class="kor_3">경제경영</a></li>
                </ul>
                <ul class="ul_part2">
                    <li><a href="#" class="kor_4">자기계발</a></li>
                    <li><a href="#" class="kor_5">사회과학</a></li>
                    <li><a href="#" class="kor_6">역사⦁문화</a></li>
                </ul>
                <ul class="ul_part3">
                    <li><a href="#" class="kor_7">예술⦁대중문화</a></li>
                    <li><a href="#" class="kor_8">인문</a></li>
                    <li><a href="#" class="kor_9">자연⦁과학</a></li>
                </ul>
            </div>
            <div class="forg">
                <ul class="forg_0"><a href="#" class="forg_0">외국도서</a></ul>
                <ul class="ul_part1">
                    <li><a href="#" class="forg_1">어린이</a></li>
                    <li><a href="#" class="forg_2">문학</a></li>
                    <li><a href="#" class="forg_4">일본도서</a></li>
                </ul>
                <ul class="ul_part2">
                    <li><a href="#" class="forg_5">경제 인문</a></li>
                    <li><a href="#" class="forg_6">실용 예술</a></li>
                    <li><a href="#" class="forg_7">컴퓨터</a></li>
                </ul>
                <ul><a href="#" class="other"> 기타 </a></ul>
            </div>
        </div>
    </section>
    <div class="main_content book_explain">
        <section class="book">
            <div class="book_name">
                <h2>불편한 편의점(15만부 기념 윈터 에디션) : 김호연 장편소설</h2>
            </div>
        </section>
        <div class="book_explain_content">
            <div class="book_explain_photo">
                <img src="./assets/img/new_book/images/gs25.png" alt="">
            </div>
        </div>
        <div class="book_explain_writer">
            <ul>
                <li class=writer>
                    <p>
                        저 : <a href="#">김호연</a> <span class="spacebar">|</span>출판사 : <a href="#">나무옆의자</a><span
                            class="spacebar">|</span>발행 :2021년 04월 20일<span class="spacebar">|</span>쪽수 : 268
                    </p>
                </li>
                <li class="price">
                    정가 <span class="price_part">14000</span>
                </li>
            </ul>
            <div class="discount">
                할인혜택 <button onclick="discount_view()">카드/간편결제 할인&nbsp;&nbsp;&nbsp;></button>
                <span class="spacebar">|</span><button onclick="discount_view2()">무이자 할부&nbsp;&nbsp;&nbsp;></button>
            </div>
            <div class="discount_info">
                <div class="popup" id="open">
                    <div id="close">간편결제, 신용카드 청구할인
                        <a class="dis_btn" onclick="discount_view_close()"></a>
                        <div class="card">
                            <table>
                                <tr class="card_part">
                                    <td class="td_left">인터파크 롯데카드</td>
                                    <td class="td_right"><span class="card_font">5%(11,970원)</span><br>
                                        (최대할인 10만원/전월실적40만원)
                                    </td>
                                    <td class="link">
                                        <a href="#">></a>
                                    </td>
                                </tr>
                                <tr class="card_part">
                                    <td class="td_left">북피니언 롯데카드</td>
                                    <td class="td_right"><span class="card_font">30%(8,820원)</span><br>
                                    (최대할인 3만원 / 3만원 이상결제)
                                </td>
                                <td class="link">
                                    <a href="#">></a>
                                </td>
                                </tr>
                                <tr class="card_part">
                                    <td class="td_left">NH쇼핑 &인터파크카드</td>
                                    <td class="td_right"><span class="card_font">20%(10,080원)</span><br>
                                    (최대할인4만원 / 2만원 이상 결제)
                                </td>
                                <td class="link">
                                    <a href="#">></a>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 팝업창시작 -->
            <div class="discount_info">
                <div class="popup2" id="open2">
                    <div id="close">장바구니 무이자 할부
                        <a class="dis_btn" onclick="discount_view_close2()"></a>
                        <div class="card">
                        <table>
                            <tr class="card_part">
                                <td class="td_left">신한</td>
                                <td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/BC 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">비씨</td>
                                <td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/Non-BC 계열 제외)
                                </td>
                            </tr>
                            <td class="link">
                            </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">국민</td>
                                <td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/BC 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">삼성</td>
                                <td class="td_right">2~6개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">현대</td>
                                <td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">롯데</td>
                                <td class="td_right">2~4개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/BC 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">NH</td>
                                <td class="td_right">2~8개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/BC 계열 제외)
                                </td>
                            </tr>
                            <tr class="card_part">
                                <td class="td_left">하나SK</td>
                                <td class="td_right">2~8개월(5만원↑)※5만원 이상 결제시 (단,법인/체크/기업/선불카드/BC 계열 제외)
                                </td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 팝업창끝 -->

            <!-- 주문수량 시작 -->
            <div class="buy_num">
                <p>주문수량</p>
            <div class="buy_num_out">
                <input type='button' class="buy_num_plus" onclick='count("plus")'value='+'/>
                <div id='result'>0</div>
                <input type='button' class="buy_num_minus" onclick='count("minus")'value='-'/>
            </div>
            </div>
            <!-- 주문수량 끝 -->

            <!-- 장바구니,바로구매,좋아요 버튼 시작 -->
            <button class="read_basket">장바구니</button>
            <button class="read_buy">바로구매</button>
            <button class="read_like" id="like_back" onclick="like()">♡<span id="like">0</span></button>
            <!-- 장바구니,바로구매,좋아요 버튼 끝 -->
        </div>


        <!-- <h2>이책의 분류</h2>
        여기는 장르 파트임
        <hr>
        <h2>책소개</h2>
        책소개 내용임
        <hr>
        <h2>출판사 서평</h2>
        <hr>
        <h2>추천사</h2>
        <hr>
        <h2>목차</h2>
        <hr>
        <h2>본문중에서</h2>
        <hr>
        <h2>관련이미지</h2>
        <hr>
        <h2>저자소개</h2>
        <hr>
        <h2>상품정보제공고시</h2>
        <hr>
        <h2>이벤트 기획전</h2>
        <hr>
        <h2>리뷰</h2>
        <hr> -->
    </div>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script src="./assets/js/new_book/discount_view.js"></script>
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
</html>