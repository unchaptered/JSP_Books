package app.post.dao;

import java.util.HashMap;
import java.util.List;

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
	public FileDTO getFile(int postFilePk) {
		return sqlsession.selectOne("File.getFile",postFilePk);
	}
//	//파일 삭제하기
//	public void deleteByName(String postFileSystem) {
//		sqlsession.delete("File.deleteByName",postFileSystem);
//		
//	}
	//마지막 파일번호
	public int getLastPostFilePk(String postFileSystem) {
		return sqlsession.selectOne("File.getLastPostFilePk",postFileSystem);
	}
	//파일 삭제
	public boolean removeFile(int postFilePk) {
		return 1 == sqlsession.delete("File.removeFile",postFilePk);
	}
	
}
