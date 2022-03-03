package app.admin.dao;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.admin.dao.AdminDAO;

public class CheckIdOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String adminid = req.getParameter("adminid");
		AdminDAO adao = new AdminDAO();
		PrintWriter out = resp.getWriter();
		if(adao.checkId(adminid)) {
			out.write("O");
		}
		else {
			out.write("X");
		}
		out.close();
		return null;
	}
}
