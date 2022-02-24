<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 리스트</title>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${cp}/assets/css/styles.css">
<link rel="stylesheet" href="${cp}/assets/css/screens/notice/notice_list.css">
</head>
<body>
	<%@ include file="/app/components/nav.jsp" %>

	<main id="main">
		<section class="main_content">
			<div class="notice">
				<a href="${cp}/app/post/NoticeList.po"><strong class="title">공지사항</strong></a>
				<!-- 폼 시작 -->
				<form action="" name="noticeForm" method="get" onsubmit="sendit()">
					<div class="board_count">
						total : <span>${noticeTotalCnt}</span> / pages : <span>${noticeTotalPage}</span>
					</div>
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
						<!-- 공지 테이블 내용 : 한 페이지에 중요공지 포함 15개 -->
						<tbody>
							<c:choose>
								<c:when test="${noticeList.size()>0 and noticeList != null}">
									<c:forEach var="notice" items="${noticeList}">
										<c:choose>
											<c:when test="${notice.noticePin == 'Y'}">
												<tr class="alert">
													<td class="board_num">${notice.noticePk}</td>
													<td class="board_tlt">
														<a href="${cp}/app/post/NoticeRead.po?noticePk=${notice.noticePk}&noticePage=${noticePage}">${notice.postTitle}</a>
													</td>
													<td class="board_writer">${ownerName}</td>
													<td class="board_date">${fn:substring(notice.postCreated,0,10)}</td>
													<td class="board_hit">${notice.postViewed}</td>
													<%-- <c:if test="">
														<td class="board_file"><a href="${cp}/app/FileDownload.po?systemname="
															download><img src="${cp}/assets/img/icon_download.png" alt="파일"
																id="fileDownLoad"></a></td>
													</c:if> --%>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td class="board_num">${notice.noticePk}</td>
													<td class="board_tlt">
														<a href="${cp}/app/post/NoticeRead.po?noticePk=${notice.noticePk}&noticePage=${noticePage}">${notice.postTitle}</a>
													</td>
													<td class="board_writer">${ownerName}</td>
													<td class="board_date">${fn:substring(notice.postCreated,0,10)}</td>
													<td class="board_hit">${notice.postViewed}</td>
													<%-- <c:if test="">
														<td class="board_file"><a href="${cp}/app/FileDownload.po?systemname="
																			download><img src="${cp}/assets/img/icon_download.png" alt="파일"
																				id="fileDownLoad"></a></td>
													</c:if> --%>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="notice_none" colspan="6">
											등록된 공지사항이 없습니다.
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<a href="${cp}/app/post/NoticeAdd.po?noticePage=${noticePage}" class="createNotice">새 공지 등록</a>
					<!-- 페이지 버튼 : 한 페이지 1~10-->
					<div class="pagination">
						<ul>
							<c:if test="${noticePage>10}">
								<li><a href="${cp}/app/post/NoticeList.po?noticePage=${noticePage-10}" class="pageBtn prev">이전</a></li>
							</c:if>
							<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
								<c:choose>
									<c:when test="${i == noticePage }">
										<li><span class="pageBtn pageNum current">${i}</span></li>
									</c:when>
									<c:when test="${i == 0}">
										<li><span class="pageBtn pageNum current">1</span></li>
									</c:when>
									<c:otherwise>
										<li><a href="${cp}/app/post/NoticeList.po?noticePage=${i}&keyword=${keyword}" class="pageBtn pageNum">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 버튼 : +10페이지가 존재 하는지 확인(있으면 eventPage+10, 없으면 마지막페이지로)-->
							<c:if test="${noticePage > 10 && noticePage < noticeTotalPage && noticePage+10 < noticeTotalPage}">
								<li><a href="${cp}/app/post/NoticeList.po?noticePage=${noticePage+10}" class="pageBtn next">다음</a></li>
							</c:if>
							<c:if test="${noticePage > 10 && noticePage < noticeTotalPage && noticePage+10 >= noticeTotalPage}">
								<li><a href="${cp}/app/post/NoticeList.po?noticePage=${noticeTotalPage}" class="pageBtn next">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- 공지사항 검색창 -->
					<div class="notice_search">
						<input type="text" name="keyword" id="n_search" placeholder="검색어를 입력해주세요." value="${param.keyword}">
						<input type="submit" id="searchBtn" onclick="searchNotice()">
					</div>
				</form>
				<!-- 폼 끝 -->
			</div>
		</section>
	</main>

	<%@ include file="/app/components/footer.jsp" %>
</body>
<script type="text/javascript" src="${cp}/assets/js/nav_menu.js"></script>
<script src="${cp}/assets/js/notice_list.js"></script>
</html>