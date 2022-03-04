<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.google.com/jsapi"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
google.load("visualization","1",{"packages":["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(){
	var json_data=$.ajax({
		url: "${pageContext.request.contextPath}/admin/chart1View.adm",
		async:false
	}).responseText;
	var data=new google.visualization.DataTable(json_data);
	var chart=new google.visualization.PieChart(document.getElementById("chart_div"));
	chart.draw(data, {
		title: "차트 예제",
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