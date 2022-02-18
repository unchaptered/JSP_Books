package app.user.dao;

public class UserDTO {
	// Field Variables
	
	private int user_pk; // 기본키
	
	private String user_email; // 이메일
	private String user_name; // 이름
	private String user_password; // 비밀번호
	private String user_phone; // 핸드폰번호
	private String user_zipcode; // 우편번호
	private String user_address; // 주소
	private String user_address_detail; // 상세주소
	private String user_address_etc; // 기타
	private String user_bank; // 은행명
	private String user_bank_account; // 계좌번호
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_address_detail() {
		return user_address_detail;
	}
	public void setUser_address_detail(String user_address_detail) {
		this.user_address_detail = user_address_detail;
	}
	public String getUser_address_etc() {
		return user_address_etc;
	}
	public void setUser_address_etc(String user_address_etc) {
		this.user_address_etc = user_address_etc;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	public String getUser_bank_account() {
		return user_bank_account;
	}
	public void setUser_bank_account(String user_bank_account) {
		this.user_bank_account = user_bank_account;
	}
	
	// Getter
	
	
	
	// Common Method
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof UserDTO) {
			UserDTO target = (UserDTO)obj;
			
			if(target.user_email.equals(this.user_email)) {
				return true;
			}
		} 
		return false;
	}
	@Override
	public int hashCode() {
		return user_pk;
	}

}
