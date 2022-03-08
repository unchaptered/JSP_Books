package app.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class ChartDAO {
	SqlSession sqlsession;
	public ChartDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public List<ChartDTO> buy_price() {
		List<ChartDTO> items = sqlsession.selectList("Chart.show1");
		return items;
	}

}
