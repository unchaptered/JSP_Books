// 기간 버튼 선택변경
const select_period = function(tag){
    let periods = document.getElementsByClassName("on")
    for (const period of periods) {
        period.classList.remove("active");
    }
    tag.classList.add("active");
}