package app.shop.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.shop.dao.CartDAO;

public class UpdateCartOverwriteOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		int cartPk = Integer.parseInt(req.getParameter("cartPk"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		cdao.updateCartQuantityOverwrite(cartPk,quantity);
		return null;
	}

}
