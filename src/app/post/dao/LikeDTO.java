package app.post.dao;

public class LikeDTO {
	
	// Field Variables 
	private int eventLikePk;
	private int eventLikePost;
	private int eventLikeUser;
	
	// Getter
	public int getEventLikePk() {
		return eventLikePk;
	}
	public int getEventLikePost() {
		return eventLikePost;
	}
	public int getEventLikeUser() {
		return eventLikeUser;
	}

	// Setter
	
	public void setEventLikePk(int eventLikePk) {
		this.eventLikePk = eventLikePk;
	}
	public void setEventLikePost(int eventLikePost) {
		this.eventLikePost = eventLikePost;
	}
	public void setEventLikeUser(int eventLikeUser) {
		this.eventLikeUser = eventLikeUser;
	}
	
}