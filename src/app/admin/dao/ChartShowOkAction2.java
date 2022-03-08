package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.ActionTo;

public class ChartShowOkAction2 {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("확인");
		String url=req.getRequestURI();
		ChartService service= new ChartService();
		JSONObject json=service.createChart2();
		req.setAttribute("data", json);
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/admin/saleschart_result.jsp");
		transfer.setRedirect(false);
		return transfer;
		
		// TODO Auto-generated method stub
		
	}
}
