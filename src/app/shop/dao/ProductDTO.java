package app.shop.dao;

public class ProductDTO {
	private int productPk;				// 주문상품번호. 회원탈퇴시 회원관련 주문상품 내역 삭제에 필요
    private int productQuantity;		// 구매수량
    private String productTotalPrice;	// 한품목 상품들 총가격
	private int newBookPk;				// 책pk
    private int billPk;					// 주문번호(영수증)
    
    
	public int getProductPk() {
		return productPk;
	}
	public void setProductPk(int productPk) {
		this.productPk = productPk;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public String getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(String productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}
	public int getNewBookPk() {
		return newBookPk;
	}
	public void setNewBookPk(int newBookPk) {
		this.newBookPk = newBookPk;
	}
	public int getBillPk() {
		return billPk;
	}
	public void setBillPk(int billPk) {
		this.billPk = billPk;
	}
    
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof ProductDTO) {
			ProductDTO target = (ProductDTO)obj;
			return target.productTotalPrice.equals(this.productTotalPrice);
		}
		return false;
	}
	
    public int hashCode() {
    	return productPk;
    }
}
