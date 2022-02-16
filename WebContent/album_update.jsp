<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
</head>
<link rel="stylesheet" href="./register.css">
<body>
    <div class="container">
        <header class="index_header">

        </header>
        <div class="title">
            <h1>음반 등록</h1>
        </div>
        <nav class="side_bar_a">
            <div>
                <h4>음반관리</h4> 
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
            </div>
        </nav>
        <div class="main" id="main">
            <div class="postImg">
                <!-- 상품등록 박스 -->
                <div class="image-show" id="image-show"></div>
                <form method="post" enctype="multipart/form-data">
                    <div class="button">
                        <label for="chooseFile">
                            👉 CLICK HERE! 👈
                        </label>
                    </div>
                    <div class="submitButton" id="submitButton"></div>
                    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                </form>
            </div>
            <div class="postRegister" id="wrap">
                <!-- 음반 내용 등록 -->
                <form method="post" action="">
                    <table>
                        <tr>
                            <td id="result" colspan="2"></td>
                        </tr>
                        <tr>
                            <th><label for="userid">앨범이름</label></th>
                            <td><input type="text" name="userid" id="userid">
                                 
                        </tr>
                        <tr>
                            <th><label for="userpw">타이틀곡</label></th>
                            <td><input type="text" name="userpw" id="userpw"></td>
                        </tr>
                        <tr>
                            <th><label for="userpw_re">가수</label></th>
                            <td><input type="text" name="userpw_re" id="userpw_re"></td>
                        </tr>
                        <tr>
                            <th><label for="username">작곡가</label></th>
                            <td><input type="text" name="username" id="username"></td>
                        </tr>
                        <tr>
                            <th><label for="username">작사가</label></th>
                            <td><input type="text" name="username" id="username"></td>
                        </tr>
                        <tr>
                            <th><label for="username">음반 출시일</label></th>
                            <td><input type="text" name="username" id="username"></td>
                        </tr>
                       
                      
                        
                        <tr>
                            <th colspan="2">
                                <!-- <input type="submit" value="가입 완료"> -->
                                <input type="button" value="등록 하기" onclick="showImage()">
                            </th>
                        </tr>
                    </table>

                </form>

            </div>
            
        </div>
        
            
           
        </div>
    </div>

    <script src="./assets/js/album_update.js"></script>

</body>

</html>