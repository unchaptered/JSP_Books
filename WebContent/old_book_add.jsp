<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 신청하기 - BOOKS</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="./assets/css/screens/old_book/old_book_add.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
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
                    <!-- 위에거 지우고 고결님 코드 -->
                    <div class="old_book_add_container">
                        <!-- screens/old_book/old_book_add.css 안에 old_book_form 존재-->
                        <div class="old_book_form">
                            <div class="name_wrap">
                                <label for="user_name" class="user_info">이름</label>
                                <div class="user_name_input">
                                    <input type="text" name="user_name" id="user_name" placeholder="이름을 입력해 주세요." value>
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
                                                <select id="selectbox" name="selectbox">
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
                                                <!-- <i class="mobile_arrow icon_arrow"></i> -->
                                            </div>
                                            <div class="mobile_input">
                                                <input type="text" name="user_phone" placeholder="(예시) 01012345678" value="">
                                                <!-- <button type="button" class="mobile_button" >인증번호 받기</button> -->
                                            </div>
                                            <div class="mobile_input_space login_space"></div>
                                            <!-- <div class="mobile_input_code">
                                                <input type="text" name="code" class="input_code" placeholder="인증번호를 입력해 주세요." >
                                            </div> -->
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
                                                <select id="selectbox" name="selectbox">
                                                    <option value="" selected="selected">은행</option>
                                                    <option value="">신한은행</option>
                                                    <option value="">국민은행</option>
                                                    <option value="">우리은행</option>
                                                    <option value="">하나은행</option>
                                                    <option value="">기업은행</option>
                                                    <option value="">농협</option>
                                                    <option value="">새마을금고</option>
                                                    <option value="">카카오뱅크</option>
                                                </select>
                                                <!-- <i class="acnum_arrow icon_arrow"></i> -->
                                            </div>
                                            <div class="acnum_input">
                                                <input type="text" name="user_phone" placeholder=" - 를 넣어서 입력해주세요." value="">
                                            </div>
                                            <div class="acnum_input_space login_space"></div>
                                        </div>
                                    </div>
                                    <div class="acnum_input_code_space login_space"></div>
                                </div>
                            </div>
                            <div class="set_login_wrap">
                                <div class="set_login_btn">
                                    <button type="submit" class="old_book_add login_btn" form="set_login">심사 신청하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </header>
        <!-- 에러가 찍히는데 -->
        <!-- 고결님 창에서는 이게 실행이 잘되는데 -->
        <!-- 제가 받아서 지금 코드 일부 가져오려고 했거든요 -->
        <!-- 그랬더니 저는 실행이 안됩니다 에러뜨고 -->
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
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
</html>