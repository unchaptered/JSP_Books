package app.book.dao;

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
	
	
	
}
