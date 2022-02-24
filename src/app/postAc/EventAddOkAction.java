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
		
		EventDAO edao = new EventDAO();
		PostDAO pdao = new PostDAO();
		
		//파일이 저장될 경로
		String saveFolder = "C:\\";

		//저장될 파일의 크기(5MB)
		int size = 1024*1024*5;

		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		String systemname1 = multi.getFilesystemName("inputFileToList");
		if(systemname1 == null) {
			fcheck1 = true;
		}
		String orgname1 = multi.getOriginalFileName("inputFileToList");
		
		String systemname2 = multi.getFilesystemName("inputFileToRead");
		if(systemname2 == null) {
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("inputFileToRead");

		//EventDTO	
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String eventStarted = multi.getParameter("eventStarted");
		String eventEnded = multi.getParameter("eventEnded");		

		int postOwner = ((UserDTO)req.getSession().getAttribute("loginUser")).getUserPk();
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
			if(edao.insertEvent(event)) {
				FileDAO fdao = new FileDAO();		
				if(!fcheck1) {
					FileDTO file = new FileDTO();
					file.setPostPk(postPk);
					file.setPostFileSystem(systemname1);
					file.setPostFileOrigin(orgname1);
					
					fcheck1 = fdao.insertFile(file);
				}
				if(!fcheck2) {
					FileDTO file = new FileDTO();
					file.setPostFilePk(postPk);
					file.setPostFileSystem(systemname2);
					file.setPostFileOrigin(orgname2);
					
					fcheck2 = fdao.insertFile(file);
				}
				if(fcheck1 && fcheck2) {
					int eventPk = event.getEventPk();
					
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
