package app.user.dao;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class CheckEmailOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		if(udao.checkEmail(email)) {
			out.write("O");
		}else {
			out.write("X");
		}
		out.close();
		return null;
		
	}
}
