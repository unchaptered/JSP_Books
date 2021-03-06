package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.EventDTO;

public class EventEditAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventDAO edao = new EventDAO();
		FileDAO fdao = new FileDAO();
		
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));
		EventDTO event = edao.getEventRead(eventPk);
		int eventFilePk = event.getEventFile();
		int eventFileDetailPk = event.getEventFileDetail();
		
		FileDTO eventFile = fdao.getFile(eventFilePk);
		FileDTO eventFileDetail = fdao.getFile(eventFileDetailPk);
		
		req.setAttribute("event", event);
		req.setAttribute("eventFile", eventFile);
		req.setAttribute("eventFileDetail", eventFileDetail);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/event_post/event_edit.jsp");
		return transfer;
	}
}
