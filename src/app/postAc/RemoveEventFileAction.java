package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.FileDAO;

public class RemoveEventFileAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FileDAO fdao = new FileDAO();
		EventDAO edao = new EventDAO();
		
		int eventFile = Integer.parseInt(req.getParameter("postFilePk"));
		
		if(edao.removeEventFile(eventFile)) {
			if(fdao.removeFile(eventFile)) {
				
			}
		}
		return null;
	}
}
