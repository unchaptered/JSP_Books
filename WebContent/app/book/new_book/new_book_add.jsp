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
<link rel="stylesheet" href="assets/css/screens/new_book/new_book_add.css">
<!-- 저자 : sunsetkk -->
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
		<div class="main_content">
            <div class="content">
                <form id="register_form" action="">
                    <div class="side_quick">
                        <h2>등록하기</h2><p id="managerId">관리자 OOO님</p>
                        <h4 class="quickmenu_tit">QUICK MENU</h4>
                        <input type="reset" value="RESET" id="Info_reset" onclick="focus_re()">
                        <input type="submit" value="SUBMIT" id="Info_submit">
                        <a href="#wrap" class="quick_top">TOP ▲</a>
                        <a href="#footer" class="quick_down">DOWN ▼</a>
                    </div>
                    <div class="register_input">
                        <!-- 이미지 업로드 -->
                        <div class="image_upload" id="image_upload">
                            <form name="img_upload" method="post" enctype="multipart/form-data">
                                <div class="img_show" id="img_show"></div>
                                <div class="fileContainer">
                                    <input type="file" name="chooesFile" id="chooesFile" accept="image/*" onchange="loadFile(this)">
                                    <div class="fileInput">
                                        <p id="fileName">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--  -->
                        <label for="price">가격<sup class="star">*</sup></label>
                        <input type="text" id="price" name="price"  placeholder="금액을 입력해주세요" onchange="getNumber(this);" onkeyup="getNumber(this);">
                        <label for="title">표제<sup class="star">*</sup></label>
                        <input type="text" name="title" id="title" placeholder="제목없음">
                        <label for="sub_title">부제</label>
                        <input type="text" name="sub_title" id="sub_title">
                        <label for="writer">저자<sup class="star">*</sup></label>
                        <input type="text" name="writer" id="writer">
                        <label for="company">출판사<sup class="star">*</sup></label>
                        <input type="text" name="company" id="company">
                        <label for="compiler">역자</label>
                        <input type="text" name="compiler" id="compiler">
                        <div class="form_inline form_inline-1">
                            <label for="publication_date">출간일<sup class="star">*</sup></label>
                            <input type="date" name="publication_date" id="publication_date">
                        </div>
                        <div class="form_inline form_inline-2">
                            <label for="genre">장르<sup class="star">*</sup></label>
                            <div class="genre_select">
                                <select name="genre" id="genre">
                                    <option value="kor">국내도서</option>
                                    <option value="kor_1"> - 소설</option>
                                    <option value="kor_2"> - 시⦁에세이</option>
                                    <option value="kor_3"> - 경제경영</option>
                                    <option value="kor_4"> - 자기계발</option>
                                    <option value="kor_5"> - 사회과학</option>
                                    <option value="kor_6"> - 역사⦁문화</option>
                                    <option value="kor_7"> - 인문</option>
                                    <option value="kor_8"> - 자연⦁과학</option>
                                    <option value="forg">외국도서</option>
                                    <option value="forg_1"> - 어린이</option>
                                    <option value="forg_2"> - 문학</option>
                                    <option value="forg_3"> - 경제⦁인문</option>
                                    <option value="forg_4"> - 컴퓨터</option>
                                    <option value="other">기타</option>
                                </select>
                            </div>
                        </div>
                        <label for="mokcha">목차<sup class="star">*</sup></label>
                        <textarea name="mokcha" id="mokcha">목차를 작성해주세요.</textarea>
                        <label for="book_sogea">책 소개<sup class="star">*</sup></label>
                        <textarea name="book_sogea" id="book_sogea">책 소개를 작성해주세요.</textarea>
                        <input type="reset" id="reg_reset" value="다시 작성하기" onclick="focus_re()">
                        <input type="submit" id="reg_submit" value="등록하기">
                    </div>
                </form>
            </div>
        </div>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script type="text/javascript" src="assete/js/new_book.js"></script>
</html>