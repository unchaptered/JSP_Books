package app.shop.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSession sqlSession;

	public ProductDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}
	// 주문상품 추가
	public boolean insertProduct(ProductDTO pdto) {
		return sqlSession.insert("insertProduct", pdto)==1;
	}
	public boolean updateBookMount(int bookPk, int prodQty) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("bookPk", bookPk);
		datas.put("prodQty", prodQty);
		return sqlSession.update("Shop.updateBookMount", datas)==1;
	}
}
