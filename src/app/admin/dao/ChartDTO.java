package app.admin.dao;

public class ChartDTO {
	String title;
	int price;
	
	String bill_allcount;
	int bill_allprice;
	
	
	public String getBill_allcount() {
		return bill_allcount;
	}
	public void setBill_allcount(String bill_allcount) {
		this.bill_allcount = bill_allcount;
	}
	public int getBill_allprice() {
		return bill_allprice;
	}
	public void setBill_allprice(int bill_allprice) {
		this.bill_allprice = bill_allprice;
	}
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
		return "ChartDTO [title=" + title + ", price=" + price + ", bill_allcount=" + bill_allcount + ", bill_allprice="
				+ bill_allprice + "]";
	}
	
	
	
	
}
