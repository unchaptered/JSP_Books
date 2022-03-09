package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.ActionTo;

public class ChartShowOkAction3 {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("확인3");
		String url=req.getRequestURI();
		ChartService service= new ChartService();
		JSONObject json=service.createChart3();
		System.out.println("json3 담겼나: "+json);
		req.setAttribute("data", json);
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/admin/orderchart_result.jsp");
		transfer.setRedirect(false);
		return transfer;
		
		// TODO Auto-generated method stub
		
	}
}
