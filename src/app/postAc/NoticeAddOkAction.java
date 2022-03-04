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
		FileDAO fdao = new FileDAO();
		
		//파일이 저장될 경로
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String saveFolder = rootPath+"media/post";	

		//저장될 파일의 크기(5MB)
		int size = 1024*1024*5;
		
		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck = false;
		
		//파일 시스템이름, 지정이름 받아오기
		String noticeFileSystem = multi.getFilesystemName("noticeFile");
		if(noticeFileSystem == null) {
			fcheck = true;
		}
		String noticeFileOrigin = multi.getOriginalFileName("noticeFile");
		
		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String noticePin = "";
		if(multi.getParameter("noticePin") != null) {
			noticePin = "Y";
		}else {
			noticePin = "N";
		}

//		int postOwner = ((UserDTO)req.getSession().getAttribute("loginUser")).getUserPk();
		int postOwner = 2;
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);
		post.setPostOwner(postOwner);
		notice.setNoticePin(noticePin);
		
		//페이지 보내기
		int postPk = 0;
		ActionTo transfer = new ActionTo();
		if(pdao.insertPost(post)) {
			postPk = pdao.getLastPostPk(postOwner);
			notice.setPostPk(postPk);
			if(!fcheck) { //첨부파일 존재
				FileDTO file = new FileDTO();
				file.setPostFileSystem(noticeFileSystem);
				file.setPostFileOrigin(noticeFileOrigin);
							
				if(fdao.insertFile(file)) {
					int noticeFile = fdao.getLastPostFilePk(noticeFileSystem);
					notice.setNoticeFile(noticeFile);
					if(ndao.insertNotice(notice)) {
						int noticePk = ndao.getLastNoticePk(postPk);
						
						transfer.setRedirect(true);
						transfer.setPath(req.getContextPath()+"/post/NoticeRead.po?noticePk="+noticePk);
						return transfer;
					}
				}
			}
			else{
				if(ndao.insertNotice(notice)) {
					int noticePk = ndao.getLastNoticePk(postPk);
					
					transfer.setRedirect(true);
					transfer.setPath(req.getContextPath()+"/post/NoticeRead.po?noticePk="+noticePk);
					return transfer;
				}
			}
		}					
		
		transfer.setPath(req.getContextPath()+"/post/NoticeList.po?w=f");	
		return transfer;
	}
}
