package app.book.old.dao;

import app.book.dao.BookDTO;

/**OldBookDTO 는 old_book 테이블 전용 DTO 입니다. <br>
 * 이는 총 1 (FK) + 1 (FK) + 3 개의 칼럼을 가집니다. <br><br>
 * 
 * 1. bookPk (FK)			= (BookDTO) this.getBookPk <br>
 * 2. oldBookPk				= this.getOldBookPk() <br>
 * 3. userPk				= this.getUserPk() <br>
 * 4. adminPk				= this.getAdminPk() <br>
 * 5. oldBookDiscount (FK)	= this.getOldBookDiscount() <br>
 * 
 * @author unchaptered
 * @version 2022-03-07
 */
public class OldBookDTO extends BookDTO {
	
	// Field Variables
	
	private int oldBookPk;
	private int userPk;
	private int adminPk;
	private int oldBookDiscount; // 할인율
	private int oldBookMount; // 해당 할인율의 수량
	
	// Getter
	
	public int getOldBookPk() {
		return oldBookPk;
	}
	public int getUserPk() {
		return userPk;
	}
	public int getAdminPk() {
		return adminPk;
	}
	public int getOldBookDiscount() {
		return oldBookDiscount;
	}
	public int getOldBookMount() {
		return oldBookMount;
	}
	
	// Setter
	
	public void setOldBookPk(int oldBookPk) {
		this.oldBookPk = oldBookPk;
	}

	public void setUserPk(int userPk) {
		this.userPk = userPk;
	}

	public void setAdminPk(int adminPk) {
		this.adminPk = adminPk;
	}
	public void setOldBookDiscount(int oldBookDiscount) {
		this.oldBookDiscount = oldBookDiscount;
	}
	public void setOldBookMount(int oldBookMount) {
		this.oldBookMount = oldBookMount;
	}

	
	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		
		result += "oldBookPk : " + oldBookPk + "\n";
		result += "userPk : " + userPk + "\n";
		result += "adminPk : " + adminPk + "\n";
		result += "oldBookDiscount : " + oldBookDiscount + "\n";
		result += "oldBookMount : " + oldBookMount + "\n";
		
		return result;
	}

	/**자식 클래스의 필드 멤버변수 비교를 통해 equals() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 equals() 가 재정의되면 이를 반영해야 합니다.
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof OldBookDTO) {
			OldBookDTO oldBookDTO = (OldBookDTO) obj;
			
			if (oldBookDTO.getOldBookPk() != this.oldBookPk) {
				return false;
			} else if (oldBookDTO.getUserPk() != this.userPk) {
				return false;
			} else if (oldBookDTO.getAdminPk() != this.adminPk) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount() != this.oldBookDiscount) {
				return false;
			}
			
			// 모든 값이 동일할 때, ...
			return true;
		}
		// 매개변수로, 잘못된 Object 가 들어왔을 때...
		return false;
	}
	
	/**곱하기 휴리스틱을 이용해서 hashCode() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 hashCode() 가 재정의되면 이를 반영해야 합니다.
	 */
	@Override
	public int hashCode() {
		int hashCode = 1;
		
		hashCode = 31 * hashCode + this.oldBookPk;
		hashCode = 31 * hashCode + this.userPk;
		hashCode = 31 * hashCode + this.adminPk;
		hashCode = 31 * hashCode + this.oldBookDiscount;
		
		return hashCode;
	}
}
