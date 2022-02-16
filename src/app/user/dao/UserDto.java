package app.user.dao;

public class UserDto {
	// Field Variables
	
	private int userPk; // 기본키
	
	private String userEmail; // 이메일
	private String userName; // 이름
	private String userPassword; // 비밀번호
	private String userPhone; // 핸드폰번호
	private String userZipcode; // 우편번호
	private String userAddress; // 주소
	private String userAddressDetail; // 상세주소
	private String userAddressEtc; // 기타
	private String userBank; // 은행명
	private String userBankAccount; // 계좌번호
	
	// Getters
	
	public int getUserPk() {
		return userPk;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public String getUserAddressDetail() {
		return userAddressDetail;
	}
	public String getUserAddressEtc() {
		return userAddressEtc;
	}
	public String getUserBank() {
		return userBank;
	}
	public String getUserBankAccount() {
		return userBankAccount;
	}
	
	// Setters
	
	public void setUserPk(int userPk) {
		this.userPk = userPk;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}
	public void setUserAddressEtc(String userAddressEtc) {
		this.userAddressEtc = userAddressEtc;
	}
	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}
	public void setUserBankAccount(String userBankAccount) {
		this.userBankAccount = userBankAccount;
	}
	
	// Common Method
}
