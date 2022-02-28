package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;

public class NoticeReadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FileDAO fdao = new FileDAO();
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		int noticePk = Integer.parseInt(req.getParameter("noticePk"));
		
		NoticeDTO notice = ndao.getNoticeRead(noticePk);
		int postPk = notice.getPostPk();

		//작성자 이름
		String ownerName = pdao.getPostOwnerName(postPk);
		req.setAttribute("ownerName", ownerName);
		
		//조회수
		pdao.updateViewed(postPk);
		notice.setPostViewed(notice.getPostViewed()+1);

		//첨부파일 세팅
		int noticeFile = notice.getNoticeFile();
		FileDTO file = fdao.getFile(noticeFile);
		
		req.setAttribute("file", file);		
		req.setAttribute("notice", notice);

		//이전글,다음글
		Integer prevNoticePk = ndao.getPrevNotice(noticePk);
		Integer nextNoticePk = ndao.getNextNotice(noticePk);
		
		if(prevNoticePk != null) {
			String prevNoticeTitle = ndao.getNoticeRead(prevNoticePk).getPostTitle();
			
			req.setAttribute("prevNoticePk", prevNoticePk);
			req.setAttribute("prevNoticeTitle", prevNoticeTitle);
			
		}
		if(nextNoticePk != null) {
			String nextNoticeTitle = ndao.getNoticeRead(nextNoticePk).getPostTitle();
			
			req.setAttribute("nextNoticePk", nextNoticePk);
			req.setAttribute("nextNoticeTitle", nextNoticeTitle);
			
		}
		
		//파일 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/notice_post/notice_read.jsp");
		return transfer;
	}
}
