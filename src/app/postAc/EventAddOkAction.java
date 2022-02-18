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
		EventDAO edao = new EventDAO();
		
		//파일이 저장될 경로
		String saveFolder = "C:\\jsp_file";
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
		EventDTO post = new EventDTO();
		
		String postTitle = multi.getParameter("postTitle");
		String eventStarted = multi.getParameter("eventStarted");
		String eventEnded = multi.getParameter("eventEnded");
		
		String postText = multi.getParameter("postText");
		
		int postOwner = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_pk();
		
		post.setPostTitle(postTitle);
		post.setEventStarted(eventStarted);
		post.setEventEnded(eventEnded);		
		post.setPostText(postText);	
		post.setPostOwner(postOwner);
		
		PostDAO pdao = new PostDAO();
		String ownerName = pdao.getOwnerName(postOwner);
		
		req.setAttribute("ownerName", ownerName);
		
		//페이지 보내기
		int postPk = 0;
		ActionTo transfer = new ActionTo();
		if(edao.insertEvent(post)) {
			FileDAO fdao = new FileDAO();
			postPk = pdao.getLastPostPk(postOwner);
			
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setPostPk(postPk);
				file.setPostFilesSystem(systemname1);
				file.setPostFilesOrigin(orgname1);
				
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setPostFilesPk(postPk);
				file.setPostFilesSystem(systemname2);
				file.setPostFilesOrigin(orgname2);
				
				fcheck2 = fdao.insertFile(file);
			}
			if(fcheck1 && fcheck2) {
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?postPk="+postPk);
				return transfer;
			}
		}
		else {
			
		}
		transfer.setPath(req.getContextPath()+"/app/post/EventList.po?w=f");	
		return transfer;
	}
}
