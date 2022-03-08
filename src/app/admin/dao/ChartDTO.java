package app.admin.dao;

public class ChartDTO {
	String title;
	int price;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ChartDTO [title=" + title + ", price=" + price + "]";
	}
	
	
	
	
}
