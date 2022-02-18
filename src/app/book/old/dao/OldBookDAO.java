package app.book.old.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;


public class OldBookDAO {
	SqlSession sqlSession;
	
	public OldBookDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}
	
	/** OldBookController 의 /book/OldBookAdd.ob
	 *  /app/book/old_book/old_book_add.jsp
	 */
	private boolean addOldBook(OldBookDAO oldBook) {
		return 1 == sqlSession.insert("OldBook.addOldBook", oldBook);
	}
	
	/** OldBookController 의 /book/OldBookRead.ob
	 *  /app/book/old_book/old_book_read.jsp
	 */
	private OldBookDTO getOneOldBookByOldBookPk(int oldBookPk) {
		return sqlSession.selectOne("OldBook.getOneOldBookByOldBookPk", oldBookPk);
	}
	
	/** OldBookController 의 /book/OldBookList.ob
	 *  /app/book/old_book/old_book_list.jsp
	 */
	private List<OldBookDTO> getAllOldBookByLimit(int limit) {
		List<OldBookDTO> oldBookList = null;
		
		oldBookList =  sqlSession.selectList("OldBook.getAllOldBookByLimit", limit);
		
		return oldBookList;
	}
}
