// <!-- 이벤트 필터 구분 클릭 -->
    let benefit = document.querySelectorAll(".benefit")
    let category = document.querySelectorAll(".category")
    function filter_click1(){
        benefit.forEach(i => {
            i.classList.remove("on")
        });
        category.forEach(i => {
            i.classList.add("on")
        });
    }
    function filter_click2(){
        category.forEach(i => {
            i.classList.remove("on")
        });
        benefit.forEach(i => {
            i.classList.add("on")
        });
    }

// <!-- 필터 탭 메뉴 클릭 -->

    window.onload = function(){
        let menu = document.querySelectorAll(".menu")
        menu.forEach(i => {
            i.addEventListener('click',function(){menu_click(this)})
        });
    }

    let menu_click = function(e){
        let menu = document.querySelectorAll(".menu")

        menu.forEach(i => {
            i.classList.remove("on")
        });
        e.classList.add("on")                
    }

// <!-- 검색창 -->

    const eventForm = document.eventForm
    const search = eventForm.event_search

    function sendit() {
        const frm = document.eventForm
        if (frm.search.value == "") {
            alert("검색어를 입력해주세요.")
            frm.search.focus()
            return false
        }
        return true
    }
