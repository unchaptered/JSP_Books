package app.admin.dao;



public class AdminDTO {
	
	private int admin_pk;
	private String adminname;
	private String adminid;
	private String adminpw;
	private String adminpw_re;
	
	private String adminkey;
	
	
	
	public int getAdmin_pk() {
		return admin_pk;
	}
	public void setAdmin_pk(int admin_pk) {
		this.admin_pk = admin_pk;
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
	public String getAdminpw_re() {
		return adminpw_re;
	}
	public void setAdminpw_re(String adminpw_re) {
		this.adminpw_re = adminpw_re;
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
		return admin_pk;
	
	}
}
