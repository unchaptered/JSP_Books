package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.book.dao.BookDTO;
import app.shop.dao.BillDAO;
import app.shop.dao.BillDTO;
import app.shop.dao.CartDAO;
import app.shop.dao.ProductDAO;
import app.shop.dao.ProductDTO;

public class ShopPaymentOkAction implements Action{
//	주문결제 페이지의 DB처리
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		BillDAO bldao = new BillDAO();
		ProductDAO pdao = new ProductDAO();
		String[] products = req.getParameterValues("products");
		String[] qty = req.getParameterValues("quantity");
		ActionTo transfer = new ActionTo();
		int index=0;
		
		List<BookDTO> bookList = cdao.getBookList(products);	// 마이바티스 안에서 foreach 동적처리함.
		//	재고수량보다 더 많이 구매신청했는지 체크
		if(bookList!=null) {
			int prodMount=0;
			index=0;
			for (BookDTO bdto : bookList) {
				prodMount = Integer.parseInt(bookList.get(index).getBookMount());
				if(Integer.parseInt(qty[index])>prodMount) {
					// 재고부족. 에러메시지는 이어지는 페이지에 담아 이동후 보여줌
					String errorMsg=String.format("상품 '%s'의 재고가 부족합니다.", bdto.getBookTitle());
					req.setAttribute("errorMsg", errorMsg);	// 다음페이지에 넘길정보 담음
					transfer.setPath("/shop/ShopBags.sh");	// 장바구니로 이동
					transfer.setRedirect(false);
					return transfer;
				}
				index++;
			}
		}
		
		// bill,products테이블에 등록. cart테이블에서 구매카트삭제
		int sum=0;	// 모든 상품가격
		int prodQty=0;
		index=0;
		for (BookDTO bdto : bookList) {
			prodQty=Integer.parseInt(qty[index]);	// 구매수량
			sum+=(prodQty)*(Integer.parseInt(bdto.getBookPrice().replaceAll(",", "")));
		}
//		sum=(int)(sum*0.9);	// 10% 할인. (100-10)/100
//		int delivCost = (sum<10000) ? 2000 : 0;	// 10,000원이상 배송비 무료. 기본배송료 2000원
		int delivCost = 0;
		
		// 주문결제페이지Shop.payment 폼 req데이터 -> billDTO
		String billPayment=req.getParameter("payment");
		String billTotalPrice=sum+delivCost+"";	// 배송비가 포함된 모든 상품가격
		String billZipCode=req.getParameter("delivPostnum");
		String billAddr=req.getParameter("delivAddr")+" "+req.getParameter("delivAddrDetail");
		int userPk = 7;	// 테스트용 userpk
		
		BillDTO billDTO = new BillDTO();
		billDTO.setBillPayment(billPayment);
		billDTO.setBillTotalPrice(billTotalPrice);
		billDTO.setBillZipCode(billZipCode);
		billDTO.setBillAddr(billAddr);
		billDTO.setUserPk(userPk);
		
		bldao.insertBill(billDTO);		// billDTO insert
		
		// productDTO에 저장될 데이터 셋팅
		int billPk=billDTO.getBillPk();	// insert후 오토인크리드된 주문번호billPk 가져옴
		
		index=0;
		prodQty=0;
		int bookPk=0;
		for (BookDTO bdto : bookList) {
			prodQty=Integer.parseInt(qty[index]);	// 구매수량
			bookPk=Integer.parseInt(bdto.getBookPk());
			String prodTotalPrice=prodQty*(Integer.parseInt(bdto.getBookPrice().replaceAll(",", "")))+""; // (수량*한품목가격)
			ProductDTO pdto = new ProductDTO();
			pdto.setBillPk(billPk);
			pdto.setProductQuantity(prodQty);
			pdto.setNewBookPk(bookPk);
			pdto.setProductTotalPrice(prodTotalPrice);
			// 주문상품에 추가되면 해당 카트 삭제, 재고수량 차감
			if(pdao.insertProduct(pdto)) {
				int cartPk = Integer.parseInt(products[index]);	//  : 카트번호
				cdao.delCart(cartPk);
				// 재고수량 업데이트
				pdao.updateBookMount(bookPk,prodQty);
			}
			index++;
		}
		// 주문성공
		transfer.setPath("/shop/ShopBills.sh");	// 구매내역으로 이동
		transfer.setRedirect(true);	// 중요한DB수정이 있었음. forward로 하면 주소가 변경되지 않아 새로고침시 DB수정이 반복됨.
		return transfer;
	}

}
