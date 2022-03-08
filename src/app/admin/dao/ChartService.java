package app.admin.dao;

import java.util.List;
import app.admin.dao.ChartDAO;
import app.admin.dao.ChartDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ChartService {
	public JSONObject createChart1() {
		ChartDAO chartDao = new ChartDAO();
		List<ChartDTO> items = chartDao.buy_price();
		System.out.println(items);
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "title");
		col1.put("type", "string");
		col2.put("label", "등록된 상품수");
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
			title.put("v",dto.getNewbooktitle());
			JSONObject mount=new JSONObject();
			mount.put("v",dto.getNewbookmount());
			JSONArray row=new JSONArray();
			row.add(title);
			row.add(mount);
			JSONObject cell= new JSONObject();
			cell.put("c",row);
			body.add(cell);
		}
		data.put("rows", body);
		System.out.println(data);
		return data;
		
	}
	
	public JSONObject createChart2() {
		ChartDAO chartDao = new ChartDAO();
		System.out.println("DB 데이터 넣기전");
		List<ChartDTO> items2 = chartDao.buy_price2();
		System.out.println(items2);
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "date");
		col1.put("type", "string");
		col2.put("label", "실시간별 결제금액");
		col2.put("type", "number");
		System.out.println(col1);
		System.out.println(col2);
		part.add(col1); 
		part.add(col2);
		System.out.println(part);
		data.put("cols", part);
		System.out.println(data);
		JSONArray body= new JSONArray();
		for(ChartDTO dto : items2) {
			JSONObject date = new JSONObject();
			date.put("v", dto.getBilldate());
			JSONObject price=new JSONObject();
			price.put("v", Integer.parseInt(dto.getBillprice()));
			JSONArray row=new JSONArray();
			row.add(date);
			row.add(price);
			JSONObject cell= new JSONObject();
			cell.put("c",row);
			body.add(cell);
		}
		data.put("rows", body);
		System.out.println(data);
		return data;
		
	}
	
	public JSONObject createChart3() {
		ChartDAO chartDao = new ChartDAO();
		System.out.println("DB 데이터 넣기전");
		List<ChartDTO> items3 = chartDao.buy_price3();
		System.out.println(items3);
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "book");
		col1.put("type", "string");
		col2.put("label", "상품별 주문건수");
		col2.put("type", "number");
		System.out.println(col1);
		System.out.println(col2);
		part.add(col1); 
		part.add(col2);
		System.out.println(part);
		data.put("cols", part);
		System.out.println(data);
		JSONArray body= new JSONArray();
		for(ChartDTO dto : items3) {
			JSONObject date = new JSONObject();
			date.put("v", dto.getNew_book_pk());
			JSONObject price=new JSONObject();
			price.put("v", dto.getOrdercount());
			JSONArray row=new JSONArray();
			row.add(date);
			row.add(price);
			JSONObject cell= new JSONObject();
			cell.put("c",row);
			body.add(cell);
		}
		data.put("rows", body);
		System.out.println(data);
		return data;
		
	}
	public JSONObject createChart4() {
		ChartDAO chartDao = new ChartDAO();
		System.out.println("DB 데이터 넣기전");
		List<ChartDTO> items4 = chartDao.buy_price4();
		System.out.println(items4);
		JSONObject data= new JSONObject();
		JSONObject col1= new JSONObject();
		JSONObject col2= new JSONObject();
		JSONArray part= new JSONArray();
		col1.put("label", "date");
		col1.put("type", "string");
		col2.put("label", "금액(원)");
		col2.put("type", "number");
		System.out.println(col1);
		System.out.println(col2);
		part.add(col1); 
		part.add(col2);
		System.out.println(part);
		data.put("cols", part);
		System.out.println(data);
		JSONArray body= new JSONArray();
		for(ChartDTO dto : items4) {
			JSONObject date = new JSONObject();
			date.put("v", dto.getUsername());
			JSONObject price=new JSONObject();
			price.put("v", (int) Double.parseDouble(dto.getOnedaytotal()));
			JSONArray row=new JSONArray();
			row.add(date);
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
