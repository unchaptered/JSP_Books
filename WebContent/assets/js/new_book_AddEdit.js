// 저자 : sunsetkk
const img_submit = document.getElementById('img_submit');

let count = 1;
function loadFile(input) {
    const file = input.files[0];    //선택된 파일 가져오기

    //만들어 놓은 div에 파일이름 추가
    const name = document.getElementById('fileName');
    name.textContent = file.name;

    //새로운 이미지 div 추가
    const newImage = document.createElement('img');
    // newImage.setAttribute("class", 'img');
    newImage.className = `img img_no-${count}`;

    //이미지 source 가져오기
    newImage.src = URL.createObjectURL(file);
    newImage.style.width = "100%";
    newImage.style.height = "100%";
    newImage.style.objectFit = "contain";
    
    //이미지를 img_show div에 추가
    const container = document.getElementById('img_show');
    if(count !== 1){
        const old_img = document.querySelector(`.img_no-${count-1}`);
        old_img.remove();
        // old_img.style.display = 'none';
        console.log(old_img);
    }
    container.appendChild(newImage);
    newImage.style.visibility = "visible";
    count++;
}


//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
let rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
let rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
    
    let num01;
    let num02;
    num01 = obj.value;
    num02 = num01.replace(rgx1,"");
    num01 = setComma(num02);
    obj.value =  num01;
}

function setComma(inNum){
    
    let outNum;
    outNum = inNum; 
    while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
    }
    return outNum;
}

const price = document.getElementById('price');

function focus_re(){
    price.focus();
}