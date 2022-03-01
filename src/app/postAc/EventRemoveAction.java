//저자 : carpriceksy
package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.FileDAO;
import app.post.dao.PostDAO;

public class EventRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {		
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		FileDAO fdao = new FileDAO();
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));
		
		EventDTO event = edao.getEventRead(eventPk);
		int postPk = event.getPostPk();
		
		int eventFile = event.getEventFile();
		int eventFileDetail = event.getEventFileDetail();
		
		boolean fcheck1 = false;
		if(eventFile == 0) {
			fcheck1 = true;
		}
		boolean fcheck2 = false;
		if(eventFileDetail == 0) {
			fcheck2 = true;
		}
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		if(!fcheck1) {
			fcheck1 = fdao.removeFile(eventFile);
		}
		if(!fcheck2) {
			fcheck2 = fdao.removeFile(eventFileDetail);
		}
		
		if(edao.removeEvent(eventPk)) {
			if(pdao.removePost(postPk)) {
				if(fcheck1 && fcheck2) {
					transfer.setPath(req.getContextPath()+"/app/post/EventList.po");
				}
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
		}
		return transfer;
	}
}
