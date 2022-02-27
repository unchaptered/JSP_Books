package app.post.dao;

public class FileDTO{
	
	// Field Variables
	
	private int postFilePk;
	private String postFileSystem;
	private String postFileOrigin;
	
	// Getter
	
	public int getPostFilePk() {
		return postFilePk;
	}
	public String getPostFileSystem() {
		return postFileSystem;
	}
	public String getPostFileOrigin() {
		return postFileOrigin;
	}
		
	// Setter
	
	public void setPostFilePk(int postFilePk) {
		this.postFilePk = postFilePk;
	}
	public void setPostFileSystem(String postFileSystem) {
		this.postFileSystem = postFileSystem;
	}
	public void setPostFileOrigin(String postFileOrigin) {
		this.postFileOrigin = postFileOrigin;
	}
	
	
}
