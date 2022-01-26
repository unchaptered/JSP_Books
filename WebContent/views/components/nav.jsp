<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <nav id="nav">
        <section class="nav-sizer">
            <div class="nav_column">
                <svg class="nav_menu_btn" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 nav_svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
            </div>
            <div class="nav_column">
                <a href="index.jsp" class="nav_logo">Books</a>
            </div>
            <div class="nav_column">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 nav_svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
                <input type="button" value="login">
                <input type="button" value="join">
            </div>
        </section>
    </nav>
    <nav id="nav_menu" class="nav_opaciter nav_displayer">
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">도서</summary>
            <section class="nav_menu_linkers">
                <a href="#"> 전체 책 보기</a>
                <a href="#"> 전체 책 보기</a>
                <a href="#"> 전체 책 보기</a>
                <a href="#"> 전체 책 보기</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">중고도서</summary>
            <section class="nav_menu_linkers">
                <a href="old_book_list.jsp">중고 책 리스트</a>
                <a href="old_book_detail.jsp">중고 책 디테일</a>
                <a href="old_book_add.jsp">중고 책 심사신청</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">이벤트</summary>
            <section class="nav_menu_linkers">
                <a href="#">이벤트 예정</a>
                <a href="#">이벤트 목록</a>
            </section>
        </details>
        <details class="nav_menu_details">
            <summary class="nav_menu_summary">공지사항</summary>
            <section class="nav_menu_linkers">
                <a href="#">공지사항</a>
            </section>
        </details>
    </nav>
</body>
<script src=""></script>
</html>