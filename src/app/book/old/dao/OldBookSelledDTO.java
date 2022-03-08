package app.book.old.dao;

import app.book.dao.BookDTO;

/**OldBookSelledDTO 는 old_book_selled 테이블 전용 DTO 입니다. <br>
 * 이는 총 1 (FK) + 1 (PK) + 1 개의 칼럼을 가집니다. <br><br>
 * 
 * 1. bookPk				= (BookDTO) this.getBookPk <br>
 * 2. oldBookSelledPk		= this.getOldBookSelledPk() <br>
 * 3. oldBookSelledCount	= this.getOldBookSelledCount() <br>
 * 
 * @author unchaptered
 * @version 2022-03-08
 */
public class OldBookSelledDTO extends BookDTO {
	
	// Field Variables
	
	private int oldBookSelledPk;
	private int oldBookSelledCount;
	
	// Getter

	public int getOldBookSelledPk() {
		return oldBookSelledPk;
	}
	public int getOldBookSelledCount() {
		return oldBookSelledCount;
	}
	
	// Setter
	
	public void setOldBookSelledPk(int oldBookSelledPk) {
		this.oldBookSelledPk = oldBookSelledPk;
	}
	public void setOldBookSelledCount(int oldBookSelledCount) {
		this.oldBookSelledCount = oldBookSelledCount;
	}

	// Common Method Override
	
	/**편의 상의 목적으로 toString() 이 재정의 되었습니다.
	 */
	@Override
	public String toString() {
		String result=null;
		result+="oldBookPk : "+oldBookSelledPk+"\n";
		result+="oldBookSelled10 : "+oldBookSelledCount+"\n";
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
			} else if (oldBookSelledDTO.getOldBookSelledCount() != this.oldBookSelledCount) {
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
		hashCode = 31 * hashCode + this.oldBookSelledCount;
		
		return hashCode;
	}
}