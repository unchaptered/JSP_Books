package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.book.dao.BookDTO;
import app.shop.dao.CartDAO;

public class ShopPaymentOkAction implements Action{
//	주문결제 페이지의 DB처리
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		String[] products = req.getParameterValues("products");
		String[] qty = req.getParameterValues("quantity");
		ActionTo transfer = new ActionTo();
		
		if(products!=null) {
//		재고수량보다 많이 구매신청했는지 체크
			int index=0;
			int prodMount=0;
			for (String cartnum : products) {
				prodMount=Integer.parseInt(cdao.getProdMount(Integer.parseInt(cartnum)));
				if(Integer.parseInt(qty[index])>prodMount) {
					String errorMSG="오류 : 재고부족";
					// 재고부족. 에러메시지 쿠키나 세션에 등록
//					transfer.setPath("/shop/ShopBags.sh");
//					transfer.setRedirect(false);
//					return transfer;
				}
				index++;
			}
		}
		// bill,products테이블에 등록. cart테이블에서 구매카트삭제
		List<BookDTO> bookList = cdao.getBookList(products);	// 마이바티스 안에서 foreach 동적처리함.
		System.out.println(bookList.get(1).getBookPk());
		System.out.println(bookList.get(1).getBookImage());
		System.out.println(bookList.get(1).getBookMount());
		System.out.println(bookList.get(1).getBookPrice());
		System.out.println(bookList.get(1).getBookTitle());
		
		
		int productQuantity=1521345345;	// 한품목 수량
		String productTotalPrice=""+"";	// (한품목가격*수량)
		int bookPk=1234;	// 
		int billPk=1233;
		
		String billPayment=req.getParameter("payment");
		String billTotalPrice=""+"";	// 배송비가 포함된 모든 상품가격
		String billZipCode=req.getParameter("delivPostnum");
		String billAddr=req.getParameter("delivAddr")+" "+req.getParameter("delivAddrDetail");
		int userPk = 7;	// 테스트용 userpk
		
//		System.out.println("billPayment: "+billPayment);
		System.out.println("billTotalPrice: "+billTotalPrice);
//		System.out.println("billZipCode: "+billZipCode);
//		System.out.println("billAddr: "+billAddr);
//		System.out.println("userPk: "+userPk);
		
		
//		transfer.setPath("/shop/ShopBills.sh");
//		transfer.setRedirect(false);
//		return transfer;
		return null;
	}

}
