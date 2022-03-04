package app.admin.dao;

import java.util.ArrayList;

public class Main  {
	public Main() {
	String title = "하드웨어 판매량";
	ArrayList<PieElement> list = new ArrayList<PieElement>();
	list.add(new PieElement("모니터",49));
	list.add(new PieElement("키보드",358));
	list.add(new PieElement("마우스",49));
	list.add(new PieElement("어댑터",49));
	
	}
}
