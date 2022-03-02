package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class UserJoinOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO newUser = new UserDTO();
		
		newUser.setUserEmail(req.getParameter("userEmail"));
		newUser.setUserName(req.getParameter("userName"));
		newUser.setUserPassword(req.getParameter("userPassword"));
		newUser.setUserPhone(req.getParameter("userPhone"));
		newUser.setUserZipcode(req.getParameter("userZipcode"));
		newUser.setUserAddress(req.getParameter("userAddress"));
		newUser.setUserAddressDetail(req.getParameter("userAddressDetail"));
		newUser.setUserAddressEtc(req.getParameter("userAddressEtc"));
		newUser.setUserBank(req.getParameter("userBank"));
		newUser.setUserBankAccount(req.getParameter("userBankAccount"));
		
		
		ActionTo transfer = new ActionTo();
		if(udao.join(newUser)) {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp?join=t"); 
		}
		else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp?join=f"); 
		}
		return transfer;
	}
}
