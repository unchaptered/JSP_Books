package app.shop.dao;

public class ProductDTO {
	private int productPk;				// 주문상품번호. 회원탈퇴시 회원관련 주문상품 내역 삭제에 필요
    private int productQuantity;		// 구매수량
    private String productTotalPrice;	// 한품목 상품들 총가격
	private int newBookPk;				// 책pk
    private int billPk;					// 주문번호(영수증)
    private String newBookImage;		// 책표지
    private String newBookTitle;		// 책이름
    private String billStatus;			// 배송상태
    private String billDate;			// 주문일
    
    
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

	public String getNewBookTitle() {
		return newBookTitle;
	}

	public void setNewBookTitle(String newBookTitle) {
		this.newBookTitle = newBookTitle;
	}

	public String getNewBookImage() {
		return newBookImage;
	}

	public void setNewBookImage(String newBookImage) {
		this.newBookImage = newBookImage;
	}

	public String getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
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
