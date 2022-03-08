//저자 : unchaptered

const oldBookCountContainer = document.querySelector(".old_book_count");

const oldBookCount = oldBookCountContainer.querySelector(".count");
const oldBookCountMinus = oldBookCountContainer.querySelector(".count_minus");
const oldBookCountPlus = oldBookCountContainer.querySelector(".count_plus");

function countMinus() {
	if (oldBookCount.textContent > 0) {
	    oldBookCount.textContent = +oldBookCount.textContent - 1;
	} else {
        alert(`0 이하는 선택할 수 없습니다.`);
    }
}
function counstPlus() {
    if (oldBookCount.textContent < +oldBookCount.dataset.maxValue) {
        oldBookCount.textContent = +oldBookCount.textContent + 1;
    } else {
        alert(`주문 가능한 최대 재고 ${oldBookCount.dataset.maxValue} 에 도달했습니다!`);
    }
}

oldBookCountMinus.addEventListener("click", countMinus);
oldBookCountPlus.addEventListener("click", counstPlus);