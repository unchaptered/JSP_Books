// 첨부 파일 이름 나타내기
// window.onload = function () {
//     target = document.querySelector("#input-file")
//     target.addEventListener('change',function(){
//         fileList = ""
//         for (let i = 0; i < target.files.length; i++) {
//             fileList+=target.files[i].name + '<br>'
//         }
//         target2 = document.getElementById("showFiles")
//         target2.innerHTML = fileList;
//     })
    
// }
function showName(){
    let files = document.getElementById("input-file").files;
    fileList = "";
    for (let i = 0; i < files.length; i++) {
        fileList += files[i].name + '<br>';
    }
    target = document.getElementById("showFiles")
    target.innerHTML = fileList;
}

// 게시물 등록, 취소 확인창
const confirmEnroll = function(){
    let check = confirm("게시물을 등록하시겠습니까?")

    if(check){
        alert("게시물이 등록되었습니다")
        return true;
    }else{
        // alert("게시물 등록이 취소되었습니다")
        return false;
    }
    
}
// 폼 체크
function sendit(){
    let frm = document.noticeWriteForm

    if (frm.title.value == ""){
        alert("제목을 입력해주세요")
        frm.title.focus()
        return false
    }
    if(frm.detail.value == ""){
        alert("내용을 입력해주세요")
        frm.detail.focus()
        return false;
    }
    if (!confirmEnroll()){
        return false;
    }
    return true;
}