package app.book.old.dao;

import app.book.dao.BookDTO;

/**OldBookSelledDTO 는 old_book_selled 테이블 전용 DTO 입니다.<br>
 * 이는 총 1 + 1 + 5 개의 칼럼을 가집니다.<br>
 * 
 * 1. new_book_pk ((BookDTO) OldBookDTO.getBookPk)<br>
 * 2. old_book_pk (OldBookDTO.getOldBookPk)<br>
 * 3. old_book_selled_10 (OldBookDTO.getOldBookSelled10)<br>
 * 4. old_book_selled_20 (OldBookDTO.getOldBookSelled20)<br>
 * 5. old_book_selled_30 (OldBookDTO.getOldBookSelled30)<br>
 * 6. old_book_selled_40 (OldBookDTO.getOldBookSelled40)<br>
 * 7. old_book_selled_50 (OldBookDTO.getOldBookSelled50)<br>
 * 
 * @author unchaptered
 * @version 2022-02-25
 */
public class OldBookSelledDTO extends BookDTO {
	
	// Field Variables
	
	private int oldBookSelledPk;
	private int oldBookSelled10;
	private int oldBookSelled20;
	private int oldBookSelled30;
	private int oldBookSelled40;
	private int oldBookSelled50;
	
	// Getter

	public int getOldBookSelledPk() {
		return oldBookSelledPk;
	}
	public int getOldBookSelled10() {
		return oldBookSelled10;
	}
	public int getOldBookSelled20() {
		return oldBookSelled20;
	}
	public int getOldBookSelled30() {
		return oldBookSelled30;
	}
	public int getOldBookSelled40() {
		return oldBookSelled40;
	}
	public int getOldBookSelled50() {
		return oldBookSelled50;
	}
	
	// Setter
	
	public void setOldBookSelledPk(int oldBookSelledPk) {
		this.oldBookSelledPk = oldBookSelledPk;
	}
	public void setOldBookSelled10(int oldBookSelled10) {
		this.oldBookSelled10 = oldBookSelled10;
	}
	public void setOldBookSelled20(int oldBookSelled20) {
		this.oldBookSelled20 = oldBookSelled20;
	}
	public void setOldBookSelled30(int oldBookSelled30) {
		this.oldBookSelled30 = oldBookSelled30;
	}
	public void setOldBookSelled40(int oldBookSelled40) {
		this.oldBookSelled40 = oldBookSelled40;
	}
	public void setOldBookSelled50(int oldBookSelled50) {
		this.oldBookSelled50 = oldBookSelled50;
	}

	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		result+="oldBookPk : "+oldBookSelledPk+"\n";
		result+="oldBookSelled10 : "+oldBookSelled10+"\n";
		result+="oldBookSelled20 : "+oldBookSelled20+"\n";
		result+="oldBookSelled30 : "+oldBookSelled30+"\n";
		result+="oldBookSelled40 : "+oldBookSelled40+"\n";
		result+="oldBookSelled50 : "+oldBookSelled50+"\n";
		return result;
	}
	
	/**자식 클래스의 필드 멤버변수 비교를 통해 equals() 를 재정의하였습니다.<br>
	 * 부모 클래스인 BookDTO 의 equals() 가 재정의되면 이를 반영해야 합니다.
	 * 
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof OldBookSelledDTO) {
			OldBookSelledDTO oldBookSelledDTO = (OldBookSelledDTO) obj;
			
			if (oldBookSelledDTO.getOldBookSelledPk() != this.oldBookSelledPk) {
				return false;
			} else if (oldBookSelledDTO.getOldBookSelled10() != this.oldBookSelled10) {
				return false;
			} else if (oldBookSelledDTO.getOldBookSelled20() != this.oldBookSelled20) {
				return false;
			} else if (oldBookSelledDTO.getOldBookSelled30() != this.oldBookSelled30) {
				return false;
			} else if (oldBookSelledDTO.getOldBookSelled40() != this.oldBookSelled40) {
				return false;
			} else if (oldBookSelledDTO.getOldBookSelled50() != this.oldBookSelled50) {
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
		hashCode = 31 * hashCode + this.oldBookSelledPk;
		hashCode = 31 * hashCode + this.oldBookSelled10;
		hashCode = 31 * hashCode + this.oldBookSelled20;
		hashCode = 31 * hashCode + this.oldBookSelled30;
		hashCode = 31 * hashCode + this.oldBookSelled40;
		hashCode = 31 * hashCode + this.oldBookSelled50;
		
		return hashCode;
	}
}