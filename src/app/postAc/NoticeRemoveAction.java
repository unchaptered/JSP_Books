package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;

public class NoticeRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		int noticePk = Integer.parseInt(req.getParameter("noticePk"));
		
		NoticeDTO notice = ndao.getNoticeRead(noticePk);
		int postPk = notice.getPostPk();
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(ndao.removeNotice(noticePk)) {
			if(pdao.removePost(postPk)) {
				transfer.setPath(req.getContextPath()+"/app/post/NoticeList.po");
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?noticePk="+noticePk);
		}
		return transfer;
	}
}
