package app.book.dao;

import java.util.List;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionTo;

public class NewBookEditOkAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String saveFolder = "D:\\Code - GitHub Dessktop(Repository)\\project-2021-korea-it-acamedy\\Java\\workspace\\project-2022-01-korea-Books\\WebContent\\media";
        
//		10MB
		int size = 1024*1024*10;
		
		BookDAO bdao = new BookDAO();
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size, "UTF-8", new DefaultFileRenamePolicy());
		
		int bookPk = (Integer.parseInt(multi.getParameter("bookPk")));
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
		String country = multi.getParameter("country");
		String genre = multi.getParameter("genre");
		
		BookDTO bdto = new BookDTO();
		bdto.setBookPk(bookPk);
		bdto.setBookTitle(title);
		bdto.setBookSubtitle(subtitle);
		bdto.setBookInfo(info);
		bdto.setBookInfoShort(infoShort);
		bdto.setBookPrice((Integer)price);
		bdto.setBookWriter(writer);
		bdto.setBookTranslater(translater);
		bdto.setBookPublisher(publisher);
		bdto.setBookCreated(created);
		bdto.setBookPages(pages);
		
		bdto.setBookMount((Integer)mount);
		bdto.setBookCountry(country);
		bdto.setBookGenre(genre);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		if(bdao.updateBook(bdto)) {
			String image = multi.getFilesystemName("chooseFile");
			String orgImage = multi.getOriginalFileName("chooseFile");
			
			List<BookDTO> bookList = bdao.getBook(bookPk);
			String[] updateBook = multi.getParameterValues("fileName");
			int cnt = 0;
			for (int i = 0; i < updateBook.length; i++) {
				if(updateBook[i] != null && !updateBook[i].equals("")) {
					cnt++;
				}
			}
			for (int i = 0; i < cnt; i++) {
				if(image==null) {
					;
				}else {
					if(bookList.size() > i) {
						File book = new File(saveFolder, bookList.get(i).getBookImage());
						if(book.exists()) {
							book.delete();
						}
						bdao.deleteByName(bookList.get(i).getBookImage());
					}
					bdto.setBookPk(bookPk);
					bdto.setBookImage(image);
					bdto.setBookOrgImage(orgImage);
					bdao.insertNewBook(bdto);
				}
			}
			transfer.setPath(req.getContextPath()+"/book/NewBookList.nb");
		}
		
		
		return transfer;
	}
}
