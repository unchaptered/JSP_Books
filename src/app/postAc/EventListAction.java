package app.postAc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;
import app.post.dao.PostDTO;

public class EventListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDTO pdto = new PostDTO();
		EventDTO edto = new EventDTO();

		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		
		String temp = req.getParameter("eventPage");
		String keyword = req.getParameter("keyword");
		
		//현재 페이지(초기 화면이라면 1, 아니면 page값)
		int eventPage = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 15;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 15;
		
		//총 이벤트 수
		int eventTotalCnt = edao.getEventCnt();
		System.out.println(eventTotalCnt);
		System.out.println("asdfg");
		//시작 게시물
		int startRow = (eventPage-1)*pageSize;
		
		//한 화면에서 보여질 첫 페이지
		int startPage = ((eventPage-1)/pageCnt)*pageCnt+1;
		//한 화면에서 보여질 마지막 페이지
		int endPage = startPage+pageCnt-1;
		
		//총 이벤트 페이지 수
		int eventTotalPage = (eventTotalCnt-1)/pageSize+1;
		
		endPage = endPage>eventTotalPage ? eventTotalPage : endPage;
		
		List<EventDTO> eventList = edao.getEventList(startRow,pageSize,keyword);
		
		req.setAttribute("eventList", eventList);
		req.setAttribute("eventTotalPage", eventTotalPage);
		req.setAttribute("eventTotalCnt", eventTotalCnt);
		req.setAttribute("eventPage", eventPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("keyword", keyword);
		
//		List<PostDTO> postList = pdao.getPostList();
		
//		req.setAttribute("postList", postList);
//		String postTitle = pdao.getPostTitle(postPk);
		
//		req.setAttribute("postTitle", postTitle);
		
		//보내기
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/post/event_post/event_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
