package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserPwFindOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = req.getSession();
		
		
		String pwFindEmail = req.getParameter("pw_email_input_find");
		String pwFindPhone = req.getParameter("pw_phone_input_find");
		UserDTO findUserPw = udao.findPw(pwFindEmail,pwFindPhone);
		ActionTo transfer = new ActionTo();
		if(findUserPw != null) {
			session.setAttribute("findUserPw", findUserPw);
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/user/user_pw_show.jsp");
		}
		else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp?pw=f");
		}
		return transfer;
		
	}
}
