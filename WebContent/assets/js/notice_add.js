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
    fileList = files[0].name + '&nbsp;&nbsp;<input type="button" id="removeBtn" name="removeBtn" onclick="removeFile()" value="[X]">';
    target = document.getElementById("showFiles");
    target.innerHTML = fileList;
}

//첨부파일 삭제
function removeFile(){
	let showFiles = document.getElementById("showFiles");
	let inputFile = document.getElementById("input-file");

	inputFile.value ="";
	
	showFiles.innerHTML = "";
}

// 폼 제출
const confirmEnroll = function(){
    let check = confirm("게시물을 등록하시겠습니까?")

    if(check){
        return true;
    }else{
        return false;
    }
    
}
// 폼 유효성 검사
function addNotice(){
    let frm = document.noticeAddForm;

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
    if (!confirmEnroll()){
        return false;
    }
    return true;
}
function editNotice(){
    let frm = document.noticeAddForm;

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
    if (!confirmEnroll()){
        return false;
    }
    return true;
}