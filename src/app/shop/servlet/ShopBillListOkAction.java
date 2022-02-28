package app.shop.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.shop.dao.BillDAO;

public class ShopBillListOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BillDAO bldao = new BillDAO();
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/shop/shop_bills.jsp");	// 구매내역으로 이동
		transfer.setRedirect(false);
		return transfer;
	}
}
