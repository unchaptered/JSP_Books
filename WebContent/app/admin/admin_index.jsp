<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin_index.css" >
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${cp}/assets/css/admin/admin_index.css" >
<script>const cp = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="${cp}/assets/js/admin_chart/echarts.js"></script>
</head>
<body>
	<c:if test="${loginAdmin==null}">
		<script>
			let cp = "${pageContext.request.contextPath}";
		 	alert("로그인 후 이용하세요");
		 	location.replace(cp+"/app/admin/admin_login.jsp")
		</script>
	</c:if>
    <div class="container">
        <header class="index_header">
            <div class="header_box1"></div>
            <span>${loginAdmin.adminname}관리자님 접속하셨습니다</span>
            <a href="${cp}/app/admin/admin_login.jsp" class="header_box1"><div >로그인</div></a>
            <a href="${cp}/admin/AdminLogoutOk.adm" class="header_box2"><div onclick="f_logout()">로그아웃</div></a>
            <a href="${cp}/index.jsp" class="header_box3"><div >나가기</div></a>
        </header>
   
        <nav class="side_bar_a">
            <span ><div class="wrapper"></div></span>
            <span><div><h4>Book</h4></div></span>
            <div class="bar_a_container1">
                <div>
                    <h4>디자인모드</h4> 
                </div>
                <div>
                    <h4>사이트바로가기</h4> 
                </div>
            </div>
           
      
            <div>
                <h4>회원관리</h4>
            </div>
            <div>
                <a href="${cp}/app/admin/statistics_main.jsp" class="chart1" > 통계</a>
            </div>
            <div>
                <div id="menu1">
                    <ul class="main">
                        <li><div class="board_adm"> 게시물 관리</div>
                            <ul class="sub">
                                <li><a href="${cp}/post/NoticeList.po" class="board_adm1"> 공지사항 관리</a></li>
                                <li><a href="${cp}/post/EventList.po" class="board_adm2"> 이벤트 관리</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> 
            </div>
            
            <div>

            </div>
          
          


       


        </nav>
        <div class="main" id="main">
            <section class="post">
                <div class="post_container">
                    <div class="post1">
                        기본설정
                    </div>
                    <div class="post2">
                        판매하기
                    </div>
                    <div class="post3">
                        성장하기
                    </div>
                    <div class="post4">
                        추천작업
                    </div>
                </div>

            </section>

            <section class="register_cnt">
                <div class="cnt_header">
                    오늘 판매량
                </div>
                <div class="cnt_boxes">
                    <h5>신규주문</h5>
                    <h5>취소관리</h5>
                    <h5>반품관리</h5>
                    <h5>교환관리</h5>
                </div>
            </section>

            <section class="statistics">
                <div class="statistics_container">
                    <div class="statistics_header">
                        <h5>주요현황</h5>
                    </div>
                    <div class="tab_container">
                        <div>
                            <h5>매출</h5>
                        </div>
                        <div>
                            <h5>주문</h5>
                        </div>
                        <div>
                            <h5>방문자</h5>
                        </div>
                        <div>
                            <h5>신규회원</h5>
                        </div>
                    </div>
                    <div class="tab_container_middle">
                        <div>
                            매출현황
                        </div>
                        <div>
                            상품판매순위
                        </div>
                    </div>
                    <div class="container_statistics">
                        <div class="statistics_box1">
                            <table border="1">
                                <th>날짜</th>
                                <th>매출금액</th>
                                <th>판매금액</th>
                                <th>환불금액</th>
                                <tr>
                                    <td>1/18</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/19</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/20</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/21</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/22</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/23</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>1/24</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>7일합계</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>15일 합계</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>30일합계</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                            </table>
                        </div>
                        <div id="main2" style="width: 400px;height:400px;">
                        </div>
                            
                      
                    </div> 
                    
                </div>


            </section>
        </div>
        <nav class="side_bar_b">
            <div class="side_container">
                <div class="box1">
                    <h4>관리자</h4>
                </div>
                <div class="box2">
                    <h4>광고</h4>
                </div>
                <div class="box3">
                    <h4>광고</h4>
                </div>
                <div class="box4">
                    <h4>운영자 설정</h4>
                </div>
                <div class="box5">
                    <h4>관리자 공유 메모</h4>
                </div>
            </div>
        </nav>
       
        
    </div>
    <!-- 높이와 너비가 지정된 Dom 을 생성합니다 -->
<script>const cp = "${pageContext.request.contextPath}"</script>
<script type="text/javascript">
	function f_logout(){
		alert('관리자 로그아웃 되었습니다');
	}
    // DOM을 준비하고 echart 객체를 만듭니다.
    var myChart = echarts.init(document.getElementById('main2'));

    // 차트 속성과 데이터를 지정합니다.
    var option = {
        title: {
            text: '판매수량'
        },
        tooltip: {},
        legend: {
            data:['Sales']
        },
        xAxis: {
            data: ["자바의 정석","국화와 칼","축적의 길","심리학의 이해","C 프로그래밍","리눅스 프로그래밍"]
        },
        yAxis: {},
        series: [{
            name: 'Sales',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };

    // 위에서 설정한 속성을 차트에 반영합니다.
    myChart.setOption(option);
</script>

    
</body>


</html>