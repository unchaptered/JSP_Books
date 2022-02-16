package app.post.dao;

public class PostDtoAbs {
	
	// Field Variables
	
	private String postPk;
	private String postTitle;
	private String postText;
	private String postOwner;
	private String postCreated;
	private String postViewed;
	
	// Getter 
	
	public String getPostPk() {
		return postPk;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public String getPostText() {
		return postText;
	}
	public String getPostOwner() {
		return postOwner;
	}
	public String getPostCreated() {
		return postCreated;
	}
	public String getPostViewed() {
		return postViewed;
	}
	
	// Setter
	

	public void setPostPk(String postPk) {
		this.postPk = postPk;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	public void setPostOwner(String postOwner) {
		this.postOwner = postOwner;
	}
	public void setPostCreated(String postCreated) {
		this.postCreated = postCreated;
	}
	public void setPostViewed(String postViewed) {
		this.postViewed = postViewed;
	}
}