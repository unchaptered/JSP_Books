<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 글 작성 </title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/event/event_write.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="event_write">
                <!-- 타이틀 -->
                <a href="./event_list.jsp" class="goList">목록</a>
                <strong class="title">이벤트 작성</strong></a>
                <!-- 폼 시작 -->
                <form action="./event_list.jsp" name="eventWriteForm" method="post" onsubmit="return sendit()">
                    <p>필수 입력 항목 <span class="redStar">*</span></p>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 제목 작성 <span class="redStar">*</span></strong>
                        <input type="text" name="title" placeholder="제목을 입력하세요." id="input-title">
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 기간 작성 <span class="redStar">*</span></strong>
                        <div class="detail_date">
                            <div class="date_start">
                                <p>이벤트 시작일</p><input type="date" name="dateStart" id="input-dateStart">
                            </div>
                            <span>-</span>
                            <div class="date_end">
                                <p>이벤트 종료일</p><input type="date" name="dateEnd" id="input-dateEnd">
                            </div>
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 배너 이미지 등록 <span class="redStar">*</span></strong>
                        <div class="fileBtn">
                            <label for="input-file">첨부 파일</label> <input type="file" name="inputFile" id="input-file" accept="image/*" onchange="setThumbnail(this);"></input>
                            <div id="showFileName">이미지를 등록하세요</div>
                            <img id="imgPreview" />
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 상세 설명</strong>
                        <textarea id="event-textarea" placeholder="이벤트 상세 내용을 입력해주세요."></textarea>
                    </div>
                    <div class="inform">
                        <strong class="detail_title">알림사항</strong>
                        <input type="text" name="inform" id="input-inform" placeholder="알림사항을 입력하세요.">
                    </div>

                    <!-- 상품 등록버튼 -->
                    <!-- <div class="uploadEproduct">
                        <button id="uploadBtn">상품등록</button>
                    </div> -->

                    <!-- 이벤트 관련 상품 -->
                    <!-- <div class="productBox_area content__grid">
                        <div class="productBox content__container-4">
                                <a href="#">
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
                                    <button class="deleteBtn">삭제</button>
                                </a>
                        </div>
                        <div class="productBox content__container-4">
                                <a href="#">
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
                                    <button class="deleteBtn">삭제</button>
                                </a>
                        </div>
                        <div class="productBox content__container-4">
                                <a href="#">
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
                                    <button class="deleteBtn">삭제</button>
                                </a>
                        </div>
                    </div> -->


                    <!-- 저장 버튼 -->
                    <div class="boardBtn">
                        <input type="submit" id="submitBtn" value="저장" onsubmit="confirmSave()">
                    </div>
                </form>
            </div>
        </section>
    </main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="assets/js/event_write.js"></script>
</html>