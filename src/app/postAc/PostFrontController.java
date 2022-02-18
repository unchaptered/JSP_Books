package app.postAc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionTo;

public class PostFrontController extends HttpServlet{
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
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();		
		String contextPath = req.getContextPath();		
		String command = requestURI.substring(contextPath.length());
		ActionTo transfer = null;
		
		System.out.println();
		
		switch(command) {
		case "/app/post/EventList.po":
			try {
				transfer = new EventListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventList : "+e);
			}
		case "/app/post/EventAdd.po":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/post/event_post/event_add.jsp");
			break;
		case "/app/post/EventAddOk.po":
			try {
				transfer = new EventAddOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventAdd : "+e);
			}
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

