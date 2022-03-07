//저자 : sunsetkk

function categoryChange(genre) {
	var genre_kor = ["소설", "시⦁에세이", "경제⦁경영", "자기계발", "사회⦁과학", "역사⦁문화", "인문", "자연과학", "기타"];
	var genre_forg= ["어린이", "문학", "경제인문", "컴퓨터", "기타"];
	var target = document.getElementById("genre");

	if(genre.value == "kor") var d = genre_kor;
	else if(genre.value == "forg") var d = genre_forg;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}

const img_submit = document.getElementById('imgSubmit');

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
    const container = document.getElementById("imgShow");
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


let rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
let rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
    
    let num01;
    let num02;
    num01 = obj.value;
    num02 = num01.replace(rgx1,"");
    num01 = setComma(num02);
    obj.value =  num01;
    
    let price = document.getElementById("price").value;
    let pr = parseInt(price.replace(/,/g,''));
    price = pr;
    console.log(price);
    
}

function setComma(inNum){
    
    let outNum;
    outNum = inNum; 
    while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
    }
    return outNum;
}



function focus_re(){
	const title = document.getElementById("title");
	location.reload();
//    title.focus();

}

function counter() {
	let textCnt = document.getElementById("textCnt");
	let textCnt2 = document.getElementById("textCnt2");
	let cnt = document.getElementById("counting");
	let cnt2 = document.getElementById("counting2");
	
    cnt.innerHTML = document.getElementById("info").value.length;
    cnt2.innerHTML = document.getElementById("infoShort").value.length;
    
    if(parseInt(cnt.innerText) == 700){
    	textCnt.style="color : red"
    }else{
    	textCnt.style="color : black"
    }
    if(parseInt(cnt2.innerText) == 1000){
    	textCnt2.style="color : red"
    }else{
    	textCnt2.style="color : black"
    }

}

function validate(){
	let img = document.getElementById("fileName");
	let country = document.getElementById("country");
	let genre = document.getElementById("genre");

	if(country.value == "opt"){
		alert("장르를 선택해주세요 !");
		country.focus();
		return false;
	}
	
	let price = document.getElementById("price").value;
    let pr = parseInt(price.replace(/,/g,''));
    price = pr;
    console.log(price);
    document.getElementById("price").value = price;
    
	return true;
}
