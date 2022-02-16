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
<link rel="stylesheet" href="./assets/css/screens/new_book/index_category.css">
<link rel="stylesheet" href="./assets/css/screens/new_book/main_content.css">
<link rel="stylesheet" href="./assets/css/screens/new_book/page_basket.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <div class="grid_part">
            <div class="bestseller">
                <img src="./assets/img/new_book/images/Best_logo.png" alt="">
            </div>
            <section class="main_content backimg">
                <div class="content_container_best">
                    <img src="./assets/img/new_book/images/best_1.png" alt="">
                    <div class="photo"></div>
                    <div class="book_name">
                        <p>
                        <a href=""><h3>불편한 편의점</h3></a>
                        <input type="button" value="작가" name="writer">·
                        <input type="button" value="출판사" name="company"><br>
                        11000원
                        </p>
                    </div>
                    <div class="blank"></div>
                    <div class="book_content">
                        <p>불편한데 자꾸 가고 싶은 편의점이 있다!
                            힘들게 살아낸 오늘을 위로하는 편의점의 밤
                            정체불명의 알바로부터 시작된 웃음과 감동의 나비효과...
                            <!--『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2
                            청파동 골목에 자리 잡은 작은 편의점 ALWAYS.
                            어느 날 서울역에서 살던 사내가 야간 알바로 들어오면서
                            편의점에 변화의 바람이 일기 시작한다!--></p>
                    </div>
                </div>
                <div class="content_container_best">
                    <img src="./assets/img/new_book/images/best-2.png" alt="">
                    <div class="photo2"></div>
                    <div class="book_name">
                        <p>
                        <a href="#"><h3>벼랑 위의 집</h3></a>
                        <input type="button" value="작가" name="writer">·
                        <input type="button" value="출판사" name="company"><br>
                        11000원
                        </p>
                    </div>
                    <div class="blank"></div>
                    <div class="book_content">
                        내용
                    </div>
                </div>
                <div class="content_container_best">
                    <img src="./assets/img/new_book/images/best-3.png" alt="">
                    <div class="photo3"></div>
                    <div class="book_name">
                        <p>
                        <a href=""><h3>센 강의 이름 모를 여인</h3></a>
                        <input type="button" value="작가" name="writer">·
                        <input type="button" value="출판사" name="company"><br>
                        11000원
                        </p>
                    </div>
                    <div class="blank"></div>
                    <div class="book_content">
                        내용
                    </div>
                </div>
            </section>
            <hr>
            <section class="category">
                <div class ="category_part">
                    <div class="kor">
                        <ul class="kor_0"><a href ="#">국내도서</a></ul>
                        <ul class="ul_part1">
                            <li><a href ="#" class="kor_1">소설</a></li>
                            <li><a href ="#" class="kor_2">시⦁에세이</a></li>
                            <li><a href ="#" class="kor_3">경제경영</a></li>
                        </ul>
                        <ul class="ul_part2">
                            <li><a href ="#" class="kor_4">자기계발</a></li>
                            <li><a href ="#" class="kor_5">사회과학</a></li>
                            <li><a href ="#" class="kor_6">역사⦁문화</a></li>
                        </ul>
                        <ul class="ul_part3">
                            <li><a href ="#" class="kor_7">예술⦁대중문화</a></li>
                            <li><a href ="#" class="kor_8">인문</a></li>
                            <li><a href ="#" class="kor_9">자연⦁과학</a></li>
                        </ul>
                    </div>
                    <div class="forg">
                        <ul class="forg_0"><a href ="#" class="forg_0">외국도서</a></ul>
                        <ul class="ul_part1">
                            <li><a href ="#" class="forg_1">어린이</a></li>
                            <li><a href ="#" class="forg_2">문학</a></li>
                            <li><a href ="#" class="forg_4">일본도서</a></li>
                        </ul>
                        <ul class="ul_part2">
                            <li><a href ="#" class="forg_5">경제 인문</a></li>
                            <li><a href ="#" class="forg_6">실용 예술</a></li>
                            <li><a href ="#" class="forg_7">컴퓨터</a></li>
                        </ul>
                        <ul><a href ="#" class="other">  기타  </a></ul>
                    </div>
                </div>
            </section>
            <hr>
            <form name="checkForm" method="post" action="join_db.jsp" >
            <section class="main_content">
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <div class="book_name">
                        <p>
                        <a href="./book.html"><h3>1984</h3></a>
                        <input type="button" value="조지 오웰" name="writer"><br>
                        <input type="button" value="소담출판사" name="company"><br>
                        14800원
                        </p>
                    </div>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <div class="book_name">
                        <p>
                        <a href="#"><h3>1984</h3></a>
                        <input type="button" value="해위" name="writer"><br>
                        <input type="button" value="출판사" name="company"><br>
                        14800원
                        </p>
                    </div>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <div class="book_name">
                        <p>
                        <a href="#"><h3>1984</h3></a>
                        <input type="button" value="해위" name="writer"><br>
                        <input type="button" value="출판사" name="company"><br>
                        14800원
                        </p>
                    </div>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
                <div class="content_container">
                    <input type="checkbox" id="check" name="check1" value="왼쪽위" onclick="checkthis()">
                    <div class="photo"><img src="./assets/img/new_book/images/1984.jpg" alt=""></div>
                    <h3>일반책</h3>
                </div>
            </section>
            </form>
        </div>
        <div id="basket">
            <a href="#" id ="basket2" onclick="">장바구니</a>
        </div>
        <div class="pagination">
            <a href="" class="firstpage pbtn"><img src="./assets/img/new_book/images/btn_firstpage.png" alt="첫 페이지로 이동"></a>
            <a href="" class="prepage pbtn"><img src="./assets/img/new_book/images/btn_prevpage.png" alt="이전 페이지로 이동"></a>
            <a href="" class=""><span class="currentPage pagenum">1</span></a><!-- currentpage 현재 페이지-->
            <a href="" class=""><span class="pagenum">2</span></a>
            <a href="" class=""><span class="pagenum">3</span></a>
            <a href="" class=""><span class="pagenum">4</span></a>
            <a href="" class=""><span class="pagenum">5</span></a>
            <a href="" class="nextpage pbtn"><img src="./assets/img/new_book/images/btn_nextpage.png" alt="다음 페이지로 이동"></a>
            <a href="" class="lastpage pbtn"><img src="./assets/img/new_book/images/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
        </div>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="./assets/js/new_book/index_page.js"></script>
</html>