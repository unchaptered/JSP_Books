package app.user.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class UserInfoChangeOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		udto.setUserEmail(req.getParameter("user_email_text"));
		udto.setUserName(req.getParameter("user_name_text"));
		udto.setUserPhone(req.getParameter("user_phone_text"));
		udto.setUserZipcode(req.getParameter("postcode"));
		udto.setUserAddress(req.getParameter("address"));
		udto.setUserAddressDetail(req.getParameter("detailAddress"));
		udto.setUserAddressEtc(req.getParameter("extraAddress"));
		udto.setUserBank(req.getParameter("bank"));
		udto.setUserBankAccount(req.getParameter("banknum"));
		
		ActionTo transfer = new ActionTo();
		if(udao.infoChange(udto)) {
			transfer.setPath(req.getContextPath()+"/app/user/user_info.jsp?ch=t");
			transfer.setRedirect(true);
		}else {
			transfer.setPath(req.getContextPath()+"/app/user/user_info.jsp?ch=f");
			transfer.setRedirect(true);
		}
		return transfer;
	}
}
