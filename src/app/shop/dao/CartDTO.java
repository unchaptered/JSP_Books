package app.shop.dao;

public class CartDTO {
	private int cartPk;	// 품목지울때필요
	private String image;
	private int bookPk;		// book코드
	private int userPk;
	private String title;
	private int quantity;	// 구매수량
	private int price;
	private int mount;		// 남은수량
	
	
	
	public int getUserPk() {
		return userPk;
	}

	public void setUserPk(int userpk) {
		this.userPk = userpk;
	}

	public int getCartPk() {
		return cartPk;
	}

	public void setCartPk(int cartPk) {
		this.cartPk = cartPk;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getBookPk() {
		return bookPk;
	}

	public void setBookPk(int bookpk) {
		this.bookPk = bookpk;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMount() {
		return mount;
	}

	public void setMount(int mount) {
		this.mount = mount;
	}
	

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof CartDTO) {
			CartDTO target = (CartDTO)obj;
			return target.title.equals(this.title);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return cartPk;
	}
}
