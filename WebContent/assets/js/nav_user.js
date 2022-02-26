    // login.js

	// 모달창 열기 이벤트
    $("#myBtnLogin").on("click", function(){
    $('body').css("overflow", "hidden");
    $(".login_wrap").css({ visibility:"visible",opacity:1});
    });
    // 모달창 닫기 이벤트 
    $("#closeLogin").on("click", function(){
    $('body').css("overflow-y", "scroll");
    $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    });

    $(document).on("click",function(e){
    if( $(".login_wrap").is(e.target)) {
    $(".login_wrap").css({ visibility:"hidden",opacity:0 });
    $('body').css("overflow-y", "scroll");
    }
    });
    
    // join.js
    
    $("#myBtnJoin").on("click", function(){
        $('body').css("overflow", "hidden");
        $(".join_wrap").css({ visibility:"visible",opacity:1});
        });
        // 모달창 닫기 이벤트 
        $("#closeJoin").on("click", function(){
        $('body').css("overflow-y", "scroll");
        $(".join_wrap").css({ visibility:"hidden",opacity:0 });
        });

        $(document).on("click",function(e){
        if( $(".join_wrap").is(e.target)) {
        $(".join_wrap").css({ visibility:"hidden",opacity:0 });
        $('body').css("overflow-y", "scroll");
        }
        });
    
    // pw.js
        
        // 모달창 열기 이벤트
        $("#myBtnPw").on("click", function(){
        $('body').css("overflow", "hidden");
        $(".login_wrap").css({ visibility:"hidden",opacity:0});
        $(".pw_wrap").css({ visibility:"visible",opacity:1});
        });
        // 모달창 닫기 이벤트 
        $("#closePw").on("click", function(){
        $('body').css("overflow-y", "scroll");
        $(".pw_wrap").css({ visibility:"hidden",opacity:0 });
        });

        $(document).on("click",function(e){
        if( $(".pw_wrap").is(e.target)) {
        $(".pw_wrap").css({ visibility:"hidden",opacity:0 });
        $('body').css("overflow-y", "scroll");
        }
        });
        
        function pw() {
        	let password_input = document.getElementById("password_input")
        	let pwError = document.getElementById("pwError");
        	if(password_input.value==""){
        		console.log('다시 해봐 비밀번호 찐공백')
        		pwError.innerHTML = "비밀번호를 입력해주세요."
        		pwError.style="color:red";
        		password_input.focus();
        		return false;
        }
        }
        
        
   // loginPwFind.js
        
        // 모달창 열기 이벤트
        $("#myBtnLoginPwFind").on("click", function(){
        $('body').css("overflow", "hidden");
        $(".login_wrap").css({ visibility:"hidden",opacity:0});
        $(".pw_find_wrap").css({ visibility:"visible",opacity:1});
        });
        // 모달창 닫기 이벤트 
        $("#closePwFind").on("click", function(){
        $('body').css("overflow-y", "scroll");
        $(".pw_find_wrap").css({ visibility:"hidden",opacity:0 });
        });

        $(document).on("click",function(e){
        if( $(".pw_find_wrap").is(e.target)) {
        $(".pw_find_wrap").css({ visibility:"hidden",opacity:0 });
        $('body').css("overflow-y", "scroll");
        }
        }); 
        
   // pwPwFind.js
        
        // 모달창 열기 이벤트
        $("#myBtnPwFind").on("click", function(){
        $('body').css("overflow", "hidden");
        $(".pw_wrap").css({ visibility:"hidden",opacity:0});
        $(".pw_find_wrap").css({ visibility:"visible",opacity:1});
        });
        // 모달창 닫기 이벤트 
        $("#closePwFind").on("click", function(){
        $('body').css("overflow-y", "scroll");
        $(".pw_find_wrap").css({ visibility:"hidden",opacity:0 });
        });

        $(document).on("click",function(e){
        if( $(".pw_find_wrap").is(e.target)) {
        $(".pw_find_wrap").css({ visibility:"hidden",opacity:0 });
        $('body').css("overflow-y", "scroll");
        }
        });
        
    // idFind.js
        
        // 모달창 열기 이벤트
        $("#myBtnIdFind").on("click", function(){
        $('body').css("overflow", "hidden");
        $(".login_wrap").css({ visibility:"hidden",opacity:0});
        $(".id_find_wrap").css({ visibility:"visible",opacity:1});
        });
        // 모달창 닫기 이벤트 
        $("#closeIdFind").on("click", function(){
        $('body').css("overflow-y", "scroll");
        $(".id_find_wrap").css({ visibility:"hidden",opacity:0 });
        });

        $(document).on("click",function(e){
        if( $(".id_find_wrap").is(e.target)) {
        $(".id_find_wrap").css({ visibility:"hidden",opacity:0 });
        $('body').css("overflow-y", "scroll");
        }
        });
        
        
        
        
        
        
        
        