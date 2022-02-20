// 첨부 파일 이름 나타내기
//function showName(){
//    let files = document.getElementById("input-file").files;
//    fileList = "";
//    for (let i = 0; i < files.length; i++) {
//        fileList += files[i].name + '<br>';
//    }
//    target = document.getElementById("showFiles")
//    target.innerHTML = fileList;
//}
                        
// 첨부 파일 이미지 미리보기
function setThumbnail_list(input){
    if(input.files && input.files[0]){
        const reader = new FileReader();

        reader.onload = function(e){
            document.getElementById("imgPreview1").src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }else{
        document.getElementById("imgPreview1").src = "";
    }
}
function setThumbnail_read(input){
    if(input.files && input.files[0]){
        const reader = new FileReader();

        reader.onload = function(e){
            document.getElementById("imgPreview2").src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }else{
        document.getElementById("imgPreview2").src = "";
    }

}

// 폼 제출
//const confirmSave = function(){
//    let check = confirm("저장하시겠습니까?")
//
//    if(check){
//        alert("저장이 완료되었습니다.")
//        return true;
//    }else{
//        return false;
//    }
//}

// 폼 유효성 검사
function sendit(){
    let frm = document.eventAddForm;

    if(frm.postTitle.value == ""){
        alert("이벤트 제목을 작성해주세요");
        frm.postTitle.focus();
        return false;
    }
    if(frm.eventStarted.value == ""){
        alert("이벤트 시작일을 설정해주세요")
        frm.eventStarted.focus();
        return false;
    }
    if(frm.eventEnded.value == ""){
        alert("이벤트 종료일을 설정해주세요")
        frm.eventEnded.focus();
        return false;
    }
    if(frm.eventEnded.value <= frm.eventStarted.value){
        alert("이벤트 종료일은 시작일보다 늦게 설정해야 합니다.")
        frm.eventEnded.focus();
        return false;
    }
    if(frm.postText.value == ""){
    	alert("이벤트 내용을 작성해주세요")
        frm.postText.focus();
        return false;
    }
    
    return true;
}