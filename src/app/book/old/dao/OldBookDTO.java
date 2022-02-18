package app.book.old.dao;

import app.book.dao.BookDTO;

/**OldBookDTO 는 old_book 테이블 전용 DTO 입니다.<br>
 * 이는 총 세 개의 칼럼을 가집니다.<br>
 * 
 * 1. new_book_pk ((BookDTO) OldBookDTO.getBookPk)<br>
 * 2. old_book_pk (OldBookDTO.getOldBookPk)<br>
 * 3. old_book_discount (OldBookDTO.getOldBookDiscount)<br>
 * 
 * @author unchaptered
 * @version 2022-02-17
 */
public class OldBookDTO extends BookDTO {
	
	// Field Variables
	
	private int oldBookPk;
	private int oldBookDiscount;
	
	// Getter
	
	public int getOldBookPk() {
		return oldBookPk;
	}
	public int getOldBookDiscount() {
		return oldBookDiscount;
	}
	
	// Setter
	
	public void setOldBookPk(int oldBookPk) {
		this.oldBookPk = oldBookPk;
	}
	public void setOldBookDiscount(int oldBookDiscount) {
		this.oldBookDiscount = oldBookDiscount;
	}
	
	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		result+="oldBookPk : "+oldBookPk+"\n";
		result+="oldBookDiscount : "+oldBookDiscount+"\n";
		return result;
	}
	
	/**자식 클래스의 필드 멤버변수 비교를 통해 equals() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 equals() 가 재정의되면 이를 반영해야 합니다.
	 * 
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof OldBookDTO) {
			OldBookDTO oldBookDTO = (OldBookDTO) obj;
			
			if (oldBookDTO.getOldBookPk() != this.oldBookPk) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount() != this.oldBookDiscount) {
				return false;
			}
			
			return true;
		}
		return false;
	}
	
	/**곱하기 휴리스틱을 이용해서 hashCode() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 hashCode() 가 재정의되면 이를 반영해야 합니다.
	 */
	@Override
	public int hashCode() {
		int hashCode=1;
		hashCode = 31 * hashCode + this.oldBookPk;
		hashCode = 31 * hashCode + this.oldBookDiscount;		
		return hashCode;
	}
}