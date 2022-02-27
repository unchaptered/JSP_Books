package app.postAc;

import java.io.File;
import java.util.List;

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
		String saveFolder = "C:\\0900_GB_KSY";
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

		int eventFilePk = event.getEventFile();
		int eventFileDetailPk = event.getEventFileDetail();
		fdao.removeFile(eventFilePk);
		fdao.removeFile(eventFileDetailPk);
		
		//페이지 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		String newOrigin = multi.getOriginalFileName("eventFile");
		String newSystem = multi.getFilesystemName("eventFile");
		String stageOrigin = multi.getOriginalFileName("stageEventFileOrigin");
		String stageSystem = multi.getFilesystemName("stageEventFileSystem");
		
		String newDetailOrigin = multi.getOriginalFileName("eventFileDetail");
		String newDetailSystem = multi.getFilesystemName("eventFileDetail");
		String stageDetailOrigin = multi.getOriginalFileName("stageEventFileDetailOrigin");
		String stageDetailSystem = multi.getFilesystemName("stageEventFileDetailSystem");
		
		if(newSystem == null) {
			if(stageSystem != null || stageSystem != "") {
				FileDTO stageFile = new FileDTO();
				stageFile.setPostFileSystem(stageSystem);
				stageFile.setPostFileOrigin(stageOrigin);
				if(fdao.insertFile(stageFile)) {
					int stageEventFile = fdao.getLastPostFilePk(stageSystem);
					event.setEventFile(stageEventFile);
				}
			}
		}
		else {
			FileDTO newFile = new FileDTO();
			newFile.setPostFileSystem(newSystem);
			newFile.setPostFileOrigin(newOrigin);
			if(fdao.insertFile(newFile)){
				int newEventFile = fdao.getLastPostFilePk(newSystem);
				event.setEventFile(newEventFile);
			}
		}
		if(newDetailSystem == null) {
			if(stageDetailSystem != null || stageDetailSystem != "") {
				FileDTO stageDetailFile = new FileDTO();
				stageDetailFile.setPostFileSystem(stageDetailSystem);
				stageDetailFile.setPostFileOrigin(stageDetailOrigin);
				if(fdao.insertFile(stageDetailFile)) {
					int stageEventDetailFile = fdao.getLastPostFilePk(stageDetailSystem);
					event.setEventFile(stageEventDetailFile);
				}
			}
		}
		else {
			FileDTO newDetailFile = new FileDTO();
			newDetailFile.setPostFileSystem(newDetailSystem);
			newDetailFile.setPostFileOrigin(newDetailOrigin);
			if(fdao.insertFile(newDetailFile)){
				int newEventDetailFile = fdao.getLastPostFilePk(newDetailSystem);
				event.setEventFile(newEventDetailFile);
			}
		}
			
		if(pdao.updatePost(post)) {
			if(edao.updateEvent(event)) {
				transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?u=f&eventPk="+eventPk);
		}
		return transfer;
	}
}
