package app.shop.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.shop.dao.CartDAO;

public class RemoveCartOkAction implements Action{
//int 카트번호를 넘겨 카트삭제
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		int cartnum = Integer.parseInt(req.getParameter("cartnum"));
		cdao.delCart(cartnum);
		return null;
	}

}
