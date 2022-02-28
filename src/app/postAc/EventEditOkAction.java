//저자 : carpriceksy
package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionTo;
import app.post.dao.EventDAO;
import app.post.dao.EventDTO;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.PostDAO;
import app.post.dao.PostDTO;

public class EventEditOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//파일이 저장될 경로
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		
		String saveFolder = rootPath+"media";	
		
		int size = 5*1024*1024;
		
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		FileDAO fdao = new FileDAO();
		
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String eventStarted = multi.getParameter("eventStarted");
		String eventEnded = multi.getParameter("eventEnded");
		
		int eventPk = Integer.parseInt(multi.getParameter("eventPk"));
		
		EventDTO event = edao.getEventRead(eventPk);
		int postPk = event.getPostPk();
		
		PostDTO post = pdao.getPostRead(postPk);

		post.setPostTitle(postTitle);
		post.setPostText(postText);
		
		event.setEventStarted(eventStarted);
		event.setEventEnded(eventEnded);
		
		int eventFile = event.getEventFile();
		int eventFileDetail = event.getEventFileDetail();
		
		//페이지 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		

		String newOrigin = multi.getOriginalFileName("eventFile");
		String newSystem = multi.getFilesystemName("eventFile");		

		String newDetailOrigin = multi.getOriginalFileName("eventFileDetail");
		String newDetailSystem = multi.getFilesystemName("eventFileDetail");
		
		boolean fcheckStage = false;
		boolean fcheckNew = false;
		boolean fcheckDetailStage = false;
		boolean fcheckDetailNew = false;
		
		if(newSystem == null) {
			fcheckNew = true;
		}
		if(eventFile == 0) {
			fcheckStage = true;
		}
		if(newDetailSystem == null) {
			fcheckDetailNew = true;
		}
		if(eventFileDetail == 0) {
			fcheckDetailStage = true;
		}
		
		//리스트 배너 이미지
		if(!fcheckNew) {//input 있을 경우
			if(!fcheckStage) { //input있고 원래 파일이 있었을 경우(수정)
				FileDTO newFile = new FileDTO();
				newFile.setPostFilePk(eventFile);
				newFile.setPostFileSystem(newSystem);
				newFile.setPostFileOrigin(newOrigin);
				
				fcheckStage = fdao.updateFile(newFile);
				
			}
			else { //input있고 원래 파일 없었을 경우(파일x>파일추가)
				FileDTO newFile = new FileDTO();
				newFile.setPostFileSystem(newSystem);
				newFile.setPostFileOrigin(newOrigin);
				if(fdao.insertFile(newFile)) {
					int newEventFile = fdao.getLastPostFilePk(newSystem);
					event.setEventFile(newEventFile);
				}
			}
			fcheckNew = true;
		}
		
		
		//상세페이지 이미지
		if(!fcheckDetailNew) {//input 있을 경우
			if(!fcheckDetailStage) { //input있고 원래 파일이 있었을 경우(수정)
				FileDTO newDetailFile = new FileDTO();
				newDetailFile.setPostFilePk(eventFileDetail);
				newDetailFile.setPostFileSystem(newDetailSystem);
				newDetailFile.setPostFileOrigin(newDetailOrigin);
				
				fcheckDetailStage = fdao.updateFile(newDetailFile);
				
			}
			else { //input있고 원래 파일 없었을 경우(파일x>파일추가)
				FileDTO newDetailFile = new FileDTO();
				newDetailFile.setPostFileSystem(newDetailSystem);
				newDetailFile.setPostFileOrigin(newDetailOrigin);
				if(fdao.insertFile(newDetailFile)) {
					int newEventDetailFile = fdao.getLastPostFilePk(newDetailSystem);
					event.setEventFileDetail(newEventDetailFile);
				}
			}
			fcheckDetailNew = true;
		}
		
		if(pdao.updatePost(post)) {
			if(edao.updateEvent(event)) {
				if(fcheckNew && fcheckStage && fcheckDetailNew && fcheckDetailStage) {
					transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
				}
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?u=f&eventPk="+eventPk);
		}
		return transfer;
	}
}
