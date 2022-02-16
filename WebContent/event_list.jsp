<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트 리스트</title>
<!-- 공용 css -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet" href="assets/css/screens/event/event_list.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="views/components/nav.jsp" %>
	
		<!-- 컨텐츠 영역 -->
		<main id="main">
			<section class="main_content">
				<div class="event">
					<!-- 타이틀 -->
					<a href="./event_list.jsp"><strong class="title">이벤트</strong></a>
					<div>
						<!-- 폼 시작 -->
						<form action="./event_list.jsp" name="eventForm" method="get" onsubmit="return sendit()">
							<!-- 이벤트 필터 -->
							<!-- <div class="event_filter"> -->
								<!-- 필터 구분 -->
								<!-- <div class="event_tabBox">
									<ul>
										<li id="category" class="category tabBox on" onclick="filter_click1(this)">
											<p>카테고리별 이벤트 찾기</p>
										</li>
										<li id="benefit" class="benefit tabBox" onclick="filter_click2(this)">
											<p>혜택별 이벤트 찾기</p>
										</li>
									</ul>
	
								</div> -->
								<!-- 필터 메뉴 -->
								<!-- <div class="event_tabMenu"> -->
									<!-- 카테고리별 이벤트 찾기 -->
									<!-- <div class="category tabMenu on">
										<div class="tabMenu_1">
											<ul>
												<li>
													<a href="#" class="menu on"><span>전체</span></a>
													<a href="#" class="menu"><span>소설</span></a>
													<a href="#" class="menu"><span>시⦁에세이</span></a>
													<a href="#" class="menu"><span>경제경영</span></a>
													<a href="#" class="menu"><span>자기계발</span></a>
													<a href="#" class="menu"><span>사회과학</span></a>
													<a href="#" class="menu"><span>역사⦁문화</span></a>
													<a href="#" class="menu"><span>자연⦁과학</span></a>
													<a href="#" class="menu"><span>외국도서</span></a>
													<a href="#" class="menu"><span>기타</span></a>
												</li>
											</ul>
										</div>
									</div> -->
									<!-- 혜택별 이벤트 찾기 -->
									<!-- <div class="benefit tabMenu">
										<div class="tabMenu_1">
											<ul>
												<li>
													<a href="#" class="menu on"><span>전체</span></a>
													<a href="#" class="menu"><span>증정</span></a>
													<a href="#" class="menu"><span>할인</span></a>
													<a href="#" class="menu"><span>적립</span></a>
													<a href="#" class="menu"><span>만남</span></a>
												</li>
											</ul>
										</div>
										<div class="tabMenu_hidden">
											<ul>
												<li>
													<a href="#"><span>1</span></a>
	
												</li>
											</ul>
										</div>
									</div> -->
								<!-- </div> -->
							<!-- </div> -->
							<!-- 검색창 -->
							<div class="event_search">
								<input type="text" name="search" id="e_search" placeholder="검색어를 입력해주세요.">
								<input type="submit" id="searchBtn" onsubmit="sendit()">
							</div>
							<div class="createEvent_div">
								<a href="./event_add.jsp" class="createEvent">새 이벤트 등록</a>
							</div>
							<!-- 이벤트 박스 -->
							<div class="eventBox_area content__grid">
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
								<a href="./event_read.jsp" class="eventBox content__container-4">
									<div class="eventBox_img">
										<img src="assets/img/event_banner1.png" alt="김문정 에세이">
									</div>
									<div class="eventBox_txt">
										<strong class="box_title">
											4th Mini Album [Midnight Guest] 구매자 대상 영상통화
										</strong>
										<p class="box_date">
											기간 : 2022. 01. 06 - 2022. 02. 13
										</p>
									</div>
								</a>
							</div>
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
						</form>
						<!-- 폼 끝 -->
					</div>
				</div>
			</section>
		</main>
	<!-- 경로 수정하셔야 합니다. -->	
	<%@ include file="views/components/footer.jsp" %>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script type="text/javascript" src="assets/js/nav_menu.js"></script>
<script type="text/javascript" src="assets/js/event_list.js"></script>
</html>