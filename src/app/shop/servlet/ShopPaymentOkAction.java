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
		
		List<BookDTO> bookList = cdao.getBookList(products);	// 마이바티스 안에서 foreach 동적처리함.
		if(bookList!=null) {
//		재고수량보다 많이 구매신청했는지 체크
			int index=0;
			int prodMount=0;
			for (BookDTO bdto : bookList) {
				String BookTitle = bookList.get(index).getBookTitle();
				prodMount = Integer.parseInt(bookList.get(index).getBookMount());
				if(Integer.parseInt(qty[index])>prodMount) {
					// 재고부족. 에러메시지 쿠키나 세션에 등록
					String errorMSG=String.format("상품 '%s'의 재고가 부족합니다.", bookList.get(index).getBookTitle());
					transfer.setPath("/shop/ShopBags.sh");	// 장바구니로 이동
					transfer.setRedirect(false);
					return transfer;
				}
				index++;
			}
		}
		
		// bill,products테이블에 등록. cart테이블에서 구매카트삭제
		int sum=0;	// 모든 상품가격
		for (BookDTO bdto : bookList) {
			sum+=(Integer.parseInt(bdto.getBookMount()))*(Integer.parseInt(bdto.getBookPrice()));
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
		
		int index=0;
		for (BookDTO bdto : bookList) {
			int prodQty=Integer.parseInt(qty[index]);	// 구매수량
			int bookPk=Integer.parseInt(bdto.getBookPk());
			String prodTotalPrice=prodQty*(Integer.parseInt(bdto.getBookPrice()))+""; // (수량*한품목가격)
			ProductDTO pdto = new ProductDTO();
			pdto.setBillPk(billPk);
			pdto.setProductQuantity(prodQty);
			pdto.setNewBookPk(bookPk);
			pdto.setProductTotalPrice(prodTotalPrice);
			// 주문상품에 추가되면 해당 카트 삭제, 재고수량 차감
			if(pdao.insertProduct(pdto)) {
				int cartnum = Integer.parseInt(products[index]);	//  : 카트번호
				cdao.delCart(cartnum);
				// 재고수량 업데이트
				pdao.updateBookMount(bookPk,prodQty);
			}
			index++;
		}
		// 주문성공
		transfer.setPath("/shop/ShopBills.sh");	// 구매내역으로 이동
		transfer.setRedirect(false);
		return transfer;
	}

}
