package app.book.old.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class OldBookSelledDAO {
	SqlSession sqlSession;
	
	public OldBookSelledDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean addOldBookSelledRow(int bookPk) {
		return 1 == sqlSession.insert("OldBook.addOldBookSelledRow", bookPk);
	}
	
	public int getOldBookSelledPkByBookPk(int bookPk) {
		return sqlSession.selectOne("OldBook.getOldBookSelledPkByNewBookPk", bookPk);
	}
	
	public void getOldBookSelledCountByBookPk(int bookPk) {
	}
	
	public void updateSelledUp(String columnName, int bookPk) {
		HashMap<String, Object> dataMap=new HashMap<>();
		dataMap.put("columnName", columnName);
		dataMap.put("bookPk", bookPk);
		
		sqlSession.update("OldBook.updateOldBookSelledUp", dataMap);
	}
	
	public void updateSelledDown(String columnName, int bookPk) {
		HashMap<String, Object> dataMap=new HashMap<>();
		dataMap.put("columnName", columnName);
		dataMap.put("bookPk", bookPk);
		
		sqlSession.update("OldBook.updateOldBookSelledDown", dataMap);
	}
}