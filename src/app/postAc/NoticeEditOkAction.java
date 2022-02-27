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
//첨부파일 삭제만 하면 끝
public class NoticeEditOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = "C:\\0900_GB_KSY";
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
		fdao.removeFile(noticeFile);
		
		//페이지 보내기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		String newOrigin = multi.getOriginalFileName("noticeFile");
		System.out.println("newOrigin : "+newOrigin);
		
		String newSystem = multi.getFilesystemName("noticeFile");
		System.out.println("newSystem : "+newSystem);
		
		String stageOrigin = multi.getParameter("stageOrigin");
		System.out.println("stageOrigin : "+ stageOrigin);
		
		String stageSystem = multi.getParameter("stageSystem");
		System.out.println("stageSystem : "+ stageSystem);
		
		if(newSystem == null) { //input file이 없을 때
			if(stageSystem != null || stageSystem != "") { //stage 존재 (파일 유지)
				FileDTO stageFile = new FileDTO();
				stageFile.setPostFileSystem(stageSystem);
				stageFile.setPostFileOrigin(stageOrigin);
				if(fdao.insertFile(stageFile)) {
					int stageNoticeFile = fdao.getLastPostFilePk(stageSystem);
					notice.setNoticeFile(stageNoticeFile);
				}
			}
//			else { //원래 파일 없었을 때 (파일x > 파일x)
//			}
		}
		else {// newSystem != null (파일 o > 파일 수정 or 파일x > 파일o)		
			FileDTO newFile = new FileDTO();
			newFile.setPostFileSystem(newSystem);
			newFile.setPostFileOrigin(newOrigin);
			if(fdao.insertFile(newFile)){
				int newNoticeFile = fdao.getLastPostFilePk(newSystem);
				notice.setNoticeFile(newNoticeFile);
			}
		}
		
		if(pdao.updatePost(post)) {
			if(ndao.updateNotice(notice)) {
				transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?noticePk="+noticePk);
			}
		}else {
			transfer.setPath(req.getContextPath()+"/app/post/NoticeRead.po?u=f&noticePk="+noticePk);
		}
		return transfer;
	}		
}