// <!-- 검색창 -->
function searchNotice() {
    let keyword = document.getElementById("n_search");
       if (keyword.value == " ") {
           alert("검색어를 입력해주세요.")
           keyword.focus()
           break;
       }
    location.href = cp+"/app/post/NoticeList.po?keyword="+keyword.value;
}