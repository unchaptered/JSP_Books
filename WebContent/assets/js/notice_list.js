// <!-- 검색창 -->

function sendit() {
    const frm = document.noticeForm
    if (frm.search.value == "") {
        alert("검색어를 입력해주세요.")
        frm.search.focus()
        return false
    }
    return true
}