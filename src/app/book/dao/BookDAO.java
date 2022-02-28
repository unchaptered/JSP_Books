package app.book.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class BookDAO {
	SqlSession sqlsession;

	public BookDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	//새 책 등록
	public boolean insertNewBook(BookDTO bdto) {
		return 1 == sqlsession.insert("NewBook.insertNewBook", bdto);
	}

	public boolean updateBook(BookDTO bdto) {
		return 1 == sqlsession.update("NewBook.updateBook", bdto);
	}

	public List<BookDTO> getBook(String bookPk) {
		sqlsession.selectList("NewBook.getBookPk", bookPk);
		return null;
	}

	public void deleteByName(String bookImage) {
		sqlsession.delete("NewBook.deleteByName", bookImage);
	}

	public int getBookCnt() {
		return sqlsession.selectOne("book.getBookCnt");
	}
	public List<BookDTO> getBookList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<BookDTO> result = sqlsession.selectList("book.getBookList",datas);//getBookList는 쿼리문
		//여러개를 쓸거기 때문에 selectList를 씀
		//여러가지 정보를 가져와야하다 보니까 DTO가 필요함 -> 그래서 DTO생성
		//쿼리문은 매퍼에 쓰기로함
		return result;	
	}

	public List<BookDTO> getbookBest() {
		List<BookDTO> result = sqlsession.selectList("book.getBookBest");
		return result;
	}

	public BookDTO getDetail(int bookPk) {
		return sqlsession.selectOne("book.getDetail");
	}


	
}
