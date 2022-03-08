// 저자 : unchaptered

// 컨테이너
const headerContainer=document.querySelector(".header_content");
// 슬라이드 버튼 부모
const headerLeft=document.querySelector(".haeder_content-left");
const headerRight=document.querySelector(".haeder_content-right");
// 슬라이드 버튼
const headerLeftBtn=headerLeft.querySelector("svg");
const headerRightBtn=headerRight.querySelector("svg");

// 클래스
const headerContentClasses=[
    "header_content_center",
    "header_content_center_img",
    "header_content_center_datas",
    "header_title","header_infos","header_infos_short",
    "header_meta"
];
let isMovingOfContent=false;

const headerContents=headerContainer.querySelectorAll(`.${headerContentClasses[0]}`);
/**
 * 구조는 다음과 같다
 * div.headerContentClasses[0]
 *    div.headerContentClasses[1]
 *       img
 *    div.headerContentClasses[2]
 *       h3.headerContentClasses[3]
 *       h5.headerContentClasses[4]
 *       h5..headerContentClasses[5]
 *       div
 *          h5.headerContentClasses[6]
 *          h5.headerContentClasses[6]
 * 추가로 key 값을 기준으로 z-index 를 1부터~10 이하로 줘야 한다.
 */

function swapHeaderContent() {
    // z-index 는 1부터 headerContents.length 값만큼 하나씩 늘어난다.
    // z-index 와 headerContents.length 가 다르면, z-index 를 하나씩 늘리고
    // 같으면, z-index 를 1로 바꾼다.
    const length=headerContents.length;
    
    let zIndexes=0;
    headerContents.forEach((value)=>{
        zIndexes=+value.style.zIndex;
        console.log(zIndexes);

        value.style.zIndex=(zIndexes!==length) ? zIndexes+1 : 1;
    });

    isMovingOfContent=true;
    console.log(isMovingOfContent);
    // 무한회귀가 도네
    // setInterval(()=>{
    //     isMovingOfContent=false;
    //     console.log(isMovingOfContent);
    //     clearInterval();
    //     return;
    // }, 1000);
}

function swapReverseHeaderContent() {
    // z-index 는 1부터 headerContents.length 값만큼 하나씩 늘어난다.
    // z-index 와 1(최소값) 과 다르면, z-index 를 하나씩 줄이고
    // 같으면, z-index 를 headerContents.length 로 바꾼다.

    const length=headerContents.length;

    let headerContent=null;
    let zIndexes=0;
    for (let index=length-1; index>=0; index--) {
        headerContent=headerContents[index];

        zIndexes=headerContent.style.zIndex;

        headerContent.style.zIndex=(zIndexes>1) ? zIndexes-1 : length;
    }
}

headerLeftBtn.addEventListener("click",swapReverseHeaderContent);
headerRightBtn.addEventListener("click",swapHeaderContent);
window.addEventListener("keydown", (event)=>{
    const timeout=1000;
    if (event.key==="ArrowRight") {
        swapHeaderContent();
    } else if(event.key==="ArrowLeft") {
        swapReverseHeaderContent();
    }
});