package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.admin.dao.AdminDAO;
import app.admin.dao.AdminDTO;

public class AdminJoinOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		AdminDTO newAdmin = new AdminDTO();
		AdminDAO adao = new AdminDAO();
		newAdmin.setAdminid(req.getParameter("adminid"));
		newAdmin.setAdminname(req.getParameter("adminname"));
		newAdmin.setAdminpw(req.getParameter("adminpw")); 
		newAdmin.setAdminpw_re(req.getParameter("adminpw_re"));
		newAdmin.setAdminkey(req.getParameter("adminkey"));
		
		ActionTo transfer = new ActionTo();
		if(adao.join(newAdmin)) {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/admin/admin_login.jsp");
		}
		else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/admin/admin_login.jsp");
		}
		return transfer;
	}

	
}
