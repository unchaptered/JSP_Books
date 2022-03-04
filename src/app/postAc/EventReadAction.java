package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.PostDAO;
import app.user.dao.UserDTO;
//files 처리, EventLike 처리 필요
public class EventReadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FileDAO fdao = new FileDAO();
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));

		EventDTO event = edao.getEventRead(eventPk);
		int postPk = event.getPostPk();

		req.setAttribute("event", event);
		
		//좋아요 상태
		HttpSession session = req.getSession();
		
		UserDTO user = (UserDTO)session.getAttribute("loginUser");

		if(user != null) {
			int userPk = ((UserDTO)session.getAttribute("loginUser")).getUserPk();

			String aleadyLiked="";
			if(edao.getLikeStatus(userPk, eventPk).isEmpty()) {
				aleadyLiked = "N";
			}
			else {
				aleadyLiked = "Y";
			}
			req.setAttribute("aleadyLiked", aleadyLiked);
			System.out.println("aleadyLiked" + aleadyLiked);
			
		}
		
		
		//조회수
		pdao.updateViewed(postPk);
		event.setPostViewed(event.getPostViewed()+1);
		
		//첨부파일 세팅
		int eventFileDetail = event.getEventFileDetail();
		if(eventFileDetail != 0) {
			FileDTO file = fdao.getFile(eventFileDetail);
			req.setAttribute("file", file);		
		}
		
		//파일 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/event_post/event_read.jsp");
		return transfer;
	}
}
