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
		
		newUser.setUser_email("user_email");
		newUser.setUser_name("user_name");
		newUser.setUser_password("user_password");
		newUser.setUser_phone("user_phone");
		newUser.setUser_zipcode("user_zipcode");
		newUser.setUser_address("user_address");
		newUser.setUser_address_detail("user_address_detail");
		newUser.setUser_address_etc("user_address_etc");
		newUser.setUser_bank("user_bank");
		newUser.setUser_bank_account("user_bank_account");
		
		ActionTo transfer = new ActionTo();
		if(udao.join(newUser)) {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/app/components/nav.jsp"); 
		}
		else {
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/index.jsp"); 
		}
		return transfer;
	}
}
