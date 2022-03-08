package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.FileDAO;
import app.post.dao.PostDAO;

public class RemoveCheckEventAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		FileDAO fdao = new FileDAO();
		
		String eventPkp = req.getParameter("eventPk");
		String[] eventPkArr = eventPkp.split("-");
		
		int size = eventPkArr.length;
		for (int i = 0; i < size; i++) {
			EventDTO event = edao.getEventRead(Integer.parseInt(eventPkArr[i]));
			int postPk = event.getPostPk();
			int eventFile = event.getEventFile();
			int eventFileDetail = event.getEventFileDetail();
			
			if(pdao.removePost(postPk)) {
				System.out.println("게시물 삭제 완료");
				if(fdao.getFile(eventFile) != null) {
					if(fdao.removeFile(eventFile)) {
						System.out.println("배너이미지 삭제");
					}
				}
				if(fdao.getFile(eventFileDetail) != null) {
					if(fdao.removeFile(eventFileDetail)) {
						System.out.println("상세이미지 삭제");
					}
				}
			}
			
		}
		
		return null;
	}
}
