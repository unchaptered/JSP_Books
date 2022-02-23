// <!-- 검색창 -->
function searchEvent() {
    const frm = document.eventForm
    if (frm.keyword.value == "" || frm.keyword.value == null) {
    	alert("검색어를 입력해주세요.")
        frm.keyword.focus()
        break;
    }
    else{
    	location.href = cp+"/app/post/EventList.po?keyword="+frm.keyword.value;
    }
}
