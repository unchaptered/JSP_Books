package app.postAc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;

//차순위 > 공지사항
public class NoticeListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		
		String temp = req.getParameter("noticePage");
		String keyword = req.getParameter("keyword");
//		int pinCnt = ndao.getPinCnt();
		//현재 페이지(초기 화면이라면 1, 아니면 page값)
		int noticePage = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 15;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
			
		
		//총 이벤트 수+검색
		int noticeTotalCnt = ndao.getNoticeCnt(keyword);

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
		
		// 작성자 이름 리스트로 가져오기
		List<String> ownerName = ndao.getOwnerName(startRow,pageSize,keyword);
		req.setAttribute("ownerName", ownerName);
		
		//파일 리스트로 가져오기

		
		
		//보내기
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/post/notice_post/notice_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
