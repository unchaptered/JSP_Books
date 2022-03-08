package app.book.old;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionTo;

public class OldBookFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();		// ??????/user/UserJoin.us
		String contextPath = req.getContextPath();		// ??????
		String command = requestURI.substring(contextPath.length());//	/user/UserJoin.us
		
		ActionTo transfer = null;
		
		switch(command) {
			case "/book/OldBookList.ob":
				System.out.println("Old Book List page");
				
				try {
					transfer = new OldBookListAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("OldBookList error : "+ e );
				}
				
				break;
			case "/book/OldBookAdd.ob":
				System.out.println("Old Book Add page");
				
				try {
					transfer = new OldBookAddAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("OldBookAdd error : "+ e );
				}

				break;
			case "/book/OldBookAddFinish.ob":

				System.out.println("Old Book Add Finish page");
				
				try {
					transfer = new OldBookAddFinishAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("OldBookAddFinish error : "+ e );
				}
				
				break;
			case "/book/OldBookRead.ob":
				System.out.println("Old Book Read page");
				
				try {
					transfer = new OldBookReadAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("OldBookRead error : "+ e );
				}

				break;
		}
		
		if (transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
