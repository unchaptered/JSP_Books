package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;

public class RemoveCheckNoticeAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		
		String[] valueArr = req.getParameterValues("valueArr");
		int size = valueArr.length;
		for (int i = 0; i < size; i++) {
			ndao.removeNotice(Integer.parseInt(valueArr[i]));
			
			NoticeDTO notice = ndao.getNoticeRead(Integer.parseInt(valueArr[i]));
			if(fdao.getFile(notice.getNoticeFile()) != null) {
				if(fdao.removeFile(notice.getNoticeFile())) {
					
				}
			}
		}
		
		return null;
	}
}
