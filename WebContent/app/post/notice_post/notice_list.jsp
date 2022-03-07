<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${loginAdmin==null}">
	<script>
			let cp = "${pageContext.request.contextPath}";
		 	alert("로그인 후 이용하세요");
		 	location.replace(cp+"/admin/AdminJoin.adm")
		</script>
	</c:if>
	<main id="main">
		<section class="main_content">
			<div class="notice">
				<a href="${cp}/post/NoticeList.po"><strong class="title">공지사항</strong></a>
				<!-- 폼 시작 -->
				<form name="noticeForm" method="get">
					<div class="board_count">
						total : <span>${noticeTotalCnt}</span> / pages : <span>${noticeTotalPage}</span>
					</div>
					<table class="notice_table">
						<colgroup>
							<%-- <c:if test="${loginAdmin != null }"> --%>
								<col class="colcheck">
							<%-- </c:if> --%>
							<col class="col">
							<col>
							<col class="col">
							<col class="col">
							<col class="col">
						</colgroup>
						<thead>
							<tr>
								<%-- <c:if test="${loginAdmin != null }"> --%>
									<th><input type="checkbox" id="thCheck" name="thCheck" onclick="allCheck(this)"></th>
								<%-- </c:if> --%>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회</th>
							</tr>
						</thead>
						<!-- 공지 테이블 내용 : 한 페이지에 중요공지 포함 15개 -->
						<tbody>
							
							<c:choose>
								
								<c:when test="${noticePinList.size() > 0 and noticePinList != null or noticeList.size() > 0 and noticeList != null}">
									
									<c:if test="${noticePinList.size() > 0 and noticePinList != null}">
										
										<c:forEach var="noticePin" items="${noticePinList}" varStatus="status">
											<tr class="alert">
												<%-- <c:if test="${loginAdmin != null }"> --%>
													<td class="board_check"><input type="checkbox" name="nCheck" value="${noticePin.noticePk}"></td>
												<%-- </c:if> --%>
												<td class="board_num">${noticePin.noticePk}</td>
												<td class="board_tlt">
													<a href="${cp}/post/NoticeRead.po?noticePk=${noticePin.noticePk}&noticePage=${noticePage}"><strong>${noticePin.postTitle}</strong></a>
												</td>
												<td class="board_writer">${ownerNamePin[status.index]}</td>
												<td class="board_date">${fn:substring(noticePin.postCreated,0,10)}</td>
												<td class="board_hit">${noticePin.postViewed}</td>
											</tr>
										</c:forEach>
										
									</c:if>
									
									<c:if test="${noticeList.size() > 0 and noticeList != null}">
										
										<c:forEach var="notice" items="${noticeList}" varStatus="status">
											<tr>	
												<%-- <c:if test="${loginAdmin != null }"> --%>
													<td class="board_check"><input type="checkbox" name="nCheck" value="${notice.noticePk}"></td>
												<%-- </c:if> --%>
												<td class="board_num">${notice.noticePk}</td>
												<td class="board_tlt">
													<a href="${cp}/post/NoticeRead.po?noticePk=${notice.noticePk}&noticePage=${noticePage}">${notice.postTitle}</a>
												</td>
												<td class="board_writer">${ownerName[status.index]}</td>
												<td class="board_date">${fn:substring(notice.postCreated,0,10)}</td>
												<td class="board_hit">${notice.postViewed}</td>
											</tr>
										</c:forEach>
										
									</c:if>
									
								</c:when>
								
								<c:otherwise>
								
									<tr>
										<%-- <c:choose>
											<c:when test="${loginAdmin != null }"> --%>
												<td class="notice_none" colspan="6">
													등록된 공지사항이 없습니다.
												</td>
											<%-- </c:when>
											<c:otherwise>
												<td class="notice_none" colspan="5">
													등록된 공지사항이 없습니다.
												</td>
											</c:otherwise>
										</c:choose> --%>
									</tr>
									
								</c:otherwise>
								
							</c:choose>				
						</tbody>
					</table>
					
					<%-- <c:if test="${loginAdmin != null }"> --%>
						<a href="${cp}/post/NoticeAdd.po?noticePage=${noticePage}" class="noticeBtn createNotice">새 공지 등록</a>
						<a href="javascript:deleteCheck();" class="noticeBtn deleteCheckBtn">선택삭제</a>
					<%-- </c:if> --%>
					
					<!-- 페이지 버튼 : 한 페이지 1~10-->
					<div class="pagination">
						<ul>
							<c:if test="${noticePage>10}">
								<li><a href="${cp}/post/NoticeList.po?noticePage=${noticePage-10}" class="pageBtn prev">이전</a></li>
							</c:if>
							<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
								<c:choose>
									<c:when test="${i == noticePage }">
										<li><span class="pageBtn pageNum current">${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href="${cp}/post/NoticeList.po?noticePage=${i}&keyword=${keyword}" class="pageBtn pageNum">${i}</a></li>
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
							<!-- 다음 버튼 : +10페이지가 존재 하는지 확인(있으면 noticePage+10, 없으면 마지막페이지로)-->
							<c:if test="${noticePage != noticeTotalPage && endPage < noticeTotalPage && noticePage+10 < noticeTotalPage}">
								<li><a href="${cp}/post/NoticeList.po?noticePage=${noticePage+10}&keyword=${keyword}" class="pageBtn next">다음</a></li>
							</c:if>
							<c:if test="${noticePage != noticeTotalPage && endPage < noticeTotalPage && noticePage+10 >= noticeTotalPage}">
								<li><a href="${cp}/post/NoticeList.po?noticePage=${noticeTotalPage}&keyword=${keyword}" class="pageBtn next">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- 공지사항 검색창 -->
					<select name="searchSort">
						<option value="" selected>전체</option>
						<option value="tlt">제목</option>
						<option value="cont">내용</option>
					</select>
					<div class="notice_search">
						<input type="text" name="keyword" id="n_search" placeholder="공지사항 제목을 입력하세요." value="${param.keyword}">
						<input type="submit" id="searchBtn">
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
<script>

//공지사항 선택삭제
	function deleteCheck(){
		let nCheck = document.getElementsByName("nCheck");
		let noticePk = ""
		let first = false;
		const xhr = new XMLHttpRequest();
		
		for (i = 0; i < nCheck.length; i++) {
			if(nCheck[i].checked){
				if(!first){
					noticePk = nCheck[i].value;
					first = true;
				}else{
					noticePk += "-" + nCheck[i].value;
				}
			}
		}
		
		if(noticePk.length == 0){
			alert("선택된 게시물이 없습니다.");
		}
		else{
			if(confirm("선택한 게시물을 삭제하시겠습니까?")){
				xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200){
						location.replace("${pageContext.request.contextPath}/post/NoticeList.po");		
					}
				}
			}
			xhr.open("GET","${pageContext.request.contextPath}/post/RemoveCheckNotice.po?noticePk="+noticePk,true);
			xhr.send();
		}	
	}
		
}

</script>
</html>