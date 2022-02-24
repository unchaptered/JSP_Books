package app.postAc;

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
import app.user.dao.UserDTO;

public class NoticeAddOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDTO notice = new NoticeDTO();
		PostDTO post = new PostDTO();
		
		NoticeDAO ndao = new NoticeDAO();
		PostDAO pdao = new PostDAO();
		
		//파일이 저장될 경로
		String saveFolder = "C:\\";

		//저장될 파일의 크기(5MB)
		int size = 1024*1024*5;
		
		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck = false;
		
		String systemname = multi.getFilesystemName("noticeFile");
		if(systemname == null) {
			fcheck = true;
		}
		String orgname = multi.getOriginalFileName("noticeFile");
		
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String noticePin = multi.getParameter("noticePin");
		
		int postOwner = ((UserDTO)req.getSession().getAttribute("loginUser")).getUserPk();
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);
		post.setPostOwner(postOwner);
		if(noticePin == "on") {
			notice.setNoticePin("Y");
		}else {
			notice.setNoticePin("N");
		}
		
		//페이지 보내기
		int postPk = 0;
		ActionTo transfer = new ActionTo();
		if(pdao.insertPost(post)) {
			postPk = pdao.getLastPostPk(postOwner);
			notice.setPostPk(postPk);
			if(ndao.insertNotice(notice)) {
				FileDAO fdao = new FileDAO();		
				if(!fcheck) {
					FileDTO file = new FileDTO();
					file.setPostPk(postPk);
					file.setPostFileSystem(systemname);
					file.setPostFileOrigin(orgname);
							
					fcheck = fdao.insertFile(file);
				}
						
				if(fcheck) {
				int noticePk = notice.getNoticePk();
				
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?noticePk="+noticePk);
				return transfer;
				}
			}					
		}
		transfer.setPath(req.getContextPath()+"/app/post/NoticeList.po?w=f");	
		return transfer;
	}
}
