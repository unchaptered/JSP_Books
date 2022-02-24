package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.PostDAO;

public class EventRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));
		
		EventDTO event = edao.getEventRead(eventPk);
		int postPk = event.getPostPk();
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(edao.removeEvent(eventPk)) {
			if(pdao.removePost(postPk)) {
				transfer.setPath(req.getContextPath()+"/app/post/EventList.po");
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
		}
		return transfer;
	}
}
