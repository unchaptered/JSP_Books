package app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import app.user.dao.UserDTO;

import mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean join(UserDTO newUser) {
		return 1 == sqlsession.insert("User.join",newUser);
	}
	public UserDTO login(String email,String loginPw) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("email",email);
		datas.put("loginPw",loginPw);
		System.out.println(datas);
		UserDTO loginUser = null;
		loginUser = (UserDTO)sqlsession.selectOne("User.UserLogin",datas);
	
		System.out.println(loginUser);
		return loginUser;
	}

	public boolean LogincheckEmail(String email) {
		return 0 == (Integer)sqlsession.selectOne("User.LogincheckEmail",email);
	}

	public boolean JoincheckEmail(String userEmail) {
		return 0 == (Integer)sqlsession.selectOne("User.JoincheckEmail",userEmail);
	}

	public UserDTO findEmail(String emailFindName, String emailFindPhone) {
		HashMap<String, Object> emailDatas = new HashMap<String, Object>();
		emailDatas.put("emailFindName",emailFindName);
		emailDatas.put("emailFindPhone",emailFindPhone);
		System.out.println(emailDatas);
		UserDTO findUser = null;
		findUser = (UserDTO)sqlsession.selectOne("User.UserFindEmail",emailDatas);
		System.out.println(findUser);
		return findUser;
	}

	public UserDTO findPw(String pwFindEmail, String pwFindPhone) {
		HashMap<String, Object> pwDatas = new HashMap<String, Object>();
		pwDatas.put("pwFindEmail",pwFindEmail);
		pwDatas.put("pwFindPhone",pwFindPhone);
		System.out.println(pwDatas);
		UserDTO findUserPw = null;
		findUserPw = (UserDTO)sqlsession.selectOne("User.UserFindPw",pwDatas);
		System.out.println(findUserPw);
		return findUserPw;
	}

	public boolean infoChange(UserDTO udto) {
		return 1 == sqlsession.update("User.infoChange",udto);
	}

	public boolean infoPwChange(UserDTO udto) {
		return 1 == sqlsession.update("User.infoPwChange",udto);
	}

	}

