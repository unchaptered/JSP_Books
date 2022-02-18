package app.post.dao;

public class NoticeDTO extends PostDTO {
	
	// Field Variables
	
	private int noticePk; //기본키
	
	private String noticeImportant; //공지사항 고정 여부
	
	private int postPk; //PostDTO 기본키
	
	
	// Getter

	public int getNoticePk() {
		return noticePk;
	}
	public String getNoticeImportant() {
		return noticeImportant;
	}
	
	public int getPostPk() {
		return postPk;
	}
	
	
	// Setter

	public void setNoticePk(int noticePk) {
		this.noticePk = noticePk;
	}
	public void setNoticeImportant(String noticeImportant) {
		this.noticeImportant = noticeImportant;
	}
	public void setPostPk(int postPk) {
		this.postPk = postPk;
	}
	
}
