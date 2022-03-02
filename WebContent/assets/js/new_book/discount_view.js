// 저자 : 김명현 
// let opendis = document.getElementById('close');
function discount_view(){
    let opendis = document.getElementById('open');
    let opendis2 = document.getElementById('open2');
    opendis.style.visibility="inherit";
    if(opendis2.style.visibility == "inherit"){
        discount_view_close2();
    }
}

function discount_view_close(){
    let opendis = document.getElementById('open');
    opendis.style.visibility="hidden";
}

function discount_view2(){
    let opendis = document.getElementById('open');
    let opendis2 = document.getElementById('open2');
    opendis2.style.visibility="inherit";
    if(opendis.style.visibility == "inherit"){
        discount_view_close();
    }
}

function discount_view_close2(){
    let opendis = document.getElementById('open2');
    opendis.style.visibility="hidden";
}


function like(){
    let like = document.getElementById('like')
    let backcolor = document.getElementById('like_back')
    let num = like.innerText;
    if(true){
        if(backcolor.style.background =="lightpink"){
            num = parseInt(num)-1;
            like.innerHTML = num;
            backcolor.style.background="white"
            backcolor.style.border="0.5px solid rgb(122, 122, 122)"
            return false;
        }else{
            num = parseInt(num) +1;
            like.innerHTML = num;
            backcolor.style.background="lightpink"
            backcolor.style.border="none"
            return false;
        }
    }
}
