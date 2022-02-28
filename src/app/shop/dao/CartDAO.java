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
	public void updateCartQuantity(int cartnum, int quantity) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("cartnum", cartnum);
		datas.put("quantity", quantity);
		sqlsession.update("Shop.updateCartQuantity", datas);
	}
	public void updateCartQuantityOverwrite(int cartnum, int quantity) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("cartnum", cartnum);
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
	public void delCart(int cartnum) {
		sqlsession.delete("Shop.delCartOne", cartnum);
	}

	public String getProdMount(int cartnum) {
		return sqlsession.selectOne("Shop.getProdMount", cartnum);
	}

	public List<BookDTO> getProdInfo(int cartnum) {
		return sqlsession.selectList("Shop.getProdInfo", cartnum);
	}

	public List<BookDTO> getBookList(String[] products) {
		return sqlsession.selectList("Shop.getBookList",products);
	}
}
