//저자 : carpriceksy
package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.NoticeDAO;

public class RemoveNoticeFileAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FileDAO fdao = new FileDAO();
		NoticeDAO ndao = new NoticeDAO();
		
		int noticeFile = Integer.parseInt(req.getParameter("postFilePk"));
		
		if(ndao.removeNoticeFile(noticeFile)) {
			if(fdao.removeFile(noticeFile)) {
			}
		}
		return null;
	}
}
