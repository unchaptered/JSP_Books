package app.book.old;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.book.old.dao.OldBookDAO;
import app.user.dao.UserDAO;

public class OldBookAddFinishAction implements Action {
	
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		UserDAO userDAO = new UserDAO();
		OldBookDAO oldBookDAO = new OldBookDAO();
		
		int userPk, bookPk = 0;
		try {
			String query[]=req.getQueryString().split("&");
			userPk=Integer.parseInt(query[0].split("=")[1]);
			bookPk=Integer.parseInt(query[1].split("=")[1]);	
		} catch (Exception e) {
			System.out.println("OldBookReadAction, Query : " + e);
			
			ActionTo transfer = new ActionTo();
			transfer.setPath(req.getContextPath() + "/book/OldBookList.ob");
			transfer.setRedirect(true);
			return transfer;
		}
		
		int oldBookDiscount = 50;
		
		oldBookDAO.addOldBookByBookPkWithDiscountValue(userPk, bookPk, oldBookDiscount);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath(req.getContextPath() + "/book/OldBookList.ob");
		transfer.setRedirect(true);
		return transfer;
	}
}
