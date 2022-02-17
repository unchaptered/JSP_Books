package app.post.dao;

public class NoticeDto extends PostDto {
	
	// Field Variables
	
	private String noticePk;
	private String noticeFiles;
	private String noticeImportant;
	
	// Getter

	public String getNoticePk() {
		return noticePk;
	}
	public String getNoticeFiles() {
		return noticeFiles;
	}
	public String getNoticeImportant() {
		return noticeImportant;
	}
	
	// Setter

	public void setNoticePk(String noticePk) {
		this.noticePk = noticePk;
	}
	public void setNoticeFiles(String noticeFiles) {
		this.noticeFiles = noticeFiles;
	}
	public void setNoticeImportant(String noticeImportant) {
		this.noticeImportant = noticeImportant;
	}
}
