//저자 : carpriceksy
package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.LikeDTO;
import app.user.dao.UserDAO;
import app.user.dao.UserDTO;
//누르면 +1, 또 누르면 -1되게 수정 필요
public class EventLikeAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventDAO edao = new EventDAO();
		HttpSession session = req.getSession();
		
		int eventPk = Integer.parseInt(req.getParameter("eventPk"));
		int userPk = ((UserDTO)session.getAttribute("loginUser")).getUserPk();
//		int userPk = 2;

		if(edao.getLikeStatus(userPk,eventPk).isEmpty()) {
			edao.upEventLike(eventPk);
			
			LikeDTO status = new LikeDTO();
			status.setEventLikePost(eventPk);
			status.setEventLikeUser(userPk);

			if(edao.insertLikeStatus(status)) {
				System.out.println("좋아요+1성공");
			}
		}
		else {			
			edao.downEventLike(eventPk);
			
			LikeDTO status = edao.getLikeStatus(userPk,eventPk).get(0);
			int eventLikePk = status.getEventLikePk();
			if(edao.removeLikeStatus(eventLikePk)) {
				System.out.println("좋아요-1성공");
			}
		}	
		
		return null;
	}
}
