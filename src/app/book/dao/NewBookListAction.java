package app.book.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class NewBookListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//로그인해서 들어갔을때 보여줄 게시글 목록이 필요함
		//게시글을 담아줄 테이블이 필요함
		//boardnum은 인트지만 사이즈가 클꺼임 난 bookPk로 할꺼임
		//boardtitle는 booktitle로 할꺼임
		//boardcontents 
		BookDAO bookdao = new BookDAO();
		
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		//한 페이지에 보여줄 게시글의 개수
		int pageSize = 18;
		//페이징 처리시 보여줄 페이지의 개수
		int pageCnt = 6;
		
		int totalCnt = bookdao.getBookCnt();

		int startRow = (page-1)*pageSize;
		
		int startPage = ((page-1)/pageCnt)*pageCnt+1;
		int endPage = startPage+pageCnt-1;
		
		int totalPage = (totalCnt-1)/pageSize+1;
		
		endPage = endPage>totalPage ? totalPage : endPage;
		
		
		List<BookDTO> bookList = bookdao.getBookList(startRow,pageSize);//타입 애매할때는 int해놓고 체인지타입
		List<BookDTO> bookList2 = bookdao.getbookBest();
		
		req.setAttribute("bookList2", bookList2);//베스트 파트
		
		req.setAttribute("bookList", bookList);//리스트 파트
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		ActionTo transfer = new ActionTo();
//		System.out.println(bookList);
		transfer.setPath("/app/book/new_book/new_book_list.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
