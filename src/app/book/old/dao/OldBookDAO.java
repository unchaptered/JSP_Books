package app.book.old.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public boolean addOldBookByBookPkWithDiscountValue(int userPk, int bookPk, int oldBookDiscount) {
		HashMap<String, Object> sqlDatas = new HashMap<>();
		
		sqlDatas.put("userPk", userPk);
		sqlDatas.put("bookPk", bookPk);
		sqlDatas.put("oldBookDiscount", oldBookDiscount);
		
		return 1 == sqlSession.insert("OldBook.addOldBookByBookPkWithDiscountValue", sqlDatas);
	}
	
	public boolean addOldBookByBookPk(int userPk, int bookPk) {
		HashMap<String, Object> sqlDatas = new HashMap<>();
		
		sqlDatas.put("userPk", userPk);
		sqlDatas.put("bookPk", bookPk);
		
		return 1 == sqlSession.insert("OldBook.addOldBookByBookPkWithDiscountValue", sqlDatas);
	}

	/**	도서 조회 <br>
	 * 	<br>
	 * 	OldBookController 의 /book/OldBookRead.ob <br>
	 *  /app/book/old_book/old_book_read.jsp <br>
	 *  
	 *  @author unchaptered
	 *  @version 2022-03-08
	 *  
	 *  @param bookPk new_book.new_book_pk (PK)
	 *  @return OldBookDTO  
	 */
	public OldBookDTO getOldBookByBookPk(int bookPk) {
		OldBookDTO oldBookDTO = null;
		
		oldBookDTO = sqlSession.selectOne("OldBook.getOldBookByBookPk", bookPk);
		
		return oldBookDTO;
	}
	
	/** 도서 조회 후, 재고량 조회<br>
	 *  <br>
	 *  OldBookController 의 /book/OldBookRead.ob <br>
	 *  /app/book/old_book/old_book_read.jsp <br>
	 *  
	 * @author unchaptered
	 * @version 2022-03-08
	 * 
	 * @param bookPk new_book.new_book_pk
	 * @return OldBookInventoryDTO
	 */
	public List<OldBookDTO> getOldBookInventoryByBookPk(int bookPk) {
		List<OldBookDTO> oldBookList = OldBookInventory.getInstance();
		
		oldBookList = sqlSession.selectList("OldBook.getOldBookInventoryByBookPk", bookPk);
		
		return oldBookList;
	}

	/** 도서 조회 후 등록 가능 도서 조회 <br>
	 * 	<br>
	 *  OldBookController 의 /book/OldBookList.ob <br>
	 *  /app/book/old_book/old_book_list.jsp <br>
	 *  
	 *  @author unchaptered
	 *  @version 2022-03-07 
	 *  
	 *  @param limitValue List 최대 길이 제한
	 *  @return List < OldBookDTO >
	 */
	public List<OldBookDTO> getOldBookListByLimit(int limitValue) {
		List<OldBookDTO> oldBookList = null;
		
		oldBookList =  sqlSession.selectList("OldBook.getOldBookListByLimit", limitValue);
		
		return oldBookList;
	}

	/** 구매 가능 도서 조회 <br>
	 *  <br>
	 *  OldBookController 의 /book/OldBookList.ob <br>
	 *  /app/book/old_book/old_book_list.jsp <br>
	 *  
	 *  @author unchaptered
	 *  @version 2022-03-07 
	 *  
	 *  @param limitValue List 최대 길이 제한
	 *  @return List < OldBookDTO >
	 */
	public List<OldBookDTO> getOldBookStockListByLimit(int limitValue) {
		List<OldBookDTO> oldBookList = null;
		
		oldBookList = sqlSession.selectList("OldBook.getOldBookStockListByLimit", limitValue);
		
		return oldBookList;
	}

	/** 도서 조회 후, 같은 장르의 다른 작품 보기 <br>
	 *  <br>
	 *  OldBookController 의 /book/OldBookRead.ob <br>
	 *  /app/book/old_book/old_book_read.jsp <br>
	 *  
	 *  @author unchaptered
	 *  @version 2022-03-07
	 *  
	 *  @param limitValue List 최대 길이 제한
	 *  @param bookGenre 기준 장르
	 *  @return List < OldBookDTO >
	 */
	public List<OldBookDTO> getOldBookListRelatedByGenre(int limitValue, String bookGenre) {
		HashMap<String, Object> sqlDatas= new HashMap<>();
		sqlDatas.put("limitValue", limitValue);
		sqlDatas.put("bookGenre", bookGenre);
		
		List<OldBookDTO> oldBookList = null;
		
		oldBookList = sqlSession.selectList("OldBook.getOldBookListRelatedByGenre", sqlDatas);
		
		return oldBookList;
	}

	/** 도서 조회 후, 같은 작가의 다른 작품 보기 (사용 중 : 2022-03-07) <br>
	 *  <br>
	 *  OldBookController 의 /book/OldBookRead.ob <br>
	 *  /app/book/old_book/old_book_read.jsp <br>
	 *  
	 *  @author unchaptered
	 *  @version 2022-03-07
	 *
	 *  @param limitValue List 최대 길이 제한
	 *  @param bookWriter 기준 저자
	 *  @return List < OldBookDTO >
	 */
	public List<OldBookDTO> getOldBookListRelatedByWriter(int limitValue, String bookWriter) {
		HashMap<String, Object> sqlDatas = new HashMap<>();
		sqlDatas.put("limitValue", limitValue);
		sqlDatas.put("bookWriter", bookWriter);
		
		List<OldBookDTO> oldBookList = null;
		
		oldBookList = sqlSession.selectList("OldBook.getOldBookListRelatedByWriter", sqlDatas);
		
		return oldBookList;
	}
}
