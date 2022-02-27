//썸머노트
$(document).ready(function() {
		$('#input-text').summernote({
			toolbar: [
				// [groupName, [list of button]]
				['fontname',['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert',['link']]
			],  
			height: 300,		  
			lang: "ko-KR",
			focus: true,
			placeholder: '내용을 입력하세요',
			disableResizeEditor: true,
			  
			fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});


// 첨부 파일 이름 나타내기
function showName(){
    let files = document.getElementById("input-file").files;
    fileList = "";
    for (let i = 0; i < files.length; i++) {
        fileList += files[i].name + '<br>';
    }
    target = document.getElementById("showFiles")
    target.innerHTML = fileList+'<a href="" id="removeBtn">X</a>';
}
//첨부파일 제거
//function removeFile(){
//	const showFiles = document.getElementById("showFiles");
//	const stageOrigin = document.getElementById("stageOrigin");
//	const stageSystem = document.getElementById("stageSystem");
//	
//	stageOrigin.removeAttribute("value");
//	stageSystem.removeAttribute("value");
//	
//	showFiles.innerHTML = "";
//}
// 폼 제출
const confirmUpdate = function(){
    let check = confirm("등록하시겠습니까?")

    if(check){
        alert("수정이 완료되었습니다")
        return true;
    }else{
        return false;
    }
    
}
// 폼 유효성 검사
function editNotice(){
    let frm = document.noticeEditForm;

    if (frm.postTitle.value == ""){
        alert("제목을 입력해주세요")
        frm.postTitle.focus()
        return false
    }
    if(frm.postText.value == ""){
        alert("내용을 입력해주세요")
        frm.postText.focus()
        return false;
    }
    if (!confirmUpdate()){
        return false;
    }
    return true;
}