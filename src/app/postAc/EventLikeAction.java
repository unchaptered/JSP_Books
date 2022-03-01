//저자 : carpriceksy
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
//		int userPk = Integer.parseInt(req.getParameter("userPk"));
		int userPk = 2;
		
		//유저의 좋아요 누른 상태 if검사(check)
//		if(안 누른 상태) {
//			edao.updateEventLike(eventPk,구분컬럼); //좋아요+1
			//유저가 좋아요 했는지 안했는지 구분할 컬럼에 좋아요 ok 넣기
			//if(user.insert(update)성공했다면){
				//통과
			//}
//		}
//		else{누른 상태
//			edao.updateEventLike(eventPk,구분컬럼); //좋아요-1 //sql문 내에서 if문으로 구분컬럼 검사
			//유저가 좋아요 했는지 안했는지 구분할 컬럼에 좋아요 x 넣기
			//if(user.insert(update)성공했다면){
				//통과
			//}
//		}		
		

		return null;
	}
}
