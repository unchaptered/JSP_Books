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
		
		udto.setUserEmail(req.getParameter("InfocheckEmail"));
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
