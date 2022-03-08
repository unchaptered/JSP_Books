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
<%System.out.println("BB");%>
google.load("visualization","1",{"packages":["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(){
	
	var json_data=$.ajax({
		url: "${pageContext.request.contextPath}/admin/chart2View.adm",
		async:false
	}).responseText;
	console.log('json데이터최종 확인'+ json_data);
	var data=new google.visualization.DataTable(json_data);
	var chart=new google.visualization.LineChart(document.getElementById("curve_chart"));
	chart.draw(data, {
		title: "Total Sales",
		curveType: "function",
		legend: {position:"bottom"},
		width: 1000,
		height: 400
	})

}


</script>
</head>
<body>
<div id="chart_div"></div>
<button id="btn" type="button" onclick="curve_chart()">refresh</button>
</body>
</html>