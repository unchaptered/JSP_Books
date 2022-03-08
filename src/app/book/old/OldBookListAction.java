package app.book.old;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.book.dao.BookDTO;
import app.book.old.dao.OldBookDAO;
import app.book.old.dao.OldBookDTO;
import app.book.old.dao.OldBookSelledDAO;
import app.book.old.dao.OldBookSelledDTO;

/**old_book_list.jsp 에서 사용하는 데이터를 받아오는 기능을 가지고 있습니다.<br>
 * <br>
 * 사용하는 데이터형은 다음과 같습니다.<br>
 * <br>
 * 1. 최다 판매 도서 // 1 * 6 개의 oldBookDTO 로 이루어진 header 영역<br>
 * 2. 판매 가능 도서 // 6 * 3 개의 oldBookDTO 로 이루어진 main.section 영역<br>
 * 3. 구매 가능 도서 // 6 * 3 개의 oldBookSelledDTO 로 이루어진 main.section 영역<br>
 * 
 * @author unchaptered
 */
public class OldBookListAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		OldBookDAO oldBookDAO = new OldBookDAO();
		OldBookSelledDAO oldBookSelledDAO = new OldBookSelledDAO();
		
		// link > ${cp}/book/OldBookList.ob
		// files > WebContent/app/book/old_book/old_book_list.jsp
	
		int limitValueInHeader = 6;
		int limitValue = 18;
		
		List<OldBookSelledDTO> oldBookHotList = oldBookSelledDAO.getOldBookHotListByLimit(limitValueInHeader);
		req.setAttribute("oldBookHotList", oldBookHotList);
		
		List<OldBookDTO> oldBookList = oldBookDAO.getOldBookListByLimit(limitValue);
		req.setAttribute("oldBookList", oldBookList);
		
		List<OldBookDTO> oldBookStockList = oldBookDAO.getOldBookStockListByLimit(limitValue);
		req.setAttribute("oldBookStockList", oldBookStockList);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/book/old_book/old_book_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
