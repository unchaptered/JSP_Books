package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.FileDAO;

public class RemoveEventFileDetailAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FileDAO fdao = new FileDAO();
		EventDAO edao = new EventDAO();
		
		int eventFileDetail = Integer.parseInt(req.getParameter("postFilePk"));
		
		if(edao.removeEventFileDetail(eventFileDetail)) {
			if(fdao.removeFile(eventFileDetail)) {
				
			}
		}
		
		return null;
	}
}
