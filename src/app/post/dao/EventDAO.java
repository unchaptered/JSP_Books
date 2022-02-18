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
	public boolean insertEvent(EventDTO board) {
		return 1 == sqlsession.insert("Post.insertEvent",board);
	}
	//이벤트 개수 가져오기
	public int getEventCnt() {
		return sqlsession.selectOne("Post.getEventCnt");
	}
//	이벤트 리스트 받아오기
	public List<EventDTO> getEventList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<EventDTO> result;
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);
		
		if(keyword == null) {
			result = sqlsession.selectList("Post.getEventList", datas);
		}
		else {
			datas.put("keyword",keyword);
			System.out.println(datas);
			result = sqlsession.selectList("Post.getEventListWithKey", datas);
		}
		return result;
	}

	
	
}
