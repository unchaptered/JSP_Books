package app.shop.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;
import app.shop.dao.ProductDAO;
import app.shop.dao.ProductDTO;
import app.user.dao.UserDTO;

public class ShopBillListOkAction implements Action{
// 구매내역 페이지로 구매상품 리스트 전송처리
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ProductDAO pdao = new ProductDAO();
		HttpSession session = req.getSession();
		ActionTo transfer = new ActionTo();
		
		if(session.getAttribute("loginUser") != null) {// 세션이 null값일때 들어오면 nullPointException
			int userpk = ((UserDTO)session.getAttribute("loginUser")).getUserPk();
			List<ProductDTO> prodList = pdao.getProdList(userpk);
			req.setAttribute("prodList", prodList);
		}
		if(req.getParameter("periodValue")==null) {
			req.setAttribute("periodValue", "1개월");
		}else {
			req.setAttribute("periodValue", req.getParameter("periodValue"));
		}
		transfer.setPath("/app/shop/shop_bills.jsp");	// 구매내역으로 이동
		transfer.setRedirect(false);
		return transfer;
	}
}
