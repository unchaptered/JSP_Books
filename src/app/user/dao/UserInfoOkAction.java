package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserInfoOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = req.getSession();
		String a = (String)session.getAttribute("loginUser");
		System.out.println(a);
		
		return null;
	}
}
