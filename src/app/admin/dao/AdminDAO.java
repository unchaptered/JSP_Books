package app.admin.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import app.admin.dao.AdminDTO;

import mybatis.SqlMapConfig;

public class AdminDAO {
	SqlSession sqlsession;
	
	public AdminDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean join(AdminDTO newAdmin) {
		return 1 == sqlsession.insert("Admin.join",newAdmin);
	}
	
	public AdminDTO login(String adminid,String adminpw) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("adminid",adminid);
		datas.put("adminpw",adminpw);
		AdminDTO loginAdmin = sqlsession.selectOne("Admin.login",datas);
		return loginAdmin;
	}
	
	public boolean checkId(String adminid) {
		return (Integer)sqlsession.selectOne("Admin.checkId",adminid) == 0;
	}
}
