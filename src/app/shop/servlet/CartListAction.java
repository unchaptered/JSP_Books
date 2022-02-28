package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import action.ActionTo;
import app.shop.dao.CartDAO;
import app.shop.dao.CartDTO;
import app.user.dao.UserDTO;

public class CartListAction {

	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		
		CartDAO cdao = new CartDAO();
		HttpSession session = req.getSession();
		ActionTo transfer = new ActionTo();
		
//		if(session.getAttribute("loginEmail") != null) {// 세션이 null값일때 들어오면 nullPointException
//			int userpk = ((UserDTO)session.getAttribute("loginEmail")).getUserPk();
//			List<CartDTO> cartList = cdao.getCartList(userpk);
			List<CartDTO> cartList = cdao.getCartList(7);	// 테스트후 삭제
			req.setAttribute("cartList", cartList);
			
			transfer.setPath("/app/shop/shop_bags.jsp");
			transfer.setRedirect(false);
//		} else {	// 회원제. 비회원처리 구현할때는 카트들저장된 세션스토리지의 카트정보를 가져와서 cartList에 담는다.
//			transfer.setPath("/user/UserLoginEmailOk.us");
//			transfer.setRedirect(false);
//		}
		
		return transfer;
	}

}
