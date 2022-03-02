package app.shop.servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;
import app.shop.dao.CartDAO;
import app.shop.dao.CartDTO;
import app.user.dao.UserDTO;


public class AddCartOkAciton implements Action{
	// 유저의 카트중 같음 품목이 있는지 체크하여 DB에 추가,업데이트하는 메소드
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CartDAO cdao = new CartDAO();
		CartDTO cdto = new CartDTO();
		HttpSession session = req.getSession();
		
//		jsp에서 쓰던 out.print()의 JAVA식	응답하기 위한 resp객체에서 getWriter()로 받아 out객체 생성. 
		PrintWriter out = resp.getWriter();
		if(session.getAttribute("loginUser") == null) {// 세션이 null값일때 들어오면 nullPointException
			out.write("X");	//Ajax용 이름없는 페이지 XHR.responseText로 날라감.
			out.close();	// out객체 해제
			return null;
		}
		
		int userPk = ((UserDTO)session.getAttribute("loginUser")).getUserPk();
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		cdto.setQuantity(quantity);
		cdto.setUserPk(userPk);
		cdto.setBookPk(Integer.parseInt(req.getParameter("bookPk")));
		
		
		Integer haveCart = cdao.checkCart(cdto); // selectOne by userPk&bookPk
		if(haveCart!=null) {
			// 동일품목의 카트가 있으면..
			cdao.updateCartQuantity(haveCart, quantity); // 동일품목카트에 추가수량만큼 증가
		}
		else {
			// 없으면.. 신규품목카트 추가
			cdao.addCart(cdto);
		}
		return null;
	}

}
