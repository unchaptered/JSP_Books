<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${cp}/assets/css/admin/admin_common.css" >
    <title>Document</title>
</head>

<body>
    <div class="container">
        <header class="index_header">

        </header>
        
        <nav class="side_bar_a">
            <div>
                <h4>음반관리</h4> 
            </div>
            <div>
                <h4>고객지원</h4>
            </div>
            <div>
                <h4>회원관리</h4>
            </div>
            <div>
                <h4>매출관리</h4> 
            </div>
            <div>
            </div>
        </nav>
        <div class="main" id="main">

            <div class="content_container1">
               <a href="statistics_visitors.jsp"> <div><img src="${cp}/assets/img/visitors.png"  class="content1"></div></a>
                <div class="visitorFont"><h2>방문자 분석</h2></div>
            </div>
            <div class="content_container2">
                <a href="statistics_goods.jsp"><div><img src="${cp}/assets/img/goods.png"  class="content2"></div></a>
                <div class="goodsFont"><h2>재고 분석</h2></div>
            </div>
            <div class="content_container3">
               <a href="statistics_order.jsp"> <div><img src="${cp}/assets/img/order.png"  class="content3"></div></a>
                <div class="orderFont"><h2>주문 분석</h2></div>
            </div>
            <div class="content_container4">
               <a href="statistics_sales.jsp"> <div><img src="${cp}/assets/img/sales.jpg" class="content4"></div></a>
                <div class="salesFont"><h2>매출 분석</h2></div>
            </div>

         
        </div>
    </div>    

</body>

</html>