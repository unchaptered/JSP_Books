package app.book.old.dao;

import java.util.ArrayList;
import java.util.List;

/**OldBookInventory 는 OldBook 의 할인율 (10,20,30,40,50) 별 재고 수량을 집계하기 위해서 만든 유틸리티 클래스입니다. <br>
 * 
 * 1. List <OldBookDTO> oldBookInventory = null;
 * 
 * @author unchaptered
 * @version 2022-03-08
 */
public class OldBookInventory {
	
	// Field Variables

	private static List<OldBookDTO> oldBookInventory = null;
	
	// Get,Set,Remove Instance
	
	/** static List <OldBookDTO> oldBookInventory 를 초기화하고 Instance 반환
	 * 
	 * @return List < OldBookDTO >
	 */
	public static List<OldBookDTO> getInstance() {
		if (oldBookInventory != null) {
			removeInstance();
		}
		
		return oldBookInventory;
	}
	
	/**길이가 6인 ArrayList<OldBookDTO> 를 만든다.
	 * 
	 */
	public static void setInstance() {
		if (oldBookInventory != null) {
			removeInstance();
		}
		
		oldBookInventory = new ArrayList<OldBookDTO>(6);
	}
	

	public static void setInstance(int size) {
		if (oldBookInventory != null) {
			removeInstance();
		}
		
		oldBookInventory = new ArrayList<OldBookDTO>(size);
	}
	
	public static void removeInstance() {
		oldBookInventory = null;
	}

	// Getter
	
	public List<OldBookDTO> getOldBookInventory() {
		return oldBookInventory;
	}

	// Setter
	
	public void setOldBookInventory(List<OldBookDTO> oldBookInventory) {
		this.oldBookInventory = oldBookInventory;
	}
	
	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		
		for (OldBookDTO oldBookDTO : oldBookInventory) {
			result += oldBookDTO.toString();
		}
		
		return result;
	}

	/**자식 클래스의 필드 멤버변수 비교를 통해 equals() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 equals() 가 재정의되면 이를 반영해야 합니다.
	 */
	@Override
	public boolean equals(Object obj) {
		return true;
	}
	
	/**곱하기 휴리스틱을 이용해서 hashCode() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 hashCode() 가 재정의되면 이를 반영해야 합니다.
	 */
	@Override
	public int hashCode() {
		int hashCode = 1;
		
		for (OldBookDTO oldBookDTO : oldBookInventory) {
			hashCode = 31 * hashCode + oldBookDTO.hashCode();
		}
		
		return hashCode;
	}
}
