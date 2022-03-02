package app.shop.dao;

public class BillDTO {
	private int billPk;
	private String billPayment;
	private String billTotalPrice;
	private String billDate;
	private String billZipCode;
	private String billAddr;
	private String billCost;
	private String billStatus;
	private int userPk;
	
	public int getBillPk() {
		return billPk;
	}

	public void setBillPk(int billPk) {
		this.billPk = billPk;
	}

	public String getBillPayment() {
		return billPayment;
	}

	public void setBillPayment(String billPayment) {
		this.billPayment = billPayment;
	}

	public String getBillTotalPrice() {
		return billTotalPrice;
	}

	public void setBillTotalPrice(String billTotalPrice) {
		this.billTotalPrice = billTotalPrice;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public String getBillZipCode() {
		return billZipCode;
	}

	public void setBillZipCode(String billZipCode) {
		this.billZipCode = billZipCode;
	}

	public String getBillAddr() {
		return billAddr;
	}

	public void setBillAddr(String billAddr) {
		this.billAddr = billAddr;
	}

	public String getBillCost() {
		return billCost;
	}

	public void setBillCost(String billCost) {
		this.billCost = billCost;
	}

	public String getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}

	public int getUserPk() {
		return userPk;
	}

	public void setUserPk(int userPk) {
		this.userPk = userPk;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof BillDTO) {
			BillDTO target = (BillDTO)obj;
			return target.billAddr.equals(this.billAddr);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return billPk;
	}
}
