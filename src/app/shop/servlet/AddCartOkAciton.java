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
		resp.setCharacterEncoding("UTF-8"); 				// 응답에서 한글깨짐으로 out객체 사용전 셋팅
		resp.setContentType("text/html; charset=UTF-8");
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
		// 동일품목의 카트가 있으면..
		if(haveCart!=null) {
			if(req.getParameter("directBuy").equals("t")) {	// 바로구매버튼으로 넘어왔으면..
				cdao.updateCartQuantityOverwrite(haveCart, quantity); // 동일품목카트에 추가수량만큼 증가, 덮어쓰기
			}else {										// 장바구니버튼으로 넘어왔으면..
				cdao.updateCartQuantity(haveCart, quantity); // 동일품목카트에 추가수량만큼 증가, 기존수량에 더하기
			}
			out.write(haveCart+"");	// ajax 카트번호 응답
		}
		else {
			// 없으면.. 신규품목카트 추가
			cdao.addCart(cdto);
			out.write(cdto.getCartPk()+"");	// ajax 카트번호 응답
		}
		out.close();	// out객체 해제
		return null;
	}

}
