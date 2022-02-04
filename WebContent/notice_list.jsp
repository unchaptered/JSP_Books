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
                    <table class="notice_table">
                        <colgroup>
                            <col class="col">
                            <col>
                            <col class="col">
                            <col class="col">
                            <col class="col">
                        </colgroup>
                        <thead>
                            <tr class="th_tr">
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>15</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="notice_title"><a href="./notice_read.jsp">asdfasfadsfadsfsadf</a></td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="notice_title"><a
                                        href="./notice_read.jsp">asdfasfadsfadsfsadfasdfsadfdsfdsfasdfsaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="notice_title"><a href="./termsOfUse.jsp">이용약관</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td class="notice_title"><a href="./privacyPolicy.jsp">개인정보 처리방침</a>
                                </td>
                                <td>작성자</td>
                                <td>2012.1.2</td>
                                <td>10000</td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="notice_write.jsp" class="createNotice">새 공지 등록</a>
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