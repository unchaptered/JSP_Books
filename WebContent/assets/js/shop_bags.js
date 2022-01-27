// 저자 : jungbc1

const book_ea_up = function(tag){
    // tag 현재 선택된 태그
    if(tag.parentNode.parentNode.nextElementSibling.nextElementSibling.innerHTML=="정상"){
        // tag.previousElementSibling.value 현재 태그의 이전요소노드의 값
        tag.previousElementSibling.value++
        // 주문금액 변경
        tag.parentNode.parentNode.nextElementSibling.innerHTML
        =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")*tag.previousElementSibling.value)
        .toLocaleString('ko-KR');
    }
    // 총주문금액변경
    total_change();
}
const book_ea_down = function(tag){
    tag.nextElementSibling.value==0 ? 0 : tag.nextElementSibling.value--;
    // 주문금액 변경
    tag.parentNode.parentNode.nextElementSibling.innerHTML
    =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")
    *tag.nextElementSibling.value+"")
    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    // 총주문금액변경
    total_change();
}

const remove_cart = function(){
    let arCheckbox = document.querySelectorAll("#cart_table tr td:nth-child(1) input[type=\"checkbox\"]");
    for (const sums of arCheckbox) {
        if(sums.checked){
            // 선택된 장바구니 삭제. 자식노드이하
            sums.parentNode.parentNode.parentNode.removeChild(sums.parentNode.parentNode)
        }
    }
    // 총주문금액변경
    total_change();
}
const toggle_box = function(){
    // 총주문금액변경
    total_change();
}
const check_all = function(tag){
    let arCheckbox = document.querySelectorAll("#cart_table tr td:nth-child(1) input[type=\"checkbox\"]");
    for (const sums of arCheckbox) {
        // 전체선택하기가 체크되었으면
        if (tag.checked){
            sums.checked=true;
        }else{
            sums.checked=false;
        }
    }
    // 총주문금액변경
    total_change();
}

const enterkey = function(tag){
    if(event.keyCode==13){
        // 주문금액 변경
        if(tag.parentNode.parentNode.nextElementSibling.nextElementSibling.innerHTML=="정상"){
            tag.parentNode.parentNode.nextElementSibling.innerHTML
            =(tag.parentNode.parentNode.previousElementSibling.innerHTML.replaceAll(",","")
            *tag.value+"")
            .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            // 총주문금액변경
            total_change();
        }else{
            tag.value=0;
        }
        // unfocus
        tag.blur();
    }
}

// input콘트롤 엔터 입력 시 submit 막기, 연속키눌림 off
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
    event.preventDefault();
    };
}, true);

// 총주문금액변경
const total_change = function(){
    let order_sum = document.getElementById("order_sum");
    let arSum = document.querySelectorAll("#cart_table tr td:nth-child(6)");
    let total = 0;
    for (const sums of arSum) {
        if(sums.parentNode.firstElementChild.firstElementChild.checked==true){
            total += sums.innerHTML.replaceAll(",","")*1;
        }
    }
    order_sum.innerHTML = total.toLocaleString('ko-KR');
}

