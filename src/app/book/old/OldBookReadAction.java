package app.book.old;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;
import app.book.old.dao.OldBookDAO;
import app.book.old.dao.OldBookDTO;
import app.book.old.dao.OldBookInventory;

/**old_book_read.jsp 에서 사용하는 데이터를 받아오는 기능을 가지고 있습니다.<br>
 * <br>
 * 사용하는 데이터형은 다음과 같습니다.<br>
 * <br>
 * 1. 구매 대상 도서 // 1 개의 oldBookDTO 로 이루어진 header 영역<br>
 * 2. 같은 장르의 다른 도서 // 6 * 1 개의 oldBookDTO 로 이루어진 main.section 영역<br>
 * 3. 같은 작가의 다른 도서 // 6 * 1 개의 oldBookDTO 로 이루어진 main.section 영역<br>
 * 
 * @author unchaptered
 */
public class OldBookReadAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		OldBookDAO oldBookDAO = new OldBookDAO();
		
		// link > ${cp}/book/OldBookRead.ob?bookPk=${}&oldBookPk=${}
		// files > WebContent/app/book/old_book/old_book_read.jsp
		
		int limitValueRelatedByGenre = 6;
		int limitValueRelatedByWriter = 6;
		
		// 이 페이지에서는 2개의 queryString 이 필요하고, 이가 아닐 시 페이지를 ${cp}/book/OldBookList.ob 로 돌린다.
		int bookPk, oldBookPk = 0;
		try {
			String query[]=req.getQueryString().split("&");
			bookPk=Integer.parseInt(query[0].split("=")[1]);
			oldBookPk=Integer.parseInt(query[1].split("=")[1]);	
		} catch (Exception e) {
			System.out.println("OldBookReadAction, Query : " + e);
			
			ActionTo transfer = new ActionTo();
			transfer.setPath(req.getContextPath() + "/book/OldBookList.ob");
			transfer.setRedirect(true);
			return transfer;
		}
		
		// 정상적으로 2개의 queryString 을 받았다면, DB 에서 정보를 받아옵니다.
		OldBookDTO targetBook = oldBookDAO.getOldBookByBookPk(bookPk);
		req.setAttribute("targetBook", targetBook);
		
		List<OldBookDTO> targetInventory = oldBookDAO.getOldBookInventoryByBookPk(bookPk);
		req.setAttribute("targetInventory", targetInventory);

		List<OldBookDTO> oldBookListWithGenre
			= oldBookDAO.getOldBookListRelatedByGenre(
					limitValueRelatedByGenre, targetBook.getBookGenre());
		req.setAttribute("oldBookListWithGenre", oldBookListWithGenre);

		List<OldBookDTO> oldBookListWithWriter
			= oldBookDAO.getOldBookListRelatedByWriter(
					limitValueRelatedByWriter, targetBook.getBookWriter());
		req.setAttribute("oldBookListWithWriter", oldBookListWithWriter);
		
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/book/old_book/old_book_read.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
