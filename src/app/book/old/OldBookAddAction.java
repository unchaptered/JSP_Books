package app.book.old;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;
import app.book.old.dao.OldBookDAO;
import app.book.old.dao.OldBookDTO;
import app.user.dao.UserDAO;
import app.user.dao.UserDTO;

public class OldBookAddAction implements Action {
	
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		UserDAO userDAO = new UserDAO();
		OldBookDAO oldBookDAO = new OldBookDAO();
		
		// link > ${cp}/book/OldBookAdd.ob?bookPk=${}
		// files > WebContent/app/book/old_book/old_book_read.jsp

		int bookPk = 0;
		
		try {
			String query=req.getQueryString();
			bookPk=Integer.parseInt(query.split("=")[1]);	
		} catch (Exception e) {
			System.out.println("OldBookAddAction, Query : " + e);

			ActionTo transfer = new ActionTo();
			transfer.setPath(req.getContextPath() + "/book/OldBookList.ob");
			transfer.setRedirect(true);
			return transfer;
		}
		
		HttpSession httpSession = req.getSession();

		UserDTO userCookie = null;
		userCookie = (UserDTO) httpSession.getAttribute("loginUser");
		if (userCookie == null) {
			System.out.println("OldBookAddAction, Session : " + "미로그인 상태입니다.");
			
			ActionTo transfer = new ActionTo();
			transfer.setPath(req.getContextPath() + "/book/OldBookList.ob");
			transfer.setRedirect(true);
			return transfer;
		}
		
		int userPk = userCookie.getUserPk();
		
		UserDTO userDB = null;
		userDB = userDAO.getUserByUserPk(userPk);
		req.setAttribute("userDB", userDB);
		
		OldBookDTO targetBook = oldBookDAO.getOldBookByBookPk(bookPk);
		req.setAttribute("targetBook", targetBook);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/book/old_book/old_book_add.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
