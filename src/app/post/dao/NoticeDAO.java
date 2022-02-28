package app.post.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class NoticeDAO {
	SqlSession sqlsession;
	
	public NoticeDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	//공지사항 총 개수 가져오기
	public int getNoticeCnt(String keyword) {
		return sqlsession.selectOne("Post.getNoticeCnt",keyword);
	}
	//공지사항 리스트 가져오기
	public List<NoticeDTO> getNoticeList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<NoticeDTO> result;
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);

		if(keyword == null) {
			result = sqlsession.selectList("Post.getNoticeList", datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Post.getNoticeListWithKey", datas);
		}
		return result;
	}
	//공지사항 작성
	public boolean insertNotice(NoticeDTO notice) {
		return 1 == sqlsession.insert("Post.insertNotice", notice);
	}
	//공지사항 상세페이지 가져오기
	public NoticeDTO getNoticeRead(int noticePk) {
		return sqlsession.selectOne("Post.getNoticeRead",noticePk);
	}
	//공지사항 삭제
	public boolean removeNotice(int noticePk) {
		return 1 == sqlsession.delete("Post.removeNotice", noticePk);
	}
	//공지사항 수정
	public boolean updateNotice(NoticeDTO notice) {
		return 1 == sqlsession.update("Post.updateNotice", notice);
	}
	//이전글 pk받아오기
	public Integer getPrevNotice(int noticePk) {
		return sqlsession.selectOne("Post.getPrevNotice",noticePk);
	}
	//다음글 pk받아오기
	public Integer getNextNotice(int noticePk) {
		return sqlsession.selectOne("Post.getNextNotice",noticePk);
	}
	//공지사항 작성자 리스트로 받아오기
	public List<String> getOwnerName(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<String> result;
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);

		if(keyword == null) {
			result = sqlsession.selectList("Post.getOwnerName", datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Post.getOwnerNameWithKey", datas);
		}
		return result;
	}
	//postPk로 noticePk 받아오기 (notice작성 후)
	public int getLastNoticePk(int postPk) {
		return sqlsession.selectOne("Post.getLastNoticePk",postPk);
	}
//	//고정된 공지사항 개수 가져오기
//	public int getPinCnt() {
//		return sqlsession.selectOne("Post.getPinCnt");
//	}


}
