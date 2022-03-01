package app.book.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class NewBookReadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BookDAO bookdao = new BookDAO();
		HttpSession sessioin = req.getSession();


		int bookPk = Integer.parseInt(req.getParameter("bookPk"));
		System.out.println(bookPk);

//		
		BookDTO book = bookdao.getDetail(bookPk);
		System.out.println(book);
//
//
		req.setAttribute("book", book);
//		req.setAttribute("notice", notice);
//		int noticePk = Integer.parseInt(req.getParameter("noticePk"));
//		
//		NoticeDTO notice = ndao.getNoticeRead(noticePk);

		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/book/new_book/new_book_read.jsp");
		return transfer;
	}	
}
