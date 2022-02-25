package app.postAc;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionTo;
import app.post.dao.FileDAO;
import app.post.dao.FileDTO;
import app.post.dao.NoticeDAO;
import app.post.dao.NoticeDTO;
import app.post.dao.PostDAO;
import app.post.dao.PostDTO;

public class NoticeEditOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = "C:\\jsp_file";
		int size = 5*1024*1024;
		
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String noticePin = multi.getParameter("noticePin");
		int noticePk = Integer.parseInt(multi.getParameter("noticePk"));
		
		PostDTO post = new PostDTO();
		NoticeDTO notice = new NoticeDTO();
		NoticeDTO ndto = ndao.getNoticeRead(noticePk);
		int postPk = ndto.getPostPk();
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);
		if(noticePin == "on") {
			notice.setNoticePin("Y");
		}
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(pdao.updatePost(post)) {
			if(ndao.updateNotice(notice)) {
				String systemname = multi.getFilesystemName("noticeFile");
				String orgname = multi.getOriginalFileName("noticeFile");
				
				FileDTO oldFile = fdao.getFile(postPk);
				
				String newFilename = multi.getParameter("noticeFileName");
				
				if(newFilename != null && !newFilename.equals("")) {
					if(systemname == null) {						
					}
					else {
						if(oldFile != null) {
							File file = new File(saveFolder, oldFile.getPostFileSystem());
							
							if(file.exists()) {
								file.delete();
							}
							fdao.deleteByName(oldFile.getPostFileSystem());
						}
						FileDTO newFile = new FileDTO();
						newFile.setPostPk(postPk);
						newFile.setPostFileSystem(systemname);
						newFile.setPostFileOrigin(orgname);
						fdao.insertFile(newFile);
						transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?noticePk="+noticePk);
					}
				}
			}
		}else {
			transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?u=f&noticePk="+noticePk);
		}
		return transfer;
	}		
}