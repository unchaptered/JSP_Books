package app.post.dao;

public class EventDTO extends PostDTO {
	
	// Field Variables 
	
	private String eventStarted; // 이벤트 시작일
	private String eventEnded; // 이벤트 종료일
	private String eventImage; // 이벤트 이미지
	private String eventImageDetail; // 이벤트 이미지 디테일
	private String eventLike; // 이벤트 좋아요 수
	
	// Getter
	
	public String getEventStarted() {
		return eventStarted;
	}
	public String getEventEnded() {
		return eventEnded;
	}
	public String getEventImage() {
		return eventImage;
	}
	public String getEventImageDetail() {
		return eventImageDetail;
	}
	public String getEventLike() {
		return eventLike;
	}
	
	// Setter
	
	public void setEventStarted(String eventStarted) {
		this.eventStarted = eventStarted;
	}
	public void setEventEnded(String eventEnded) {
		this.eventEnded = eventEnded;
	}
	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}
	public void setEventImageDetail(String eventImageDetail) {
		this.eventImageDetail = eventImageDetail;
	}
	public void setEventLike(String eventLike) {
		this.eventLike = eventLike;
	}
	
	
}