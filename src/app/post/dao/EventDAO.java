package app.post.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class EventDAO {
	SqlSession sqlsession;
	
	public EventDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	//이벤트 작성
	public boolean insertEvent(EventDTO event) {
		return 1 == sqlsession.insert("Post.insertEvent",event);
	}
	//이벤트 개수 가져오기
	public int getEventCnt(String keyword) {
		return sqlsession.selectOne("Post.getEventCnt",keyword);
	}
	//이벤트 리스트 가져오기
	public List<EventDTO> getEventList(int startRow, int pageSize, String keyword, String sort) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<EventDTO> result;
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);
		datas.put("keyword",keyword);
		datas.put("sort",sort);
		
		result = sqlsession.selectList("Post.getEventList", datas);
		return result;
	}
		
	//이벤트 상세페이지 가져오기
	public EventDTO getEventRead(int eventPk) {
		return sqlsession.selectOne("Post.getEventRead",eventPk);
	}
	
	//이벤트 수정
	public boolean updateEvent(EventDTO event) {
		return 1 == sqlsession.update("Post.updateEvent",event);
	}
	//postPk로 eventPk받아오기
	public int getLastEventPk(int postPk) {
		return sqlsession.selectOne("Post.getLastEventPk",postPk);
	}
	//eventFile 삭제(update)
	public boolean removeEventFile(int eventFile) {
		return 1 == sqlsession.update("Post.removeEventFile",eventFile);
	}
	public boolean removeEventFileDetail(int eventFileDetail) {
		return 1 == sqlsession.update("Post.removeEventFileDetail",eventFileDetail);
	}
		
	//유저의 좋아요 상태 가져오기
	public List<LikeDTO> getLikeStatus(int userPk, int eventPk) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("userPk", userPk);
		datas.put("eventPk", eventPk);
		List<LikeDTO> result;
		
		result = sqlsession.selectList("Post.getLikeStatus", datas);
		return result;
	}
	
	public boolean insertLikeStatus(LikeDTO status) {
		return 1 == sqlsession.insert("Post.insertLikeStatus", status);
	}
	//좋아요 증가
	public void upEventLike(int eventPk) {
		sqlsession.update("Post.upEventLike",eventPk);					
	}
	//좋아요 감소
	public void downEventLike(int eventPk) {
		sqlsession.update("Post.downEventLike",eventPk);			
	}
	//좋아요 상태 지우기
	public boolean removeLikeStatus(int eventLikePk) {
		return 1 == sqlsession.delete("Post.removeLikeStatus", eventLikePk);
	}
	
}
