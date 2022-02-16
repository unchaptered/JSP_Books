<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 리스트</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/notice/notice_list.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
	<main id="main">
        <section class="main_content">
            <div class="notice">
                <a href="./notice_list.jsp"><strong class="title">공지사항</strong></a>
                <!-- 폼 시작 -->
                <form action="./notice_list.jsp" name="noticeForm" method="get" onsubmit="return sendit()">
                    <div class="board_count">총 게시물 수 : <span>15</span> / 총 페이지 수 : <span>1</span></div>
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
                            <tr class="alert">
                                <td class="board_num">공지</td>
                                <td class="board_tlt"><a href="./notice_read.jsp"><strong>택배노조 파업으로 인한 CJ대한통운 택배 지연 공지 [알라딘교보문고인터파크]</strong></a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">14</td>
                                <td class="board_tlt"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">13</td>
                                <td class="board_tlt"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">12</td>
                                <td class="board_tlt"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">11</td>
                                <td class="board_tlt"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">10</td>
                                <td class="board_tlt"><a href="./notice_read.jsp">제목길이ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ</a></td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">9</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">8</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">7</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">6</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">5</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">4</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">3</td>
                                <td class="board_tlt"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"><a href="#" download><img src="assets/img/icon_download.png" alt="파일" id="fileDownLoad"></a></td>
                            </tr>
                            <tr>
                                <td class="board_num">2</td>
                                <td class="board_tlt"><a href="./termsOfUse.jsp">이용약관</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"></td>
                            </tr>
                            <tr>
                                <td class="board_num">1</td>
                                <td class="board_tlt"><a href="./privacyPolicy.jsp">개인정보 처리방침</a>
                                </td>
                                <td class="board_writer">작성자</td>
                                <td class="board_date">2012.1.2</td>
                                <td class="board_hit">10000</td>
                                <td class="board_file"></td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="notice_add.jsp" class="createNotice">새 공지 등록</a>
                    <!-- 페이지 버튼 -->
                    <div class="page">
                        <ul>
                            <li><a href="#" class="pageBtn prev">이전</a></li>
                            <li><a href="#" class="pageBtn pageNum current">1</a></li>
                            <li><a href="#" class="pageBtn pageNum">2</a></li>
                            <li><a href="#" class="pageBtn pageNum">3</a></li>
                            <li><a href="#" class="pageBtn pageNum">4</a></li>
                            <li><a href="#" class="pageBtn pageNum">5</a></li>
                            <li><a href="#" class="pageBtn pageNum">6</a></li>
                            <li><a href="#" class="pageBtn pageNum">7</a></li>
                            <li><a href="#" class="pageBtn pageNum">8</a></li>
                            <li><a href="#" class="pageBtn pageNum">9</a></li>
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
	
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script src="assets/js/notice_list.js"></script>
</html>