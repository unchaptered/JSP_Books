package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import action.ActionTo;
import app.shop.dao.CartDAO;
import app.shop.dao.CartDTO;
import app.user.dao.UserDTO;

public class CartListOkAction {

	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		
		CartDAO cdao = new CartDAO();
		HttpSession session = req.getSession();
		ActionTo transfer = new ActionTo();
		
		if(session.getAttribute("loginUser") != null) {// 세션이 null값일때 들어오면 nullPointException
			int userPk = ((UserDTO)session.getAttribute("loginUser")).getUserPk();
			List<CartDTO> cartList = cdao.getCartList(userPk);
			req.setAttribute("cartList", cartList);
			
		}
		transfer.setPath("/app/shop/shop_bags.jsp");
		transfer.setRedirect(false);
		return transfer;
	}

}
