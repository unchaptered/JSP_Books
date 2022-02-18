package app.post.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class PostDAO {
	SqlSession sqlsession;
	
	public PostDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	//포스트 작성자 이름 가져오기
	public String getOwnerName(int userPk) {
		return sqlsession.selectOne("Post.getOwnerName",userPk);
	}

	//마지막 게시물 번호 가져오기
	public int getLastPostPk(int postOwner) {
		return sqlsession.selectOne("Post.getLastPostPk",postOwner);
	}
	
	
}
