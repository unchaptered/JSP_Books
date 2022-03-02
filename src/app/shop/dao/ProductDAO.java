package app.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSession sqlsession;

	public ProductDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	// 주문상품 추가
	public boolean insertProduct(ProductDTO pdto) {
		return sqlsession.insert("insertProduct", pdto)==1;
	}
	// 판매후 재고 수량 조정	
	public boolean updateBookMount(int bookPk, int prodQty) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("bookPk", bookPk);
		datas.put("prodQty", prodQty);
		return sqlsession.update("Shop.updateBookMount", datas)==1;
	}
	// 유저의 구매상품 리스트 가져오기	
	public List<ProductDTO> getProdList(int userpk) {
		return sqlsession.selectList("Shop.getProdList",userpk);
	}
}
