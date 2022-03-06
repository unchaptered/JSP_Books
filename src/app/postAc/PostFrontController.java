//저자 : carpriceksy
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
		
		switch(command) {
		case "/post/EventList.po":
			try {
				transfer = new EventListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventList : "+e);
			}
			break;
		case "/post/EventAdd.po":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/post/event_post/event_add.jsp");
			break;
		case "/post/EventAddOk.po":
			try {
				transfer = new EventAddOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventAddOk : "+e);
			}
			break;
		case "/post/EventRead.po":
			try {
				transfer = new EventReadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventRead : "+e);
			}
			break;
		case "/post/EventLike.po":
			try {
				new EventLikeAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventLike : "+e);
			}
			break;
		case "/post/EventEdit.po":
			try {
				transfer = new EventEditAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventEdit : "+e);
			}
			break;
		case "/post/EventEditOk.po":
			try {
				transfer = new EventEditOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventEditOk : "+e);
			}
			break;
		case "/post/EventRemove.po":
			try {
				transfer = new EventRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EventRemoveOk : "+e);
			}
			break;
		case "/post/RemoveCheckEvent.po":
			try {
				new RemoveCheckEventAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveCheckEvent : "+e);
			}
			break;
			
		case "/post/NoticeList.po":
			try {
				transfer = new NoticeListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeList : "+e);
			}
			break;
		case "/post/NoticeAdd.po":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/post/notice_post/notice_add.jsp");
			break;
		case "/post/NoticeAddOk.po":
			try {
				transfer = new NoticeAddOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeAddOk : "+e);
			}
			break;
		case "/post/NoticeRead.po":
			try {
				transfer = new NoticeReadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeRead : "+e);
			}
			break;
		case "/post/NoticeEdit.po":
			try {
				transfer = new NoticeEditAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeEdit : "+e);
			}
			break;
		case "/post/NoticeEditOk.po":
			try {
				transfer = new NoticeEditOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeEditOk : "+e);
			}
			break;
		case "/post/NoticeRemove.po":
			try {
				transfer = new NoticeRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeRemove : "+e);
			}
			break;
		case "/post/FileDownload.po":
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload : "+e);
			}
			break;
		case "/post/RemoveNoticeFile.po":
			try {
				new RemoveNoticeFileAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveNoticeFile : "+e);
			}
			break;
		case "/post/RemoveEventFile.po":
			try {
				new RemoveEventFileAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveEventFile : "+e);
			}
			break;
		case "/post/RemoveEventFileDetail.po":
			try {
				new RemoveEventFileDetailAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveEventFileDetail : "+e);
			}
			break;
		case "/post/RemoveCheckNotice.po":
			try {
				new RemoveCheckNoticeAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("RemoveCheckNotice : "+e);
			}
			break;
			
			default : System.out.println("default로");
				System.out.println("requestURI : "+requestURI);
				System.out.println("contextPath : "+contextPath);
				System.out.println("command : "+command);
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

