package app.shop.dao;

public class CartDTO {
	private int cartNum;	// 품목지울때필요
	private String image;
	private int bookpk;		// book코드
	private int userpk;
	private String title;
	private int quantity;	// 구매수량
	private int price;
	private int mount;		// 남은수량
	
	
	
	public int getUserpk() {
		return userpk;
	}

	public void setUserpk(int userpk) {
		this.userpk = userpk;
	}

	public int getCartnum() {
		return cartNum;
	}

	public void setCartnum(int cartnum) {
		this.cartNum = cartnum;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getBookpk() {
		return bookpk;
	}

	public void setBookpk(int bookpk) {
		this.bookpk = bookpk;
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
			
			if(target.title.equals(this.title)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return cartNum;
	}
}
