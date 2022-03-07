package app.admin.dao;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


import action.ActionTo;
import app.admin.dao.AdminJoinOkAction;

public class AdminFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionTo transfer = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		switch(command) {
		case "/admin/AdminIndex.adm":
			try {
				transfer = new AdminIndexAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminIndexAction : "+e);
			}
			break;
		
		
			
		case "/admin/AdminList.adm":
			transfer = new ActionTo();
			transfer.setPath("/app/admin/admin_index.jsp");
			transfer.setRedirect(false);
			break;
		
		case "/admin/AdminJoin.adm":
			transfer = new ActionTo();
			transfer.setPath("/app/admin/admin_login.jsp");
			transfer.setRedirect(false);
			break;
			
		
		case "/admin/AdminJoinOk.adm":
			
			try {
				transfer = new AdminJoinOkAction().execute(req,resp);
				
				
			} catch (Exception e) {
				System.out.println("AdminJoinOk : " +e);
			}
			break;
		
		case "/admin/CheckIdOk.adm":
			try {
				new CheckIdOkAction().execute(req,resp);
			
			
			} catch (Exception e) {
				System.out.println("AdminJoinOk : " +e);
			}
			break;
			
		case "/admin/AdminLoginOk.adm":
			try {
				transfer= new AdminLoginOkAction().execute(req,resp);
				transfer = new ActionTo();
				transfer.setPath("/app/admin/admin_index.jsp");
				transfer.setRedirect(false);
				
			} catch (Exception e) {
				System.out.println("AdminJoinOk : " +e);
			}
			break;
		case "/admin/chart1View.adm":
			try {
				transfer= new ChartShowOkAction().execute(req,resp);
				
			} catch (Exception e) {
				System.out.println("chart error : " +e);
			}
			break;
			
			
		}
		
		
		
		
		
		
		if(transfer!=null) {
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

