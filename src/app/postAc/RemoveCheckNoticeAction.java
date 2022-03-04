package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;

public class RemoveCheckNoticeAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		
		String noticePkp = req.getParameter("noticePk");
		String[] noticePkArr = noticePkp.split("-");

		int size = noticePkArr.length;
		for (int i = 0; i < size; i++) {
			NoticeDTO notice = ndao.getNoticeRead(Integer.parseInt(noticePkArr[i]));
			int postPk = notice.getPostPk();
			int noticeFile = notice.getNoticeFile();
			
			if(pdao.removePost(postPk)) {
				System.out.println("게시물 삭제 완료");
				if(fdao.getFile(noticeFile) != null) {
					if(fdao.removeFile(noticeFile)) {
						System.out.println("파일도 삭제");
					}
				}
			}
			
		}
		
		return null;
	}
}
