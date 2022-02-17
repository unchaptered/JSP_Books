<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/admin/admin_index.css">

</head>
<body>
	 <div class="container">
        <header class="index_header">

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
                <a>사이트관리</a> 
            </div>
            <div>
                <a>대시보드</a> 
            </div>
            <div>
               <a href="./음반 등록.html" style="color:white" >음반관리</a>
            </div>
            <div>
                <h4>고객지원</h4>
            <div>
                <h4>회원관리</h4>
            </div>
            <div>
                <h4>매출관리</h4> 
            </div>
            <div>
                <h4>결제부가서비스</h4> 
            </div>
            
         
            <div>
                <h4>쇼핑</h4> 
            </div>
            <div>
                <h4>환경설정</h4> 
            </div>


            <div class="bar_a_container2">
                <div>
                    <h5>리소스</h5> 
                </div>
                <div>
                    <h4>고객지원</h4> 
                </div>
                <div>
                    <h4>아임웹교육</h4> 
                </div>
                <div>
                    <h4>디자이너찾기</h4> 
                </div>
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

</body>
<script type="text/javascript" src="./assets/js/admin_chart/echarts.js"></script>
</html>