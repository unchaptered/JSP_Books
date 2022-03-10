package app.admin.dao;

public class ChartDTO {
	String newbooktitle;
	int newbookmount;
	String billdate;
	String billprice;
	String new_book_pk;
	int ordercount;
	String username;
	String onedaytotal;
	public String getNewbooktitle() {
		return newbooktitle;
	}
	public void setNewbooktitle(String newbooktitle) {
		this.newbooktitle = newbooktitle;
	}
	public int getNewbookmount() {
		return newbookmount;
	}
	public void setNewbookmount(int newbookmount) {
		this.newbookmount = newbookmount;
	}
	public String getBilldate() {
		return billdate;
	}
	public void setBilldate(String billdate) {
		this.billdate = billdate;
	}
	public String getBillprice() {
		return billprice;
	}
	public void setBillprice(String billprice) {
		this.billprice = billprice;
	}
	public String getNew_book_pk() {
		return new_book_pk;
	}
	public void setNew_book_pk(String new_book_pk) {
		this.new_book_pk = new_book_pk;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOnedaytotal() {
		return onedaytotal;
	}
	public void setOnedaytotal(String onedaytotal) {
		this.onedaytotal = onedaytotal;
	}
	@Override
	public String toString() {
		return "ChartDTO [newbooktitle=" + newbooktitle + ", newbookmount=" + newbookmount + ", billdate=" + billdate
				+ ", billprice=" + billprice + ", new_book_pk=" + new_book_pk + ", ordercount=" + ordercount
				+ ", username=" + username + ", onedaytotal=" + onedaytotal + ", getNewbooktitle()=" + getNewbooktitle()
				+ ", getNewbookmount()=" + getNewbookmount() + ", getBilldate()=" + getBilldate() + ", getBillprice()="
				+ getBillprice() + ", getNew_book_pk()=" + getNew_book_pk() + ", getOrdercount()=" + getOrdercount()
				+ ", getUsername()=" + getUsername() + ", getOnedaytotal()=" + getOnedaytotal() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

	
	
	
	
}
