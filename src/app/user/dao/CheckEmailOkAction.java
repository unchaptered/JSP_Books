package app.user.dao;

import java.io.PrintWriter;

import javax.accessibility.Accessible;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.user.dao.UserDAO;

import action.Action;
import action.ActionTo;

public class CheckEmailOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userEmail = req.getParameter("userEmail");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();
		if(udao.checkEmail(userEmail)) {
			out.write("O");
		}
		else {
			out.write("X");
		}
		out.close();
		return null;
	}
}
