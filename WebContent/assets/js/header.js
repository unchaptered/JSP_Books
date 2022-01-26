// 저자 : unchaptered

const headerDatas=[
    {
        link: "./assets/img/cover__1.jpg",
        title: "인문학의 숲",
        infos_long: `"압도적인 완독률을 자랑하는 흡입력 만점 소설" <비밀의 계절>로 유명한 도나 타트가 11년 만에 선보인 신작 소설. 카렐 파브리티우스의 실제 그림을 소재로 한 이 책은 미술관 폭탄 테러에서 엄마를 잃고 홀로 살아남은 소년이 우연히 명화를 손에 넣게 되면서 시작한다. 예술 작품에 얽힌 기구한 운명을 풀어가는 과정에서 작가 특유의 화려한 문장과 세밀한 설정들을 확인할 수 있다. 평범한 인생에서 벗어나버린 소년이 자신의 삶을 되찾기 위해 싸우는 모습은 미술품이나 골동품을 다루는 작품 속 배경 속에서 이국적이고도 드라마틱하게 펼쳐지며, 예술 시장을 중심으로 사회 상류층과 이민자들의 세계가 나뉜 모습 등을 보면서 현재 세계의 씁쓸한 면모도 만날 수 있다.`,
        infos_short: `"압도적인 완독률을 자랑하는 흡입력 만점 소설"<비밀의 계절>로 유명한 도나 타트가 11년 만에 선보인 신작 소설. 카렐 파브리티우스의 실제 그림을 소재로 한 이 책은 미술관 폭탄 테러에서 엄마를 잃고 홀로 살아남은 소년이 우연히 명화를 손에 넣게 되면서 시작한다.`,
        meta: {
            writer: "김필순",
            published_date: "2022-01-17"
        }
    },
    {
        link: "./assets/img/cover__2.jpg",
        title: "빛을 두려워하는",
        infos_long: `오로지 자신만이 옳다고 믿는 사람들 뒤에서 미소 짓는 악마를 본다!《빅 픽처》 작가 더글라스 케네디 신작장편소설!`,
        infos_short: `오로지 자신만이 옳다고 믿는 사람들 뒤에서 미소 짓는 악마를 본다!《빅 픽처》 작가 더글라스 케네디 신작장편소설!`,
        meta: {
            writer: "더글라스 케네디",
            published_date: "2021-12-14"
        }
    },
    {
        link: "./assets/img/cover__3.jpg",
        title: "므레모사(현대문학 핀 시리즈 소설선 37)",
        infos_long: `당대 한국 문학의 가장 현대적이면서도 첨예한 작가들과 함께하는<현대문학 핀 시리즈> 소설선 서른여덟 번째 책 출간!`,
        infos_short: `당대 한국 문학의 가장 현대적이면서도 첨예한 작가들과 함께하는<현대문학 핀 시리즈> 소설선 서른여덟 번째 책 출간!`,
        meta: {
            writer: "김초엽",
            published_date: "2021-12-25"
        }
    },  
]
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

createHeaderContent(headerDatas);
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
function createHeaderContent(datas) {
    datas.forEach(({ link, title,infos_long:infosDetails, infos_short:infosShorts, meta:{ writer, published_date:publish} },key)=>{
        const headerContentCenter=document.createElement("div");
            headerContentCenter.className=headerContentClasses[0];

        const headerContentCenterImg=document.createElement("div");
            headerContentCenterImg.className=headerContentClasses[1];

        const headerContentCenterDatas=document.createElement("div");
            headerContentCenterDatas.className=headerContentClasses[2];

        const imgTag=document.createElement("img");
            imgTag.src=link;

        const titleTag=document.createElement("h3");
            titleTag.innerText=title+(key+1);
            titleTag.className=headerContentClasses[3];

        const infoDetailsTag=document.createElement("h5");
            infoDetailsTag.innerText=infosDetails;
            infoDetailsTag.className=headerContentClasses[4];

        const infoShortsTag=document.createElement("h5");
            infoShortsTag.innerText=infosShorts;
            infoShortsTag.className=`${headerContentClasses[4]} ${headerContentClasses[5]}`;

        const metaContainerTag=document.createElement("div");
        const metaAuthorTag=document.createElement("h5");
            metaAuthorTag.innerText="저자 | "+writer;
            metaAuthorTag.className=headerContentClasses[6];

        const metaPublishedTag=document.createElement("h5");
            metaPublishedTag.innerText="발행 | "+publish;
            metaPublishedTag.className=headerContentClasses[6];

        headerContentCenter.appendChild(headerContentCenterImg);
        headerContentCenter.appendChild(headerContentCenterDatas);
        headerContentCenterImg.appendChild(imgTag);
        headerContentCenterDatas.appendChild(titleTag);
        headerContentCenterDatas.appendChild(infoDetailsTag);
        headerContentCenterDatas.appendChild(infoShortsTag);
        headerContentCenterDatas.appendChild(metaContainerTag);
        metaContainerTag.appendChild(metaAuthorTag);
        metaContainerTag.appendChild(metaPublishedTag);

        // console.log(headerContentCenter);
        headerContentCenter.style.zIndex=datas.length-key;
        headerContainer.insertBefore(headerContentCenter, headerRight);
    })
}
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