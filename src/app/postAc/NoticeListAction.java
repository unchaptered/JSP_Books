package app.postAc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;

//차순위 > 공지사항
public class NoticeListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		
		String temp = req.getParameter("noticePage");		// 공지사항 현재 페이지
		String keyword = req.getParameter("keyword");		// 검색 키워드
		
		int pinCnt = ndao.getPinCnt();						// 고정 공지사항 개수
		
		int noticePage = temp == null ? 1 : Integer.parseInt(temp);	//현재 페이지(초기 화면이라면 1, 아니면 page값)
		
		int pageSize = 15-pinCnt;							//한 페이지에 보여줄 게시글의 개수
		
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 10;
			
		int noticeTotalCnt = ndao.getNoticeCnt(keyword);	//총 이벤트 수+검색

		int startRow = (noticePage-1)*pageSize;				//시작 게시물 순서

		int startPage = ((noticePage-1)/pageCnt)*pageCnt+1;	//한 화면에서 보여질 첫 페이지
		
		int endPage = startPage+pageCnt-1;					//한 화면에서 보여질 마지막 페이지
		
		int noticeTotalPage = (noticeTotalCnt-pinCnt-1)/pageSize+1;//총 공지사항 페이지 수

		endPage = endPage>noticeTotalPage ? noticeTotalPage : endPage;
				
		List<NoticeDTO> noticePinList = ndao.getNoticePinList(pinCnt);	//공지사항 리스트(고정o)
		List<NoticeDTO> noticeList = ndao.getNoticeList(startRow,pageSize,keyword);	//공지사항 리스트(고정x)
		
		req.setAttribute("noticePinList", noticePinList);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("noticeTotalPage", noticeTotalPage);
		req.setAttribute("noticeTotalCnt", noticeTotalCnt);
		req.setAttribute("noticePage", noticePage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("keyword", keyword);
		
		
		List<String> ownerNamePin = ndao.getOwnerNamePin(pinCnt);
		req.setAttribute("ownerNamePin", ownerNamePin);
		
		List<String> ownerName = ndao.getOwnerName(startRow,pageSize,keyword);	// 작성자 이름 리스트로 가져오기
		req.setAttribute("ownerName", ownerName);
		
		
		//보내기
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/post/notice_post/notice_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
