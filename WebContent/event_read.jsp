<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 상세페이지 </title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/event/event_read.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="event_detail">
                <!-- 타이틀 -->
                <a href="./event_list.jsp"><strong class="title">이벤트</strong></a>
                <div>
                    <div class="top_title event_detail_topbar">
                        <p>규현 특전 증정 이벤트</p>
                        <span>이벤트 기간 : 2021.01.23 ~ 2022. 11.11</span>
                    </div>
                    <div class="event_detail_img">
                        <img src="assets/img/event_banner2.png" alt="이벤트 이미지">
                    </div>
                    <div class="event_detail_txt">
                        <p class="detail_txt">
                            구매한 상품의 사진과 함께 구매후기를 남겨주세요. <br><br>추첨을 통해 원하시는걸로 챙겨가시라고 괴산장터에서 현금처럼 사용가능한 포인트를 드립니다. <br><br><br>많은 참여하셔서 푸짐한 선물 꼭 ! 받아가세요. </p>
                    </div>
                    <div class="inform">
                        <strong>알림</strong>
                        <img src="assets/img/icon_inform.png" alt="알림">
                        <div class="inform_content">
                            <p>본 이벤트는 선착순으로 진행되며 재고 소진 시 이벤트가 조기 종료될 수 있습니다.</p>
                        </div>
                    </div>

                    <!-- 이벤트 관련 상품 (넣을 지 생각 중) -->
                    <!-- <div class="top_title">
                        <p>규현 특전 증정 이벤트</p>
                        <span>관련 상품입니다.</span>
                    </div> -->
                    <!-- <div class="productBox_area content__grid">
                        <a href="#" class="productBox content__container-3">
                            <div class="productBox_img">
                                <img src="./images/l9788934952312.jpg" alt="그 해 우리는">
                            </div>
                            <div class="productBox_txt">
                                <div>
                                    <strong>
                                        <그 해 우리는>
                                    </strong>
                                </div>
                                <div class="publisher_info">
                                    <span class="author">이은영</span>
                                    <span class="publication">김영사</span>
                                </div>
                                <div class="sell_info">
                                    <span class="price">33,300원</span>
                                    <span class="point">1,840P</span>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="productBox content__container-3">
                            <div class="productBox_img">
                                <img src="./images/l9788934952312.jpg" alt="그 해 우리는">
                            </div>
                            <div class="productBox_txt">
                                <div>
                                    <strong>
                                        <그 해 우리는>
                                    </strong>
                                </div>
                                <div class="publisher_info">
                                    <span class="author">이은영</span>
                                    <span class="publication">김영사</span>
                                </div>
                                <div class="sell_info">
                                    <span class="price">33,300원</span>
                                    <span class="point">1,840P</span>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="productBox content__container-3">
                            <div class="productBox_img">
                                <img src="./images/l9788934952312.jpg" alt="그 해 우리는">
                            </div>
                            <div class="productBox_txt">
                                <div>
                                    <strong>
                                        <그 해 우리는>
                                    </strong>
                                </div>
                                <div class="publisher_info">
                                    <span class="author">이은영</span>
                                    <span class="publication">김영사</span>
                                </div>
                                <div class="sell_info">
                                    <span class="price">33,300원</span>
                                    <span class="point">1,840P</span>
                                </div>
                            </div>
                        </a>
                        <a href="#" class="productBox content__container-3">
                            <div class="productBox_img">
                                <img src="./images/l9788934952312.jpg" alt="그 해 우리는">
                            </div>
                            <div class="productBox_txt">
                                <div>
                                    <strong>
                                        <그 해 우리는>
                                    </strong>
                                </div>
                                <div class="publisher_info">
                                    <span class="author">이은영</span>
                                    <span class="publication">김영사</span>
                                </div>
                                <div class="sell_info">
                                    <span class="price">33,300원</span>
                                    <span class="point">1,840P</span>
                                </div>
                            </div>
                        </a>
                    </div> -->
                </div>
            </div>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
</html>