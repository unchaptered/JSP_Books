package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;

public class NoticeReadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		int noticePk = Integer.parseInt(req.getParameter("noticePk"));
		
		NoticeDTO notice = ndao.getNoticeRead(noticePk);
		int postPk = notice.getPostPk();
		
		//조회수
		pdao.updateViewed(postPk);
		
		//첨부파일 세팅
		FileDAO fdao = new FileDAO();
		req.setAttribute("files", fdao.getFiles(postPk));		
				
		req.setAttribute("notice", notice);
		
		//파일 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/notice_post/notice_read.jsp");
		return transfer;
	}
}
