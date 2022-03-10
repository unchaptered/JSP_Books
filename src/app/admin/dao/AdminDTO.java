package app.admin.dao;



public class AdminDTO {
	
	private int adminPk;
	private String adminname;
	private String adminid;
	private String adminpw;
	private String adminkey;
	
	
	
	public int getAdminPk() {
		return adminPk;
	}
	public void setAdminPk(int adminPk) {
		this.adminPk = adminPk;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	public String getAdminkey() {
		return adminkey;
	}
	public void setAdminkey(String adminkey) {
		this.adminkey = adminkey;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof AdminDTO) {
			AdminDTO target = (AdminDTO)obj;
			
			if(target.adminid.equals(this.adminid)) {
				return true;
			}
		}
		return false;
	}
	@Override
	public int hashCode() {
		return adminPk;
	
	}
}
