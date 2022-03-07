package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class UserInfoPwChangeOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = req.getSession();
		Object findPwSession = (Object)session.getAttribute("findUserPw");
		session.setAttribute("findUserEmail",findPwSession);
		System.out.println(findPwSession);
		String idSession = (String)session.getAttribute("findUserEmail");
		System.out.println(idSession);
		udto.setUserEmail("idSession.userEmail");
		udto.setUserPassword(req.getParameter("info_newPw"));
		ActionTo transfer = new ActionTo();
		if(udao.infoPwChange(udto)) {
			transfer.setPath(req.getContextPath()+"/app/user/user_pw_show.jsp?ch=t");
			transfer.setRedirect(true);
		}else {
			transfer.setPath(req.getContextPath()+"/app/user/user_pw_show.jsp?ch=f");
			transfer.setRedirect(true);
		}
		return transfer;
	}
}
