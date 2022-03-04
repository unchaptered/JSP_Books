package app.book.dao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionTo;

public class NewBookFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req,resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requestURI = req.getRequestURI();		// ??????/user/UserJoin.us
		String contextPath = req.getContextPath();		// ??????
		String command = requestURI.substring(contextPath.length());//	/user/UserJoin.us
		ActionTo transfer = null;
		
		switch(command) {
		//새 책 등록
		case "/book/NewBookAddOk.nb":
			try {
				transfer = new NewBookAddOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewBookAddOk"+ e);
			}
			break;
			
		//새 책 수정
		case "/book/NewBookEditOk.nb":
			try {
				transfer = new NewBookEditOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewBookEditOk"+e);
			}
			break;
			
		case "/book/NewBookList.nb":
			try {
				transfer = new NewBookListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NewBookList : " + e);
			}
			break;
			
		case "/book/NewBookRead.nb":
			try {
				transfer = new NewBookReadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NewBookRead : " +e);
			}
			break; 
		
		case "/book/NewBookEdit.nb":
			System.out.println("New Book Edit");
			
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/book/new_book/new_book_edit.jsp");
			break;
		
		case "/book/NewBookAdd.nb":
			System.out.println("New Book Add");
			
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/book/new_book/new_book_add.jsp");
			break;


   
			
			
			
		}
		
		
		
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
