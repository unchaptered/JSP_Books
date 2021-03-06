package app.user.dao;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.Member;

import action.ActionTo;

import action.Action;

public class UserFrontController extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();		// ??????/user/UserJoin.us
		String contextPath = req.getContextPath();		// ??????
		String command = requestURI.substring(contextPath.length());//	/user/UserJoin.us
		ActionTo transfer = null;
		
		switch(command) {
		
		case "/user/UserJoinOk.us":
			try {
				transfer = new UserJoinOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserJoinOk :"+e);
			}
			break;
		case "/user/UserLoginCheckEmailOk.us":
			try {
				new UserLoginCheckEmailOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("LoginCheckEmailOk: "+e);
			}
			break;
		case "/user/UserJoinCheckEmailOk.us":
			try {
				new UserJoinCheckEmailOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("JoinCheckEmailOk :"+e);
			}
			break;
		case "/user/UserLoginOk.us":
			try {
				transfer = new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserLoginOk : "+e);
			}
			break;
		case "/user/UserLogoutOk.us":
			transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp");
			req.getSession().removeAttribute("loginUser");
			break;
		case "/user/UserIdFindOk.us":
			try {
				transfer = new UserIdFindOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserIdFindOk :"+e);
			}
			break;
		case "/user/terms.us":
			transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/book/terms.jsp");
			break;
		case "/user/UserInfo.us":
			transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/user/user_info.jsp");
			break;
		case "/user/UserPwFindOk.us":
			try {
				transfer = new UserPwFindOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserIdFindOk :"+e);
			}
			break;
		case "/user/UserPwChange.us":
			transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/user/user_pw_show.jsp");
			break;
		case "/user/UserInfoChange.us":
			try {
				transfer = new UserInfoChangeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserInfoChangeOk :"+e);
			}
			break;
		case "/user/UserInfoPwChange.us":
			try {
				transfer = new UserInfoPwChangeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserInfoPwChangeOk :"+e);
			}
			break;
		}
	
	
		
		
		
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
			}
		}
	}
	
}
