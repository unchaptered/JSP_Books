package app.book.old.dao;

import app.book.dao.BookDTO;

/**OldBookDTO 는 old_book 테이블 전용 DTO 입니다.<br>
 * 이는 총 1 + 1 + 5 개의 칼럼을 가집니다.<br>
 * 
 * 1. new_book_pk ((BookDTO) OldBookDTO.getBookPk)<br>
 * 2. old_book_pk (OldBookDTO.getOldBookPk)<br>
 * 3. old_book_discount_10 (OldBookDTO.getOldBookDiscount10)<br>
 * 4. old_book_discount_20 (OldBookDTO.getOldBookDiscount20)<br>
 * 5. old_book_discount_30 (OldBookDTO.getOldBookDiscount30)<br>
 * 6. old_book_discount_40 (OldBookDTO.getOldBookDiscount40)<br>
 * 7. old_book_discount_50 (OldBookDTO.getOldBookDiscount50)<br>
 * 
 * @author unchaptered
 * @version 2022-02-25
 */
public class OldBookDTO extends BookDTO {
	
	// Field Variables
	
	private int oldBookPk;
	private int oldBookDiscount10;
	private int oldBookDiscount20;
	private int oldBookDiscount30;
	private int oldBookDiscount40;
	private int oldBookDiscount50;
	
	// Getter
	
	public int getOldBookPk() {
		return oldBookPk;
	}

	public int getOldBookDiscount10() {
		return oldBookDiscount10;
	}

	public int getOldBookDiscount20() {
		return oldBookDiscount20;
	}

	public int getOldBookDiscount30() {
		return oldBookDiscount30;
	}

	public int getOldBookDiscount40() {
		return oldBookDiscount40;
	}

	public int getOldBookDiscount50() {
		return oldBookDiscount50;
	}
	
	// Setter
	
	public void setOldBookPk(int oldBookPk) {
		this.oldBookPk = oldBookPk;
	}

	public void setOldBookDiscount10(int oldBookDiscount10) {
		this.oldBookDiscount10 = oldBookDiscount10;
	}

	public void setOldBookDiscount20(int oldBookDiscount20) {
		this.oldBookDiscount20 = oldBookDiscount20;
	}

	public void setOldBookDiscount30(int oldBookDiscount30) {
		this.oldBookDiscount30 = oldBookDiscount30;
	}

	public void setOldBookDiscount40(int oldBookDiscount40) {
		this.oldBookDiscount40 = oldBookDiscount40;
	}

	public void setOldBookDiscount50(int oldBookDiscount50) {
		this.oldBookDiscount50 = oldBookDiscount50;
	}
	
	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		result+="oldBookPk : "+oldBookPk+"\n";
		result+="oldBookDiscount10 : "+oldBookDiscount10+"\n";
		result+="oldBookDiscount20 : "+oldBookDiscount20+"\n";
		result+="oldBookDiscount30 : "+oldBookDiscount30+"\n";
		result+="oldBookDiscount40 : "+oldBookDiscount40+"\n";
		result+="oldBookDiscount50 : "+oldBookDiscount50+"\n";
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
			} else if (oldBookDTO.getOldBookDiscount10() != this.oldBookDiscount10) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount20() != this.oldBookDiscount20) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount30() != this.oldBookDiscount30) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount40() != this.oldBookDiscount40) {
				return false;
			} else if (oldBookDTO.getOldBookDiscount50() != this.oldBookDiscount50) {
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
		int hashCode=1;
		hashCode = 31 * hashCode + this.oldBookPk;
		hashCode = 31 * hashCode + this.oldBookDiscount10;
		hashCode = 31 * hashCode + this.oldBookDiscount20;
		hashCode = 31 * hashCode + this.oldBookDiscount30;
		hashCode = 31 * hashCode + this.oldBookDiscount40;
		hashCode = 31 * hashCode + this.oldBookDiscount50;
		
		return hashCode;
	}
}