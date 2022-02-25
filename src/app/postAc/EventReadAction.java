package app.postAc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.PostDAO;
//files 처리, EventLike 처리 필요
public class EventReadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));

		EventDTO event = edao.getEventRead(eventPk);
		int postPk = event.getPostPk();
	
		//조회수
		pdao.updateViewed(postPk);
		event.setPostViewed(event.getPostViewed()+1);
		
		//첨부파일 세팅
		FileDAO fdao = new FileDAO();
		req.setAttribute("files", fdao.getFile(postPk));		
		
		req.setAttribute("event", event);
				
		//파일 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/event_post/event_read.jsp");
		return transfer;
	}
}
