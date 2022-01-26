// 저자 : unchaptered

const menuBtn=document.querySelector(".nav_menu_btn");
const menuDetailsLists=document.querySelectorAll(".nav_menu_details");
const menu=document.getElementById("nav_menu");
const opaciter="nav_opaciter";
const displayer="nav_displayer";

let isVisible=false;
function modiVisible () {
    isVisible=!isVisible;
    menu.classList.toggle(opaciter);
    menu.classList.toggle(displayer);
    
    // 8번 줄에서 Visbile 이 true 로 변하면서 9번줄에 속성이 변경된다.
    // 이 때, 펼쳐져있는 친구를 다시 접어준다.
    if (isVisible===true) {
        menuDetailsLists.forEach(element=>element.open=false);
    }
}

menuBtn.addEventListener("click",modiVisible);