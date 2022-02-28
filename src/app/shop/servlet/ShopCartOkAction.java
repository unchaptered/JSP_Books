package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.shop.dao.CartDAO;
import app.shop.dao.CartDTO;

public class ShopCartOkAction implements Action{
//	장바구니 페이지에서 체크된 카트들의 cartnum들을 넘겨받고 DB를 통해 cartList를 생성,req에 담아서 주문결제페이지 이동셋팅 
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		String[] carts = req.getParameterValues("cartnum");
		
		if(carts!=null) {
			List<CartDTO> cartList = cdao.getCartList(carts);	// 마이바티스 안에서 foreach 동적처리함.
			req.setAttribute("cartList", cartList);
//			for (String cartnum : carts) {
//			cartList.add(cdao.getCartList(cartnum));
//			}
		}
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/shop/shop_payment.jsp");
		transfer.setRedirect(false);
		return transfer;
	}

}
