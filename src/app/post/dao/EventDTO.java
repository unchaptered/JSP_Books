package app.post.dao;

public class EventDTO extends PostDTO {
	
	// Field Variables 
	private int eventPk;
	
	private String eventStarted; // 이벤트 시작일
	private String eventEnded; // 이벤트 종료일
	private String eventLike; // 이벤트 좋아요 수
	
	private int postPk;
	
	// Getter
	
	public int getEventPk() {
		return eventPk;
	}
	public String getEventStarted() {
		return eventStarted;
	}
	public String getEventEnded() {
		return eventEnded;
	}
	public String getEventLike() {
		return eventLike;
	}
	
	public int getPostPk() {
		return postPk;
	}
	
	// Setter
	
	public void setEventPk(int eventPk) {
		this.eventPk = eventPk;
	}
	public void setEventStarted(String eventStarted) {
		this.eventStarted = eventStarted;
	}
	public void setEventEnded(String eventEnded) {
		this.eventEnded = eventEnded;
	}
	public void setEventLike(String eventLike) {
		this.eventLike = eventLike;
	}
	public void setPostPk(int postPk) {
		this.postPk = postPk;
	}
}