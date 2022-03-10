<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.google.com/jsapi"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
<%System.out.println("AA");%>
google.load("visualization","1",{"packages":["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(){
	var json_data=$.ajax({
		url: "${pageContext.request.contextPath}/admin/chart2View.adm",
		async:false
	}).responseText;
	console.log('json데이터최종 확인'+ json_data);
	var data=new google.visualization.DataTable(json_data);
	var chart=new google.visualization.LineChart(document.getElementById("chart_div"));
	chart.draw(data, {
		title: "실시간 결제 금액 추이",
		width: 600,
		height: 440
	})

}


</script>
</head>
<body>
<div id="chart_div"></div>
<button id="btn" type="button" onclick="drawChart()">refresh</button>
</body>
</html>