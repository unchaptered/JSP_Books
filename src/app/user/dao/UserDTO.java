package app.user.dao;

public class UserDTO {
	
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

	public int getUserPk() {
		return userPk;
	}
	public void setUserPk(int userPk) {
		this.userPk = userPk;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserAddressDetail() {
		return userAddressDetail;
	}
	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}
	public String getUserAddressEtc() {
		return userAddressEtc;
	}
	public void setUserAddressEtc(String userAddressEtc) {
		this.userAddressEtc = userAddressEtc;
	}
	public String getUserBank() {
		return userBank;
	}
	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}
	public String getUserBankAccount() {
		return userBankAccount;
	}
	public void setUserBankAccount(String userBankAccount) {
		this.userBankAccount = userBankAccount;
	}
	
	// Getter
	
	
	
	// Common Method
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof UserDTO) {
			UserDTO target = (UserDTO)obj;
			
			if(target.userEmail.equals(this.userEmail)) {
				return true;
			}
		} 
		return false;
	}
	@Override
	public int hashCode() {
		return userPk;
	}

}
