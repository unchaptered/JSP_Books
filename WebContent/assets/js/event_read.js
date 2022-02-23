function deleteCheck(){
    if(confirm("이벤트를 삭제하시겠습니까?")){
        alert("삭제가 완료되었습니다.")
        return true
    }
    return false
}
function updateCheck(){
    if(confirm("이벤트를 수정하시겠습니까?")){
        return true
    }
    return false
}

//좋아요 //아이디 당 한 번씩 //db에 값이 안들어감 수정 필요
const result = document.getElementById("likeResult");
const xhr = new XMLHttpRequest();
let flag = false;
function like(eventPk){
//	if(flag){
//		xhr.onreadystatechange = function(){
//			if(xhr.readyState == XMLHttpRequest.DONE){
//				if(xhr.status == 200){
//					result.innerHTML = Number(result.innerHTML)-1;
//				}
//			}
//		}
//		xhr.open("GET","${pageContext.request.contextPath}/app/post/EventLike.po?eventPk="+eventPk,true);
//		xhr.send();
//		
//		flag = false;
//	}
//	else{
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					result.innerHTML = Number(result.innerHTML)+1;
				}
			}
		}
		xhr.open("GET","${pageContext.request.contextPath}/app/post/EventLike.po?eventPk="+eventPk,true);
		xhr.send();
		
//		flag = true;
//	}
}
