//저자 : carpriceksy
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

public class NoticeEditOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		
		String saveFolder = rootPath+"media";
		
		int size = 5*1024*1024;
		
		PostDAO pdao = new PostDAO();
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());

		String postTitle = multi.getParameter("postTitle");
		String postText = multi.getParameter("postText");
		String noticePin = "";

		if(multi.getParameter("noticePin") != null) {
			noticePin = "Y";
		}else {
			noticePin = "N";
		}

		int noticePk = Integer.parseInt(multi.getParameter("noticePk"));

		NoticeDTO notice = ndao.getNoticeRead(noticePk);
		int postPk = notice.getPostPk();
		
		PostDTO post = pdao.getPostRead(postPk);
		
		post.setPostTitle(postTitle);
		post.setPostText(postText);

		notice.setNoticePin(noticePin);
		
		int noticeFile = notice.getNoticeFile();
		
		//페이지 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		String newOrigin = multi.getOriginalFileName("noticeFile");
		
		String newSystem = multi.getFilesystemName("noticeFile");
		
		boolean fcheckNew = false;
		boolean fcheckStage = false;
		
		if(newSystem == null) {
			fcheckNew = true;
		}
		if(noticeFile == 0) {
			fcheckStage = true;
		}
		
		if(!fcheckNew) { //input file이 있을 때
			if(!fcheckStage) { //input도 있고 stage 존재 (파일 수정)			
				FileDTO newFile = new FileDTO();
				newFile.setPostFilePk(noticeFile);
				newFile.setPostFileSystem(newSystem);
				newFile.setPostFileOrigin(newOrigin);
				fcheckStage = fdao.updateFile(newFile);
			}
			else {//input 있고 원래 파일 x (파일x>파일추가)
				FileDTO newFile = new FileDTO();
				newFile.setPostFileSystem(newSystem);
				newFile.setPostFileOrigin(newOrigin);
				if(fdao.insertFile(newFile)) {
					int newNoticeFile = fdao.getLastPostFilePk(newSystem);
					notice.setNoticeFile(newNoticeFile);
				}
			}
			fcheckNew = true;
		}
		if(pdao.updatePost(post)) {
			if(ndao.updateNotice(notice)) {
				if(fcheckNew && fcheckStage) {
					transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?noticePk="+noticePk);
				}
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?u=f&noticePk="+noticePk);
		}
		return transfer;
	}		
}