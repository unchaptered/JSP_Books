package app.admin.dao;

import java.util.List;
import app.admin.dao.ChartDAO;
import app.admin.dao.ChartDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ChartService {
	public JSONObject createChart() {
		System.out.println("들어왔니");
		ChartDAO chartDao = new ChartDAO();
		List<ChartDTO> items = chartDao.buy_price();
		System.out.println(items);
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "title");
		col1.put("type", "string");
		col2.put("label", "price");
		col2.put("type", "number");
		System.out.println(col1);
		System.out.println(col2);
		part.add(col1); 
		part.add(col2);
		System.out.println(part);
		data.put("cols", part);
		System.out.println(data);
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
		System.out.println(data);
		return data;
		
	}
}
