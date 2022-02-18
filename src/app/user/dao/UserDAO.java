package app.user.dao;

import org.apache.ibatis.session.SqlSession;

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
