<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 새 책 등록 - BOOKS </title>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="${cp}/assets/css/screens/new_book/new_book_add.css">
<!-- 저자 : sunsetkk -->
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/nav.jsp" %>
	
	<main id="main">
		<div class="main_content">
            <div class="content">
                <form method="post" id="registerForm" class="registerForm" enctype="multipart/form-data" action="${cp}/book/NewBookAddOk.nb">
                    <div class="top_name">
                        <h2>책 등록하기</h2><br>
                        <hr><br>
                    </div>
                    <div class="registerInput">
                        <!-- 이미지 업로드 -->
	                    <div class="imageUpload" id="imageUpload">
                            <form name="imgUpload">
                                <div class="imgShow" id="imgShow"></div>
                                <div class="fileContainer">
                                    <input type="file" name="chooseFile" id="chooesFile" accept="image/*" onchange="loadFile(this)">
                                    <div class="fileInput"><p id="fileName">&nbsp;</p></div>
                                </div>
                            </form>
	                    </div>
                        <!--  -->
                        <label for="title" class="title" >표제<sup class="star">*</sup> <input type="text" name="title" id="title" placeholder="제목없음"></label>
                        <label for="subtitle" class="subtitle" >부제<input type="text" name="subtitle" id="subtitle"></label>
                        <label for="publisher" class="publisher">출판사<sup class="star">*</sup><input type="text" name="publisher" id="publisher"></label>
                        <label for="genre" class="genre">장르<sup class="star">*</sup>
                            <select name="country" id="country" onchange="categoryChange(this)">
                            <!-- onchange="categoryChange(this)" -->
                                <option value="opt">장르를 선택해주세요.</option>
                                <option value="kor">국내도서</option>
                                <option value="forg">국외도서</option>
                            </select>
                            <select name="genre" id="genre">
                                <option>상세장르</option>
                            </select>
                        </label>
                        <label for="created" class="created">출간일<sup class="star">*</sup><input type="date" name="created" id="created"></label>
                        <label for="writer" class="writer">저자<sup class="star">*</sup><input type="text" name="writer" id="writer"></label>
                        <label for="translater" class="translater">역자<input type="text" name="translater" id="translater"></label>
                        <label for="pages" class="pages">페이지 수<sup class="star">*</sup> <input type="number" name="pages" id="pages" placeholder="페이지 수를 입력해주세요." min="0"></label>
                        <label for="price" class="price">가격<sup class="star">*</sup><input type="text" id="price" name="price"  placeholder="금액을 입력해주세요." onchange="getNumber(this);" onkeyup="getNumber(this);"></label>
                        <label for="mount" class="mount">재고량<sup class="star">*</sup><input type="number" name="mount" id="mount" min="0"></label>
                        <label for="info" class="info">책 소개<sup class="star">*</sup>
                            <p class="textCnt" id="textCnt"><span id="counting">0</span> /700</p>
                            <textarea name="info" id="info" placeholder="책 소개를 작성해주세요." onkeyup="counter()" maxlength="700"></textarea>
                        </label>
                        <label for="infoShort" class="infoShort">목차<sup class="star">*</sup>
                            <p class="textCnt" id="textCnt2" ><span id="counting2">0</span> /1000</p>
                            <textarea name="infoShort" id="infoShort" placeholder="목차를 작성해주세요." onkeyup="counter()" maxlength="1000"></textarea>
                        </label>
                        <div class="btn">
                            <input type="reset" id="regReset" value="다시 작성하기" onclick="focus_re()">
                            <input type="submit" id="regSubmit" value="등록하기">
                        </div>
                    </div>
                </form>
            </div>
        </div>
	</main>
	
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script type="text/javascript" src="${cp}/assets/js/new_book_add.js"></script>
</html>