package app.user.dao;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class UserJoinCheckEmailOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userEmail = req.getParameter("userEmail");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		if(udao.JoincheckEmail(userEmail)) {
			out.write("O");
		}else {
			out.write("X");
		}
		out.close();
		return null;
		
	}
}
