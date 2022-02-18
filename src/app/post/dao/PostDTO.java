package app.post.dao;

public class PostDTO {
	
	// Field Variables
	
	private int postPk;
	
	private String postTitle; //게시물 제목
	private String postText; //게시물 내용
	private int postOwner; //게시물 작성자(유저 pk)
	private String postCreated; //게시물 작성일자
	private String postViewed; //게시물 조회수
	
	// Getter 
	
	public int getPostPk() {
		return postPk;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public String getPostText() {
		return postText;
	}
	public int getPostOwner() {
		return postOwner;
	}
	public String getPostCreated() {
		return postCreated;
	}
	public String getPostViewed() {
		return postViewed;
	}
	
	// Setter
	

	public void setPostPk(int postPk) {
		this.postPk = postPk;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	public void setPostOwner(int postOwner) {
		this.postOwner = postOwner;
	}
	public void setPostCreated(String postCreated) {
		this.postCreated = postCreated;
	}
	public void setPostViewed(String postViewed) {
		this.postViewed = postViewed;
	}
}