package app.book.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionTo;

public class NewBookAddOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BookDAO bdao = new BookDAO();
		String saveFolder = "C:\\jsp";
//		10MB
		int size = 1024*1024*10;
		
		//cos
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size, "UTF-8", new DefaultFileRenamePolicy());
		
		boolean  fcheck = false;
		
		String image = multi.getFilesystemName("chooseFile");
		if(image == null) {
			fcheck = true;
		}
		String orgImage = multi.getOriginalFileName("chooseFile");
		
		String title = multi.getParameter("title");
		String subtitle = multi.getParameter("subtitle");
		String info = multi.getParameter("info");
		String infoShort = multi.getParameter("infoShort");
		String price = multi.getParameter("price");
		String writer = multi.getParameter("writer");
		String translater = multi.getParameter("translater");
		String publisher = multi.getParameter("publisher");
		String created = multi.getParameter("created");
		String pages = multi.getParameter("pages");
//		String genre = multi.getParameter("");
		
		BookDTO bdto = new BookDTO();
		bdto.setBookTitle(title);
		bdto.setBookSubtitle(subtitle);
		bdto.setBookInfo(info);
		bdto.setBookInfoShort(infoShort);
		bdto.setBookPrice(price);
		bdto.setBookWriter(writer);
		bdto.setBookTranslater(translater);
		bdto.setBookPublisher(publisher);
		bdto.setBookCreated(created);
		bdto.setBookPages(pages);
		bdto.setBookImage(image);
		bdto.setBookOrgImage(orgImage);
		
		ActionTo transfer = new ActionTo();
		
		if(bdao.insertNewBook(bdto)) {
			if(!fcheck) {
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/book/BookRead.nb");
				return transfer;
			}
		}
	
		transfer.setPath(req.getContextPath()+"/book/BookRead.nb?w=f");
		return transfer;
	}
}
