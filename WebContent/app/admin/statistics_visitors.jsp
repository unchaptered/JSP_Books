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
		url: "${pageContext.request.contextPath}/admin/chart4View.adm",
		async:false
	}).responseText;
	console.log('json데이터최종 확인'+ json_data);
	var data=new google.visualization.DataTable(json_data);
	var chart=new google.visualization.ColumnChart(document.getElementById("chart_div"));
	chart.draw(data, {
		title: "한 손님이 하루에 결제한 총 금액",
		width: 1000,
		height: 550
	})

}


</script>
</head>
<body>
<div id="chart_div"></div>
<button id="btn" type="button" onclick="drawChart()">refresh</button>
</body>
</html>