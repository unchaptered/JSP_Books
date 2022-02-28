package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserLoginOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		String email = req.getParameter("email");
		String loginPw = req.getParameter("loginPw");
		HttpSession session = req.getSession();
		
		UserDTO loginUser = udao.login(email,loginPw);
		ActionTo transfer = new ActionTo();
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			transfer.setRedirect(false);
			transfer.setPath("./index.jsp"); 
		}
		else {
			transfer.setRedirect(false);
			transfer.setPath("/base.jsp"); 
		}
		return transfer;
	}
}
