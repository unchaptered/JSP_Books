package app.admin.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import action.ActionTo;
import app.admin.dao.ChartDAO;
import app.admin.dao.ChartDTO;

public class getChart1Show implements Action {

	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		ActionTo transfer = new ActionTo();
		ChartDAO chartDao = new ChartDAO();
		List<ChartDTO> items = chartDao.buy_price();
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "title");
		col1.put("type", "string");
		col2.put("label", "price");
		col2.put("type", "number");
		part.add(col1); 
		part.add(col2);
		data.put("cols", part);
		JSONArray body= new JSONArray();
		for(ChartDTO dto : items) {
			JSONObject title = new JSONObject();
			title.put("v",dto.getTitle());
			JSONObject price=new JSONObject();
			price.put("v",dto.getPrice());
			JSONArray row=new JSONArray();
			row.add(title);
			row.add(price);
			JSONObject cell= new JSONObject();
			cell.put("c",row);
			body.add(cell);
		}
		data.put("rows", body);
		return transfer;
	}

}
