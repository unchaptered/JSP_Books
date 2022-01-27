// 첨부 파일 이름 나타내기
window.onload = function () {
    target = document.querySelector("#input-file")
    target.addEventListener('change', function () {
        fileList = ""
        for (let i = 0; i < target.files.length; i++) {
            fileList += target.files[i].name + '<br>'
        }
        target2 = document.getElementById("showFileName")
        target2.innerHTML = fileList;
    })

}
// 첨부 파일 이미지 미리보기
function setThumbnail(input){
    if(input.files && input.files[0]){
        const reader = new FileReader();

        reader.onload = function(e){
            document.getElementById("imgPreview").src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }else{
        document.getElementById("imgPreview").src = "";
    }

}

// 폼 제출
const confirmSave = function(){
    let check = confirm("저장하시겠습니까?")

    if(check){
        alert("저장이 완료되었습니다.")
        return true;
    }else{
        return false;
    }
}

// 폼 유효성 검사
function sendit(){
    let frm = document.eventWriteForm;

    if(frm.title.value == ""){
        alert("이벤트 제목을 작성해주세요");
        frm.title.focus();
        return false;
    }
    if(frm.dateStart.value == ""){
        alert("이벤트 시작일을 등록해주세요")
        frm.dateStart.focus();
        return false;
    }
    if(frm.dateEnd.value == ""){
        alert("이벤트 종료일을 등록해주세요")
        frm.dateEnd.focus();
        return false;
    }
    if(frm.dateEnd.value <= frm.dateStart.value){
        alert("이벤트 종료일은 시작일보다 늦게 설정해야 합니다.")
        frm.dateEnd.focus();
        return false;
    }
    if(frm.inputFile.value == ""){
        alert("이벤트 배너 이미지를 등록해주세요")
        frm.inputFile.focus();
        return false;
    }
    if (!confirmSave()){
        return false;
    }
    return true;
}