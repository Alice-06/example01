package memo.model.dto;

import java.sql.Date;

public class MemoDTO {
	private int no;
	private String name;
	private String memo;
	private String regiDate;
	private Date regiDate2;
	//private Date regiDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public Date getRegiDate2() {
		return regiDate2;
	}
	public void setRegiDate2(Date regiDate2) {
		this.regiDate2 = regiDate2;
	}
	
	

	
}
