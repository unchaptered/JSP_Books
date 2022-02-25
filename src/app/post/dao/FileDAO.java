package app.post.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class FileDAO {
	SqlSession sqlsession;
	
	public FileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	//파일 삽입
	public boolean insertFile(FileDTO file) {
		return 1 == sqlsession.insert("File.insertFile",file);
	}
	//파일 가져오기
	public FileDTO getFile(int postPk) {
		return sqlsession.selectOne("File.getFile",postPk);
	}
	//파일 삭제하기
	public void deleteByName(String postFileSystem) {
		sqlsession.delete("File.deleteByName",postFileSystem);
		
	}
	
}
