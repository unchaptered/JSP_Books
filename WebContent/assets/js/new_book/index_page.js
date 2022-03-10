// 저자 : 김명현 
function checkthis(){
    const frm = document.checkForm;
    const check = frm.check1;
    const basket = document.getElementById("basket2")
    let flag = false;
    for(let check2 of check){
        if(check2.checked){
            basket.style.background = "rgb(238,125,60)";
            basket.style.color="azure"
            console.log("hie")
            flag =true;
        }
    }
    if(!flag){
        basket.style.background = "rgb(194, 190, 190)";
        basket.style.color="black"
    }
}

function booklist(){
    
}

let mainText = document.querySelectorAll('.content_container_best');

window.addEventListener('scroll',function(){
    let value = window.scrollY
    console.log("scrollY", value);

    if( value > 600 ){
        mainText[0].style.animation="disappear 1s ease-out forwards";
        mainText[1].style.animation="disappear 1s ease-out forwards";
        mainText[2].style.animation="disappear 1s ease-out forwards";
        console.log("이거진행중")
    }else{
        mainText[0].style.animation="slide 1s ease-out";
        mainText[1].style.animation="slide 1s ease-out";
        mainText[2].style.animation="slide 1s ease-out";
        // console.log("이건가?")
    }
});

