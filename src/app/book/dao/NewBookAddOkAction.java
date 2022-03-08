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
		String rootPath = req.getSession().getServletContext().getRealPath("/");
        String saveFolder = rootPath+"media";
		
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
		int price = (Integer.parseInt(multi.getParameter("price")));
		String writer = multi.getParameter("writer");
		String translater = multi.getParameter("translater");
		String publisher = multi.getParameter("publisher");
		String created = multi.getParameter("created");
		String pages = multi.getParameter("pages");
		
		int mount = (Integer.parseInt(multi.getParameter("mount")));
//		String country = multi.getParameter("country");
//		String genre = multi.getParameter("genre");
		
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
		
		bdto.setBookMount(mount);
		bdto.setBookCountry(multi.getParameter("country"));
		bdto.setBookGenre(multi.getParameter("genre"));
		
		ActionTo transfer = new ActionTo();
		
		if(bdao.insertNewBook(bdto)) {
			if(!fcheck) {
				transfer.setRedirect(true);
				transfer.setPath(req.getContextPath()+"/book/NewBookList.nb");
				return transfer;
			}
		}
	
		transfer.setPath(req.getContextPath()+"/book/NewBookList.nb?w=f");
		return transfer;
	}
}
