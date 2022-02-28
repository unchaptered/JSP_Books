package app.post.dao;

public class NoticeDTO extends PostDTO {
	
	// Field Variables
	
	private int noticePk; //기본키
	
	private String noticePin; //공지사항 고정 여부
	
	private int noticeFile; //공지사항 첨부파일
	
	private int postPk; //PostDTO 기본키
	
	// Getter

	public int getNoticePk() {
		return noticePk;
	}
	
	public String getNoticePin() {
		return noticePin;
	}
	
	public int getNoticeFile() {
		return noticeFile;
	}

	public int getPostPk() {
		return postPk;
	}
	
	
	// Setter

	public void setNoticePk(int noticePk) {
		this.noticePk = noticePk;
	}

	public void setNoticePin(String noticePin) {
		this.noticePin = noticePin;
	}
	
	public void setNoticeFile(int noticeFile) {
		this.noticeFile = noticeFile;
	}

	public void setPostPk(int postPk) {
		this.postPk = postPk;
	}
	
	
}