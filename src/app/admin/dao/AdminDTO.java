package app.admin.dao;

public class AdminDTO {
	
	// Field Variables
	
	private String adminPk; // 기본키
	private String adminName; // 관리자 명
	private String adminPassword; // 관리자 비밀번호
	private String adminAuthorized; // 관리자 인증여부
	private String adminExpired; // 관리자 인증 만료기한
	
	// Getter
	
	public String getAdminPk() {
		return adminPk;
	}
	public String getAdminName() {
		return adminName;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public String getAdminAuthorized() {
		return adminAuthorized;
	}
	public String getAdminExpired() {
		return adminExpired;
	}
	
	// Setter
	
	public void setAdminPk(String adminPk) {
		this.adminPk = adminPk;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public void setAdminAuthorized(String adminAuthorized) {
		this.adminAuthorized = adminAuthorized;
	}
	public void setAdminExpired(String adminExpired) {
		this.adminExpired = adminExpired;
	}
	
	
}
