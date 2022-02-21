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
	}

