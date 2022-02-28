package app.shop.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class BillDAO {
	SqlSession sqlsession;

	public BillDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	// 주문영수증 추가	
	public boolean insertBill(BillDTO billDTO) {
		return sqlsession.insert("Shop.insertBill", billDTO) == 1;
	}
	
}
