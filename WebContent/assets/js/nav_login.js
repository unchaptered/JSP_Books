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