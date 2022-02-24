package app.post.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class PostDAO {
	SqlSession sqlsession;
	
	public PostDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	//마지막 게시물 번호 가져오기
	public int getLastPostPk(int postOwner) {
		return sqlsession.selectOne("Post.getLastPostPk",postOwner);
	}
	//포스트 작성
	public boolean insertPost(PostDTO post) {
		return 1 == sqlsession.insert("Post.insertPost",post);
	}
	//포스트 수정
	public boolean updatePost(PostDTO post) {
		return 1 == sqlsession.update("Post.updatePost",post);
	}
	//포스트 삭제
	public boolean removePost(int postPk) {
		return 1 == sqlsession.delete("Post.removePost",postPk);
	}
	//조회수 증가
	public void updateViewed(int postPk) {
		sqlsession.update("Post.updateViewed",postPk);		
	}

	
	
	
	
	
}
