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
	public List<ChartDTO> buy_price2() {
		List<ChartDTO> items2 = sqlsession.selectList("Chart.show2");
		return items2;
	}
	
	public List<ChartDTO> buy_price3() {
		List<ChartDTO> items3 = sqlsession.selectList("Chart.show3");
		return items3;
	}
	
	public List<ChartDTO> buy_price4() {
		List<ChartDTO> items4 = sqlsession.selectList("Chart.show4");
		return items4;
	}
}
