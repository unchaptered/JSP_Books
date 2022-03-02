//저자 : carpriceksy
//썸머노트
$(document).ready(function() {
		$('#eTextarea').summernote({
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

//첨부 파일 이름 나타내기
function showName(n){
    let files = document.getElementById("input-file"+n).files;
    fileList = "";
    fileList = files[0].name + '&nbsp;&nbsp;<input type="button" id="removeBtn" name="removeBtn" onclick="removeFile('+n+')" value="[X]">';
    target = document.getElementById("showFileName"+n);
    target.innerHTML = fileList;
}

//첨부파일 삭제
function removeFile(n){
	let showFileName = document.getElementById("showFileName"+n);
	let inputFile = document.getElementById("input-file"+n);
	let imgPreview = document.getElementById("imgPreview"+n);
	
	imgPreview.src = "";
	inputFile.value ="";
	
	if(n == 1){
		showFileName.innerHTML = "목록에 나타낼 이미지를 등록하세요";	
	}else if(n == 2){
		showFileName.innerHTML = "상세페이지에 나타낼 이미지를 등록하세요";
	}
	
}

//첨부 파일 이미지 미리보기
function setThumbnail(input,n){
    if(input.files && input.files[0]){
        const reader = new FileReader();

        reader.onload = function(e){
            document.getElementById("imgPreview"+n).src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }else{
        document.getElementById("imgPreview"+n).src = "";
    }
}

// 폼 제출
const confirmSave = function(){
    let check = confirm("저장하시겠습니까?")

    if(check){
        return true;
    }else{
        return false;
    }
}

// 폼 유효성 검사
function addEvent(){
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
    if(!confirmSave()){
    	return false;
    }   
    return true;
}
//폼 유효성 검사
function editEvent(){
    let frm = document.eventEditForm;

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
    if(!confirmSave()){
    	return false;
    }   
    return true;
}