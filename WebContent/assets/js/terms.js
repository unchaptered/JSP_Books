let termsOfUse = document.querySelectorAll(".termsOfUse")
let privacyPolicy = document.querySelectorAll(".privacyPolicy")
    function filter_click1(){
        termsOfUse.forEach(i => {
            i.classList.remove("on")
        });
        privacyPolicy.forEach(i => {
            i.classList.add("on")
        });
    }
    function filter_click2(){
        privacyPolicy.forEach(i => {
            i.classList.remove("on")
        });
        termsOfUse.forEach(i => {
            i.classList.add("on")
        });
    }

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