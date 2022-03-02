package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserIdFindOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = req.getSession();
		
		
		String emailFindName = req.getParameter("email_name_input_find");
		String emailFindPhone = req.getParameter("email_phone_input_find");
		UserDTO findUser = udao.findEmail(emailFindName,emailFindPhone);
		ActionTo transfer = new ActionTo();
		if(findUser != null) {
			session.setAttribute("findUser", findUser);
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp?email=t");
		}
		else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp?email=f");
		}
		return transfer;
		
	}
}
