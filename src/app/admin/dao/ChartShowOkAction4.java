package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.ActionTo;

public class ChartShowOkAction4 {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("확인4");
		String url=req.getRequestURI();
		ChartService service= new ChartService();
		JSONObject json=service.createChart4();
		System.out.println("json4 담겼나: "+json);
		req.setAttribute("data", json);
		ActionTo transfer = new ActionTo();
		transfer.setPath("/app/admin/visitorschart_result.jsp");
		transfer.setRedirect(false);
		return transfer;
		
		// TODO Auto-generated method stub
		
	}
}
