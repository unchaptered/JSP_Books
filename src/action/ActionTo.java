package action;

public class ActionTo {
	private String path;
	//true : redirect 방식 / false : forward 방식
	private boolean isRedirect;
	
	//ex) path : "joinview.jsp" / isReirect : false
	//		--> joinview.jsp로 forward방식으로 전송
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
