<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin_login.css" >

       
</head>

<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	
	
     <div id = "background">
     	
        <h2>인터파크</h2>
        
        <div class="container">
        	<form name="joinForm" method="post" action="${cp}/admin/AdminLoginOk.adm" onsubmit="return sendit()">
            <div class="column"> 
                <!-- 계정 , 비밀번호-->
                <div class="text1">
                    <input type="text" name="adminid" id="">
                </div>
                <div class="text2"> 
                    <input type="text" name="adminpw" id="">
                </div>
            </div>

        
                <!-- 로그인 상태 유지 체크박스-->
            <div>
            <input type="checkbox" name="" id=""> 로그인 상태 유지
            </div>
            

                <!--관리자 로그인 -->
            <div>
            <div id="adminlogin"><button >관리자 로그인</button></div>
            </div>


            <div class="container_dep">
                <div>
                    <div><a href="./관리자 회원가입.html">회원가입</a></div>
                    <!--회원가입-->
                </div>
                <div>
                    <div>비밀번호 찾기</div>
                    <!--비밀번호 찾기-->
                </div>
            </div>
        </form>
        </div>
    </div>
</body>

   
  

</html>
