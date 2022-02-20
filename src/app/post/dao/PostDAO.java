package app.post.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class PostDAO {
	SqlSession sqlsession;
	
	public PostDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	//포스트 리스트 가져오기
//	public List<PostDTO> getPostList() {
//		return sqlsession.selectList("Post.getPostList");
//	}
//	//포스트 제목 가져오기
//	public String getPostTitle(int postPk) {
//		return sqlsession.selectOne("Post.getPostTitle",postPk);
//	}
//	
	//포스트 작성자 이름 가져오기
	public String getOwnerName(int userPk) {
		return sqlsession.selectOne("Post.getOwnerName",userPk);
	}

	//마지막 게시물 번호 가져오기
	public int getLastPostPk(int postOwner) {
		return sqlsession.selectOne("Post.getLastPostPk",postOwner);
	}

	
	
	
	
	
}
