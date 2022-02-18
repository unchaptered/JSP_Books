<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 리스트</title>
<link rel="stylesheet" href="../../../assets/css/styles.css">
<link rel="stylesheet" href="../../../assets/css/screens/notice/notice_list.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>
	<a href="app/components/nav.jsp"></a>
	<main id="main">
        <section class="main_content">
            <div class="notice">
                <a href=""><strong class="title">공지사항</strong></a>
                <!-- 폼 시작 -->
                <form action="" name="noticeForm" method="get" onsubmit="return sendit()">
                    <div class="board_count">total : <span>15</span> / pages : <span>1</span></div>
                    <table class="notice_table">
                        <colgroup>
                            <col class="col">
                            <col>
                            <col class="col">
                            <col class="col">
                            <col class="col">
                            <col class="col">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                                <th>첨부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 공지 테이블 내용 : 한 페이지에 중요공지 포함 15개 -->
                            <tr class="alert">
                                <td class="board_num">공지</td>
                                <td class="board_tlt"><a href=""><strong>택배노조 파업으로 인한 CJ대한통운 택배 지연 공지 [알라딘교보문고인터파크]</strong></a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="" download><img src="../../../assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">14</td>
                                <td class="board_tlt"><a href="">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="" download><img src="../../../assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">1</td>
                                <td class="board_tlt"><a href="">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="" download><img src="../../../assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="" class="createNotice">새 공지 등록</a>
                    <!-- 페이지 버튼 : 한 페이지 1~10-->
                    <div class="page">
                        <ul>
                            <li><a href="#" class="pageBtn prev">이전</a></li>
                            
                            <li><a href="#" class="pageBtn pageNum current">1</a></li>

                            <li><a href="#" class="pageBtn pageNum">10</a></li>

                            <li><a href="#" class="pageBtn next">다음</a></li>
                        </ul>
                    </div>
                    <!-- 공지사항 검색창 -->
                    <div class="notice_search">
                        <input type="text" name="search" id="n_search" placeholder="검색어를 입력해주세요.">
                        <input type="submit" id="searchBtn" onsubmit="sendit()">
                    </div>
                </form>
                <!-- 폼 끝 -->
            </div>
        </section>
    </main>
		
	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="../../../assets/js/nav_menu.js"></script>
<script src="../../../assets/js/notice_list.js"></script>
</html>