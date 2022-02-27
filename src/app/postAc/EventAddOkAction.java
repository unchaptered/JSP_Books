package app.postAc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.user.dao.UserDTO;
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

public class EventAddOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EventDTO event = new EventDTO();
		PostDTO post = new PostDTO();
		
		FileDAO fdao = new FileDAO();
		PostDAO pdao = new PostDAO();
		EventDAO edao = new EventDAO();
		
		//파일이 저장될 경로
		String rootPath = req.getSession().getServletContext().getRealPath("/");
	
		String saveFolder = rootPath+"media";	
		
		//저장될 파일의 크기(5MB)
		int size = 1024*1024*5;

		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		String eventFileSystem = multi.getFilesystemName("eventFile");
		if(eventFileSystem == null) {
			fcheck1 = true;
		}
		String eventFileOrigin = multi.getOriginalFileName("eventFile");
		
		String eventFileDetailSystem = multi.getFilesystemName("eventFileDetail");
		if(eventFileDetailSystem == null) {
			fcheck2 = true;
		}
		String eventFileDetailOrigin = multi.getOriginalFileName("eventFileDetail");

		//EventDTO	
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String eventStarted = multi.getParameter("eventStarted");
		String eventEnded = multi.getParameter("eventEnded");		

//		int postOwner = ((UserDTO)req.getSession().getAttribute("loginUser")).getUserPk();
		int postOwner = 2;
//		int postOwner = pdao.getPostOwner(ownerEmail);
//		String ownerName = pdao.getOwnerName(ownerEmail);
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);	
		post.setPostOwner(postOwner);
		
		event.setEventStarted(eventStarted);
		event.setEventEnded(eventEnded);		
		
		//페이지 보내기
		int postPk = 0;
		ActionTo transfer = new ActionTo();
		if(pdao.insertPost(post)) {
			postPk = pdao.getLastPostPk(postOwner);
			event.setPostPk(postPk);
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setPostFileSystem(eventFileSystem);
				file.setPostFileOrigin(eventFileOrigin);
					
				if(fdao.insertFile(file)) {
					int eventFile = fdao.getLastPostFilePk(eventFileSystem);
					event.setEventFile(eventFile);
					fcheck1 = true;
				}	
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setPostFileSystem(eventFileDetailSystem);
				file.setPostFileOrigin(eventFileDetailOrigin);
					
				if(fdao.insertFile(file)) {
					int eventFileDetail = fdao.getLastPostFilePk(eventFileDetailSystem);
					event.setEventFileDetail(eventFileDetail);
					fcheck2 = true;
				}	
			}
			if(fcheck1 && fcheck2) {
				if(edao.insertEvent(event)) {
					int eventPk = edao.getLastEventPk(postPk);
					
					transfer.setRedirect(true);
					transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
					return transfer;
				}
			}
		}	
		transfer.setPath(req.getContextPath()+"/app/post/EventList.po?w=f");	
		return transfer;
	}
}
