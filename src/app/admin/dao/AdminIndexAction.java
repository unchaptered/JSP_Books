package app.admin.dao;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.ActionTo;

public class AdminIndexAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/admin/admin_index.jsp");
		transfer.setRedirect(false);
		return transfer;
		
	}
}
