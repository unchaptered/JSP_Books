function deleteCheck(){
    if(confirm("공지를 삭제하시겠습니까?")){
        alert("삭제가 완료되었습니다.")
        return true
    }
    return false
}
function updateCheck(){
    if(confirm("공지를 수정하시겠습니까?")){
        return true
    }
    return false
}
