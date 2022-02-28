package app.shop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionTo;

public class ShopFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();		// ??????/user/UserJoin.us
		String contextPath = req.getContextPath();		// ??????
		String command = requestURI.substring(contextPath.length());//	/user/UserJoin.us
		ActionTo transfer = null;
		
		switch(command) {
//		장바구니 버튼 눌렀을때 처리. 로그인유저에 카트추가. 세션필요
		case "/shop/ShopAddCartOk.sh":
			try {
				transfer = new AddCartOkAciton().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AddCartOk"+e);
			}
			break;
//		장바구니 페이지로 이동합니다. 로그인유저의 카트리스트DB를 전달. 세션필요
		case "/shop/ShopBags.sh":
			try {
				transfer = new CartListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CartList : "+e);
			}
			break;
//		카트1개 삭제
		case "/shop/ShopRemoveCartOk.sh":
			try {
				transfer = new RemoveCartOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveCartOk : "+e);
			}
			break;
//		장바구니 주문하기 버튼 눌렀을때, 장바구니 페이지의 모든카트 변경된 수량 DB덮어쓰기.
		case "/shop/ShopUpdateCartOverwriteOk.sh":
			try {
				transfer = new UpdateCartOverwriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UpdateCartOverwrite : "+e);
			}
			break;
//		주문결제페이지로 이동합니다. 장바구니 체크된 카트들의 cartList를 생성후 넘김 
		case "/shop/ShopCartOk.sh":
			try {
				transfer = new ShopCartOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CartOk : "+e);
			}
			break;
//		상품결제처리. 성공시 구매내역 페이지로 이동합니다.
		case "/shop/ShopPaymentOk.sh":
			try {
				transfer = new ShopPaymentOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("PaymentOk : "+e);
			}
			break;
//		구매내역 페이지로 이동합니다. 로그인유저의 구매내역리스트DB를 전달. 세션필요
		case "/shop/ShopBills.sh":
			try {
				transfer = new ShopBillListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BillListOk : "+e);
			}
			break;
			
	}
		
		//전송 일괄처리(어디인지, 어떤 방식인지는 몰라도 그냥 transfer 객체에 담겨있는 정보대로 페이지를 이동시키는 코드)
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
			}
		}
	}
}

