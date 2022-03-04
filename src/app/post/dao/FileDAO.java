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
	public FileDTO getFile(int postFilePk) {
		return sqlsession.selectOne("File.getFile",postFilePk);
	}
	//마지막 파일번호
	public int getLastPostFilePk(String postFileSystem) {
		return sqlsession.selectOne("File.getLastPostFilePk", postFileSystem);
	}
	//파일 삭제
	public boolean removeFile(int postFilePk) {
		return 1 == sqlsession.delete("File.removeFile", postFilePk);
	}
	//파일 수정
	public boolean updateFile(FileDTO newFile) {
		return 1== sqlsession.update("File.updateFile", newFile);
	}
	
}
