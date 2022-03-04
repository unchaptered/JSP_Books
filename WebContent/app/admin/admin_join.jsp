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
    <style>
         #wrap {
            width: 1000px;
            margin: 0 auto;
        }

        body {
            background-color: rgb(245, 246, 247);
        }

        input {
            box-sizing: border-box;
            cursor: pointer;
        }

        table {
            border-collapse: collapse;
        }

        th {
            text-align: left;
        }

        th::after {
            content: "";
            display: inline-block;
            box-sizing: border-box;
            width: 1px;
            height: 14px;

        }

        th,
        td {
            padding: 5px;
        }

        td {
            padding-left: 20px;
            width: 400px;
        }

        input[type=text],
        input[type=password] {
            padding: 10px 15px 10px 10px;
            border: 1px solid #ccc;
            width: 250px;
        }

        input:focus {
            outline: none;
            border: 1px solid rgb(0, 200, 80);
        }

        td>input[type=text]+input[type=button] {
            margin-left: 10px;
            padding: 8px 10px;
            background-color: rgb(0, 200, 80);
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            width: 80px;
        }

        .gender_area>td {
            font-size: 16px;
        }

        .zipcode_area>td>input[type=text] {
            width: 200px;
        }

        .zipcode_area>td>input[type=button] {
            width: 130px !important;
        }

        .addr_area>td>input[type=text],
        .addr_area+tr>td>input[type=text],
        .addr_area+tr+tr>td>input[type=text] {
            width: 340px;
        }

        .hobby_area>td>div {
            display: flex;
            width: 360px;
            flex-wrap: wrap;
        }

        .hobby_area>td>div>div {
            padding: 10px;
            flex: 1 1 40%;
        }

        .hobby_area>td>div>div:nth-child(2n) {
            border-left: 1px solid #ccc;
        }

        input[type=submit] {
            margin: 0 auto;
            padding: 10px 10px;
            margin-left: 40px;
            background-color: rgb(0, 200, 80);
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            width: 400px;
        }

        #result {
            color: #ff0000;
            font-weight: bold;
        }
        #wrap{
            margin-top:100px;
            width:580px;
            height:400px;
            background-color: white;
        }
        .table{
            margin-left:20px;
        }

    </style>
  
</head>

<body>
	<body>
    <div id="wrap">
		<c:set var="cp" value="${pageContext.request.contextPath}"/>
        <form name="joinForm" method="post" action="${cp}/admin/AdminJoinOk.adm" onsubmit="return sendit()">
            <table class="table">
                <tr>
                    <td id="result" colspan="2"></td>
                </tr>
                <tr>
                    <th><label for="adminid">아이디</label></th>
                    <td><input type="text" name="adminid" id="adminid"><input type="button" value="중복검사"
                            onclick="checkId()"></td>
                </tr>
                <tr>
					<td id="result" colspan="2">&nbsp;</td>
				</tr>
                <tr>
                    <th><label for="adminpw">비밀번호</label></th>
                    <td><input type="password" name="adminpw" id="adminpw"></td>
                </tr>
                <tr>
                    <th><label for="adminpw_re">비밀번호 확인</label></th>
                    <td><input type="password" name="adminpw_re" id="adminpw_re"></td>
                </tr>
                <tr>
                    <th><label for="adminname">이름</label></th>
                    <td><input type="text" name="adminname" id="adminname"></td>
                </tr>
                <tr>
                    <th><label for="adminkey">인증키</label></th>
                    <td><input type="text" name="adminkey" id="adminkey"><input type="button" value="중복검사"
                        onclick="check()"></td>
                    
                </tr>
               
                <tr>
                    <th colspan="2">
                        <!-- <input type="submit" value="가입 완료"> -->
                        <input type="submit" value="가입 완료" >
                    </th>
                    
                </tr>
            </table>
        </form>
    </div>
</body>
</body>
<script>const cp = "${pageContext.request.contextPath}"</script>
<script src="${cp}/assets/js/admin_join.js"></script>

</html>
