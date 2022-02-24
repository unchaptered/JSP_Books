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