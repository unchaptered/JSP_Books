package app.postAc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;

//중요 공지사항 고정 구현 필요함. NoticeListAction, post.xml 수정 필요. 차순위
public class NoticeListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		NoticeDTO notice = new NoticeDTO();
		NoticeDAO ndao = new NoticeDAO();
		
		String temp = req.getParameter("noticePage");
		String keyword = req.getParameter("keyword");
		
		//현재 페이지(초기 화면이라면 1, 아니면 page값)
		int noticePage = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 15;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
			
		
		//총 이벤트 수
		int noticeTotalCnt = ndao.getNoticeCnt();

		//시작 게시물 번호
		int startRow = (noticePage-1)*pageSize;

		//한 화면에서 보여질 첫 페이지
		int startPage = ((noticePage-1)/pageCnt)*pageCnt+1;
		//한 화면에서 보여질 마지막 페이지
		int endPage = startPage+pageCnt-1;
				
		//총 이벤트 페이지 수
		int noticeTotalPage = (noticeTotalCnt-1)/pageSize+1;
				
		endPage = endPage>noticeTotalPage ? noticeTotalPage : endPage;
				
		List<NoticeDTO> noticeList = ndao.getNoticeList(startRow,pageSize,keyword);
				
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("noticeTotalPage", noticeTotalPage);
		req.setAttribute("noticeTotalCnt", noticeTotalCnt);
		req.setAttribute("noticePage", noticePage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("keyword", keyword);
		
		// 작성자 이름 가져오기....
//		int[] postOwner = new int[noticeList.size()];
//		for (int i = 0; i < noticeList.size(); i++) {
//			postOwner[i] = noticeList.get(i).getPostOwner();
//		}
//		String ownerName = pdao.getOwnerName(postOwner);
//		req.setAttribute("ownerName", ownerName);
				
		//보내기
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/post/notice_post/notice_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
