<!-- 저자 : 김명현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베이스 - BOOKS</title>
<!-- 공용 css -->
<link rel="stylesheet" href="${cp }/assets/css/styles.css">
<!-- 페이지 별로 css 파일은 여기에 추가해주세요 -->
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/book_category.css">
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/page_basket.css">
<link rel="stylesheet"
	href="${cp }/assets/css/screens/new_book/book_read_explain.css">
<link rel="stylesheet"
	href="${cp }/assets/css/screnns/new_book/button.css">
</head>
<body>
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../../app/components/nav.jsp"%>
	<section class="category">
		<div class="category_part">
			<div class="kor">
				<ul class="kor_0">
					<a href="#">국내도서</a> 
				</ul>
				<ul class="ul_part1">
					<li><a href="${cp}/book/NewBookList.nb?keyword=${book.bookGenre}"  class="kor_1" id="cate" name="cate" value="소설">소설</li>
					<li><a href="#" class="kor_2">시/에세이</a></li>
					<li><a href="#" class="kor_3">경제경영</a></li>
				</ul>
				<ul class="ul_part2">
					<li><a href="#" class="kor_4">자기계발</a></li>
					<li><a href="#" class="kor_5">사회과학</a></li>
					<li><a href="#" class="kor_6">역사⦁문화</a></li>
				</ul>
				<ul class="ul_part3">
					<li><a href="#" class="kor_8">인문</a></li>
					<li><a href="#" class="kor_9">자연⦁과학</a></li>
				</ul>
			</div>
			<div class="forg">
				<ul class="forg_0">
					<a href="#" class="forg_0">외국도서</a>
				</ul>
				<ul class="ul_part1">
					<li><a href="#" class="forg_1">어린이</a></li>
					<li><a href="#" class="forg_2">문학</a></li>
					<li><a href="#" class="forg_5">경제 경영</a></li>
				</ul>
				<ul class="ul_part2">
					<li><a href="#" class="forg_7">컴퓨터</a></li>
					<li><a href="#" class="forg_8"> 기타 </a></li>
				</ul>
			</div>
		</div>
	</section>
	<div class="main_content book_explain">
		<section class="book">
			<div class="book_name">
				<h2>${book.bookTitle}-${book.bookSubtitle} : ${bookWriter} 장편소설</h2>
			</div>
		</section>
		<div class="book_explain_content">
			<div class="book_explain_photo">
				<img src="${cp }/media/${book.bookOrgImage}" alt=""style="width: 200px; height: 288px;">
			</div>
		</div>
		<div class="book_explain_writer">
				<div class=writer>
					<p>
						저자 :<a href="#">${book.bookWriter }</a> <span class="spacebar">|</span>출판사 :<a
							href="#">${book.bookPublisher}</a><span class="spacebar">|</span>발행 :${book.bookCreated }<span class="spacebar">|</span>쪽수 : ${book.bookPages }
					</p>
				</div>
				<div class="price">
				정가가격 <span class="price_part">${book.bookPrice }</span>
				</div>
			<div class="discount">
				할인혜택
				<button onclick="discount_view()">카드/간편결제
					할인&nbsp;&nbsp;&nbsp;></button>
				<span class="spacebar">|</span>
				<button onclick="discount_view2()">무이자
					할부&nbsp;&nbsp;&nbsp;></button>
			</div>
			<!-- 주문수량 시작 -->
			<div class="buy_num">
				<p>주문수량</p>
				<div class="buy_num_out">
					<input type='button' class="buy_num_plus" onclick='count("plus")'
						value='+' />
					<div id='result'>0</div>
					<input type='button' class="buy_num_minus" onclick='count("minus")'
						value='-' />남은수량 ${book.bookMount}
				</div>
			</div>
			<!-- 주문수량 끝 -->
			<div class="discount_info">
				<div class="popup" id="open">
					<div id="close">
						간편결제, 신용카드 청구할인 <a class="dis_btn" onclick="discount_view_close()"></a>
						<div class="card">
							<table>
								<tr class="card_part">
									<td class="td_left">인터파크 롯데카드</td>
									<td class="td_right"><span class="card_font">5%(11,970원)</span><br>
										(최대할인 10만원/전월실적40만원)</td>
									<td class="link"><a href="#">></a></td>
								</tr>
								<tr class="card_part">
									<td class="td_left">북피니언 롯데카드</td>
									<td class="td_right"><span class="card_font">30%(8,820원)</span><br>
										(최대할인 3만원 / 3만원 이상결제)</td>
									<td class="link"><a href="#">></a></td>
								</tr>
								<tr class="card_part">
									<td class="td_left">NH쇼핑 &인터파크카드</td>
									<td class="td_right"><span class="card_font">20%(10,080원)</span><br>
										(최대할인4만원 / 2만원 이상 결제)</td>
									<td class="link"><a href="#">></a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 팝업창시작 -->
			<div class="discount_info">
				<div class="popup2" id="open2">
					<div id="close">
						장바구니 무이자 할부 <a class="dis_btn" onclick="discount_view_close2()"></a>
						<div class="card">
							<table>
								<tr class="card_part">
									<td class="td_left">신한</td>
									<td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/BC 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">비씨</td>
									<td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/Non-BC 계열 제외)</td>
								</tr>
								<td class="link"></td>
								</tr>
								<tr class="card_part">
									<td class="td_left">국민</td>
									<td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/BC 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">삼성</td>
									<td class="td_right">2~6개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">현대</td>
									<td class="td_right">2~7개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">롯데</td>
									<td class="td_right">2~4개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/BC 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">NH</td>
									<td class="td_right">2~8개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/BC 계열 제외)</td>
								</tr>
								<tr class="card_part">
									<td class="td_left">하나SK</td>
									<td class="td_right">2~8개월(5만원↑)※5만원 이상 결제시
										(단,법인/체크/기업/선불카드/BC 계열 제외)</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 팝업창끝 -->


			<!-- 장바구니,바로구매,좋아요 버튼 시작 -->
			<button class="read_basket">
			<a href="javascript:addCart(2,2)">장바구니 추가</a>  
			</button>
			<button class="read_buy">
			<a href="javascript:directBuy(1,1)">바로구매</a>    <!-- 바로구매 테스트용 bookPk 1번, 1개-->
			</button>
			<button class="read_like" id="like_back" onclick="like()">
				♡<span id="like">0</span>
			</button>
			<!-- 장바구니,바로구매,좋아요 버튼 끝 -->
			<form>
			<button class="read_modify"><a href="${cp }/book/NewBookEdit.nb?bookPk=${book.bookPk}">수정하기</a></button>
			</form>
		</div>
	</div>
	
	<!-- 책내용 소개할 파트 -->
    <div class="main_content">
        <div class="readinfo first">
            <h3 style="border-bottom: 1.5px solid black;">이상품의 분류</h3>
            <p class="readinfo_part">
                홈 > ${book.bookCountry} > ${book.bookGenre}
            </p>
        </div>
        <div class="readinfo">
            <h3 style="border-bottom: 1.5px solid black;">책소개</h3>
            <p class="readinfo_part">
                ${book.bookInfo }
            </p>
        </div>
        <div class="readinfo">
            <h3 style="border-bottom: 1.5px solid black;">짧은 소개글</h3>
            <p class="readinfo_part">
                ${book.bookInfoShort }
            </p>
        </div>
    </div>
    <!-- 책내용 소개할 파트 끝-->
	
	
	<!-- 경로 수정하셔야 합니다. -->
	<%@ include file="../../../app/components/footer.jsp"%>
</body>
<!-- 경로 수정하셔야 합니다. -->
<script src="${cp }/assets/js/new_book/discount_view.js"></script>
<script type="text/javascript" src="${cp }/assets/js/nav_menu.js"></script>

<script>
function count(type)  {
    const resultElement = document.getElementById('result');
    let number = resultElement.innerText;
    if(type === 'plus') {
    	if(number >= ${book.bookMount}){
    		alert("최대 주문 수량입니다");
    	}
    	else{
    		number = parseInt(number) + 1;    		
    	}
    }else if(type === 'minus')  {
        if(number == '0'){
            return false;
        }
    number = parseInt(number) - 1;
    }
    resultElement.innerText = number;
}
</script>
<script type="text/javascript" src="${cp}/assets/js/shop_button.js"></script> 
</html>
