package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;

public class AdminLoginOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		AdminDAO adao = new AdminDAO();
		String adminid = req.getParameter("adminid");
		String adminpw = req.getParameter("adminpw");
		HttpSession session = req.getSession();
		
		AdminDTO loginAdmin = adao.login(adminid, adminpw);
		ActionTo transfer = new ActionTo();
		if(loginAdmin != null) {
			session.setAttribute("loginAdmin", loginAdmin);
			
		}
		else {
			transfer.setRedirect(false);
			transfer.setPath("/admin/AdminLogin.adm?login=f");
		}
		return transfer;
	}

	
}
