package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
//누르면 +1, 또 누르면 -1되게 수정 필요
public class EventLikeAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventDAO edao = new EventDAO();

		int eventPk = Integer.parseInt(req.getParameter("eventPk"));

		edao.updateEventLike(eventPk);

		return null;
	}
}
