package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;

public class NoticeEditAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		
		int noticePk = Integer.parseInt(req.getParameter("noticePk"));
		NoticeDTO notice = ndao.getNoticeRead(noticePk);
		int postFilePk = notice.getNoticeFile();

		FileDTO file = fdao.getFile(postFilePk);
		
		req.setAttribute("notice", notice);
		req.setAttribute("file", file);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/post/notice_post/notice_edit.jsp");
		return transfer;
	}
}
