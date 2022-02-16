<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 수정 </title>
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/screens/event/event_add.css">
</head>
<body>
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="event_write">
                <!-- 타이틀 -->
                <strong class="title">이벤트 수정</strong></a>
                <!-- 폼 시작 -->
                <form action="./event_list.jsp" name="eventWriteForm" method="post" onsubmit="return sendit()">
                    <div class="goList_div">
                        <a href="./event_list.jsp" class="goList">목록보기</a>
                    </div>
                    <p class="must">필수 입력 항목 <span class="redStar">*</span></p>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 제목 <span class="redStar">*</span></strong>
                        <input type="text" name="title" placeholder="제목을 입력하세요." id="input-title">
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 기간 <span class="redStar">*</span></strong>
                        <div class="detail_date">
                            <div class="date_start">
                                <p>이벤트 시작일</p><input type="date" name="dateStart" id="input-dateStart">
                            </div>
                            <div class="date_end">
                                <p>이벤트 종료일</p><input type="date" name="dateEnd" id="input-dateEnd">
                            </div>
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 배너 이미지 <span class="redStar">*</span></strong>
                        <div class="fileBtn">
                            <label for="input-file">첨부 파일</label> <input type="file" name="inputFile" id="input-file"
                                accept="image/*" onchange="setThumbnail(this);"></input>
                            <div id="showFileName">이미지를 등록하세요</div>
                            <img id="imgPreview" />
                        </div>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">이벤트 상세 <span class="redStar">*</span></strong>
                        <textarea class="summernote" name="editordata" id="eTextarea" placeholder="이벤트 내용을 입력하세요."></textarea>
                    </div>
                    <div class="write_content">
                        <strong class="detail_title">알림사항</strong>
                        <input type="text" name="inform" id="input-inform" placeholder="재고상황, 긴급공지 등의 알림사항을 입력하세요.">
                    </div>

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
<script src="assets/js/event_add.js"></script>

</html>