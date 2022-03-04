package app.admin.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import action.ActionTo;

public class ChartShowOkAction implements Action{

	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		String url=req.getRequestURI();
		ChartService service= new ChartService();
		JSONObject json=service.createChart();
		req.setAttribute("data", json);
		ActionTo transfer = new ActionTo();
		transfer.setPath("app/admin/chart01_result.jsp");
		transfer.setRedirect(false);
		return transfer;
		
		// TODO Auto-generated method stub
		
	}

}
