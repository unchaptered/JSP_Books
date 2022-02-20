package app.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class NoticeDAO {
	SqlSession sqlsession;
	
	public NoticeDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	//공지사항 총 개수 가져오기
	public int getNoticeCnt() {
		return sqlsession.selectOne("Post.getNoticeCnt");
	}
	//공지사항 리스트 가져오기
	public List<NoticeDTO> getNoticeList(int startRow, int pageSize, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
