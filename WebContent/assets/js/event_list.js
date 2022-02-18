// <!-- 검색창 -->
    function sendit() {
    	let e_search = document.getElementById('e_search');
        let frm = document.eventForm
        if (frm.e_search.value == "") {
            alert("검색어를 입력해주세요.")
            frm.search.focus()
            break;
        }
        location.href = cp+"/app/post/EventList.po?keyword="+e_search.value;
    }
