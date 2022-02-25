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
		String saveFolder = "C:\\jsp_file";
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
		
		System.out.println(eventPk);
		
		PostDTO post = new PostDTO();
		EventDTO event = new EventDTO();
		EventDTO edto = edao.getEventRead(eventPk);
		int postPk = edto.getPostPk();
		
		System.out.println(postPk);
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);
		event.setEventStarted(eventStarted);
		event.setEventEnded(eventEnded);
		
		System.out.println("액션 전");
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(pdao.updatePost(post)) {
			if(edao.updateEvent(event)) {
				String[] systemname = {
					multi.getFilesystemName("inputFileToList"),
					multi.getFilesystemName("inputFileToRead")
				};
				String[] orgname = {
					multi.getOriginalFileName("inputFileToList"),
					multi.getOriginalFileName("inputFileToRead")
				};
				
				List<FileDTO> files = fdao.getFile(postPk);
				
				String[] newFilenames = multi.getParameterValues("filename");
				
				int cnt = 0;
				for (int i = 0; i < newFilenames.length; i++) {
					if(newFilenames[i] != null && !newFilenames[i].equals("")) {
						cnt++;
					}
				}
				
				for (int i = 0; i < cnt; i++) {
					if(systemname[i] == null) {
						
					}
					else {
						if(files.size()>i) {
							File file = new File(saveFolder,files.get(i).getPostFileSystem());
							
							if(file.exists()) {
								file.delete();
							}
							fdao.deleteByName(files.get(i).getPostFileSystem());
						}
						FileDTO fdto = new FileDTO();
						fdto.setPostPk(postPk);
						fdto.setPostFileSystem(systemname[i]);
						fdto.setPostFileOrigin(orgname[i]);
						fdao.insertFile(fdto);
					}
				}
				transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?eventPk="+eventPk);
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/EventRead.po?u=f&eventPk="+eventPk);
		}
		return transfer;
	}
}
