package app.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.book.dao.BookDTO;
import mybatis.SqlMapConfig;

public class CartDAO {
	SqlSession sqlsession;

	public CartDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public Integer checkCart(CartDTO cdto) {
		return sqlsession.selectOne("Shop.checkCart", cdto);
	}
	public void updateCartQuantity(int cartPk, int quantity) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("cartPk", cartPk);
		datas.put("quantity", quantity);
		sqlsession.update("Shop.updateCartQuantity", datas);
	}
	public void updateCartQuantityOverwrite(int cartPk, int quantity) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("cartPk", cartPk);
		datas.put("quantity", quantity);
		sqlsession.update("Shop.updateCartQuantityOverwrite", datas);
	}
	public boolean addCart(CartDTO cdto) {
		return sqlsession.insert("Shop.addCart", cdto) == 1;
	}

	public List<CartDTO> getCartList(int userpk) {
		return sqlsession.selectList("Shop.getCartList",userpk);
	}
	public List<CartDTO> getCartList(String[] carts) {
		return sqlsession.selectList("Shop.getCartListByChecked",carts);
	}
	public void delCart(int cartPk) {
		sqlsession.delete("Shop.delCartOne", cartPk);
	}

	public String getProdMount(int cartPk) {
		return sqlsession.selectOne("Shop.getProdMount", cartPk);
	}

	public List<BookDTO> getProdInfo(int cartPk) {
		return sqlsession.selectList("Shop.getProdInfo", cartPk);
	}

	public List<BookDTO> getBookList(String[] products) {
		return sqlsession.selectList("Shop.getBookList",products);
	}
}
