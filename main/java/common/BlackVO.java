package common;

public class BlackVO {
	private int mNum;				// 유저 고유번호
	private String id;				// 유저 id
	private String appointDate;		// 블랙리스트 등록날짜
	private String freeDate;		// 블랙리스트 해제 예정 날짜
	private String reason;			// 블랙리스트 등록 사유
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(String appointDate) {
		this.appointDate = appointDate;
	}
	public String getFreeDate() {
		return freeDate;
	}
	public void setFreeDate(String freeDate) {
		this.freeDate = freeDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
