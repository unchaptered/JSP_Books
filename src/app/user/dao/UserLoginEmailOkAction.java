package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserLoginEmailOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		String userEmail = req.getParameter("userEmail");
		HttpSession session = req.getSession();
		
		UserDTO loginEmail = udao.loginEmail(userEmail);
		ActionTo transfer = new ActionTo();
		if(loginEmail != null) {
			session.setAttribute("loginEmail", loginEmail);
			transfer.setRedirect(false);
			transfer.setPath("/index.jsp");
		}else {
			transfer.setRedirect(false);
			transfer.setPath("/index.jsp?loginEmail=f");
		}
		return transfer;
	}
}
