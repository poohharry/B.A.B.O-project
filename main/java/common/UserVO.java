package common;

public class UserVO {
//	private int mNum;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String pNum;
	private String signUpDate;
	private int lgnFailCnt;
	private String changePwDate;
	private String lastLoginDate;
	private String isBiz;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getSignUpDate() {
		return signUpDate;
	}
	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}
	public int getLgnFailCnt() {
		return lgnFailCnt;
	}
	public void setLgnFailCnt(int lgnFailCnt) {
		this.lgnFailCnt = lgnFailCnt;
	}
	public String getChangePwDate() {
		return changePwDate;
	}
	public void setChangePwDate(String changePwDate) {
		this.changePwDate = changePwDate;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getIsBiz() {
		return isBiz;
	}
	public void setIsBiz(String isBiz) {
		this.isBiz = isBiz;
	}

	
	
}
