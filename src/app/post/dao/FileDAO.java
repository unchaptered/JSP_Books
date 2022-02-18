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
	
}
