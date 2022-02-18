package app.post.dao;

public class FileDTO {
	
	// Field Variables
	
	private int postFilesPk;
	private String postFilesSystem;
	private String postFilesOrigin;
	
	private int postPk;
	// Getter
	
	public int getPostFilesPk() {
		return postFilesPk;
	}
	public String getPostFilesSystem() {
		return postFilesSystem;
	}
	public String getPostFilesOrigin() {
		return postFilesOrigin;
	}
	
	public int getPostPk() {
		return postPk;
	}
		
	// Setter
	
	public void setPostFilesPk(int postFilesPk) {
		this.postFilesPk = postFilesPk;
	}
	public void setPostFilesSystem(String postFilesSystem) {
		this.postFilesSystem = postFilesSystem;
	}
	public void setPostFilesOrigin(String postFilesOrigin) {
		this.postFilesOrigin = postFilesOrigin;
	}
	
	public void setPostPk(int postPk) {
		this.postPk = postPk;
	}
	
}
